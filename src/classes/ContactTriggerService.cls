/*
*    Description : Apex Service Trigger on Contact 
*
*    Version        Author            Date            Description
*  
*    1.0            Kaajal Bhawale    08/3/2016      Initial Draft
*/

public class ContactTriggerService {
    public void domainBasedAllocation(){

        //Set to store Domain of Contact Email  
        Set<String> contactDomainSet = new Set<String>();
      
     
        // Split Contact Email & get the doamin
        for(sObject contactIndex : Trigger.new){
            if(String.isNotBlank(String.valueOf(contactIndex.get('email'))))
            {
                String emailString = String.valueOf(contactIndex.get('email'));
                contactDomainSet.add(emailString.subString(emailString.indexOf('@')+1,emailString.length()));
             }//end of if
            else{
                system.debug('No Email Speciifed');
              }
        }//end of for     
                
     
      
        Map<String,Id> domainAccountIdMap = new Map<String,Id>();
     
        //Find Associated account with contact domain 
         for(Account accountIndex : [SELECT Id,
                                             DomainName__c
                                     FROM Account
                                     WHERE  DomainName__c IN :contactDomainSet]){
                             
                domainAccountIdMap.put(accountIndex.DomainName__c,accountIndex.Id);
            }//end of for
       
        //Associating Contact with Account
        for(sObject contactIndex : Trigger.new){
            if(String.isNotBlank(String.valueOf(contactIndex.get('email'))))
            { 
               String emailString = String.valueOf(contactIndex.get('email'));
               String domainString = emailString.subString(emailString.indexOf('@')+1,emailString.length());
              
               if(domainAccountIdMap.containsKey(domainString)){
                   contactIndex.put('AccountId',domainAccountIdMap.get(domainString));
               }//end of if
              
            }//end of if
        }//end of for
    }//end of Method   
}//end of class