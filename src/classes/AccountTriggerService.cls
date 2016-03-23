public class AccountTriggerService {
    public void findDuplicateBeforeInsertUpdate(){                                       
                                
        Map<string,Account> accountPhoneMap = new Map<string,Account>();
        Map<string,Account> accountEmailMap = new Map<string,Account>();   
        Map<string,Account> accountNameMap = new Map<string,Account>();   
                
         //Find all records who are parents       
         for(Account accountData : [SELECT Name,Email__c,Phone 
                                    FROM Account 
                                    WHERE IsParent__c = TRUE]){     
         
             accountPhoneMap.put(accountData.Phone,accountData);   
             accountEmailMap.put(accountData.Email__c,accountData);
             accountNameMap.put(accountData.Name,accountData);                              
                    
         } //end of for      
         
         for (Account accountobj: (List<Account>)Trigger.new){
             if ((accountobj.Email__c != null) && (accountobj.Name != NULL) && (accountobj.Phone == NULL)){
               system.debug('Firstdebug');
                
                 if((accountEmailMap.containsKey(accountobj.Email__c)) &&
                 ((accountobj.Name ==  accountEmailMap.get(accountobj.Email__c).Name))){
                     system.debug('In first if');
                     accountobj.ParentId = accountEmailMap.get(accountobj.Email__c).Id; 
                                        
                 }//end of if
                 
                 else{
                     system.debug('Account');
                      system.debug('Account ' +accountobj.IsParent__c);
                      accountPhoneMap.put(accountobj.Phone,accountobj);   
                      accountEmailMap.put(accountobj.Email__c,accountobj);
                      accountNameMap.put(accountobj.Name,accountobj); 
                      accountobj.IsParent__c = TRUE;  
                      system.debug('Accountafter ' +accountobj.IsParent__c); 
                  }    
                 
              } 
              Else if((accountobj.Name != null) && (accountobj.Phone != NULL) && (accountobj.Email__c == NULL)){ 
                
                 if((accountNameMap.containsKey(accountobj.Name)) && 
                 ((accountobj.Phone ==  accountNameMap.get(accountobj.Name).Phone))) {
                      system.debug('In second if');
                      accountobj.ParentId = accountNameMap.get(accountobj.Name).Id;
                 }//end of if
                 else{
                     system.debug('Account');
                      system.debug('Account ' +accountobj.IsParent__c);
                      accountPhoneMap.put(accountobj.Phone,accountobj);   
                      accountEmailMap.put(accountobj.Email__c,accountobj);
                      accountNameMap.put(accountobj.Name,accountobj); 
                      accountobj.IsParent__c = TRUE;  
                      system.debug('Accountafter ' +accountobj.IsParent__c); 
                  }  
             }
           /*  
             Else if((accountobj.Email__c != null) && (accountobj.Phone != NULL) && (accountobj.Name == NULL)){    
                 
                 if((accountPhoneMap.containsKey(accountobj.Phone)) && 
                  ((accountobj.Email__c ==  accountEmailMap.get(accountobj.Phone).Email__c))) {
                      system.debug('In third if');
                      accountobj.ParentId = accountPhoneMap.get(accountobj.Phone).Id;
                 }//end of if
                 else{
                     system.debug('Account');
                      system.debug('Account ' +accountobj.IsParent__c);
                      accountPhoneMap.put(accountobj.Phone,accountobj);   
                      accountEmailMap.put(accountobj.Email__c,accountobj);
                      accountNameMap.put(accountobj.Name,accountobj); 
                      accountobj.IsParent__c = TRUE;  
                      system.debug('Accountafter ' +accountobj.IsParent__c); 
                  }  
             }  */ 
             Else if((accountobj.Email__c != null) && (accountobj.Phone != NULL) && (accountobj.Name != NULL) ){
                  //system.debug('Loop 1');
                  if((accountEmailMap.containsKey(accountobj.Email__c)) &&
                 ((accountobj.Name ==  accountEmailMap.get(accountobj.Email__c).Name))){
                     system.debug('In first if');
                     accountobj.ParentId = accountEmailMap.get(accountobj.Email__c).Id;                     
                 }//end of if
                 
                 //system.debug('Loop 2');
                Else if((accountNameMap.containsKey(accountobj.Name)) && 
                 ((accountobj.Phone ==  accountNameMap.get(accountobj.Name).Phone))) {
                      system.debug('In second if');
                      accountobj.ParentId = accountNameMap.get(accountobj.Name).Id;
                 }//end of if
                 
                //system.debug('Loop 3');
                Else if((accountPhoneMap.containsKey(accountobj.Phone)) && 
                 ((accountobj.Email__c ==  accountPhoneMap.get(accountobj.Phone).Email__c))) {
                      system.debug('In third if');
                      accountobj.ParentId = accountPhoneMap.get(accountobj.Phone).Id;
                 }//end of if
                 
                Else{
               
                   // system.debug('Account ' +accountobj.IsParent__c);
                    accountPhoneMap.put(accountobj.Phone,accountobj);   
                    accountEmailMap.put(accountobj.Email__c,accountobj);
                    accountNameMap.put(accountobj.Name,accountobj); 
                    accountobj.IsParent__c = TRUE;  
                    system.debug('Accountafter ' +accountobj.IsParent__c); 
                 }
              }      
              
                                                   
              
                 
                 
                 
             
       /*      
             Else if ((accountobj.Name != null) && ((accountobj.Phone != NULL)||(accountobj.Email__c != NULL))){
              system.debug('Firstdebug');
                 if((accountNameMap.containsKey(accountobj.Name)) && 
                 ((accountobj.Phone ==  accountEmailMap.get(accountobj.Name).Phone) ||(accountobj.Email__c ==  accountEmailMap.get(accountobj.Name).Email__c ))){
                      system.debug('In second if');
                      accountobj.ParentId = accountNameMap.get(accountobj.Name).Id;
                 }//end of if
             }//end of else if
             
             Else if ((accountobj.Phone != null) && ((accountobj.Email__c != NULL)||(accountobj.Name != NULL))){
              system.debug('Firstdebug');
                 if((accountPhoneMap.containsKey(accountobj.Phone)) && 
                  ((accountobj.Email__c ==  accountEmailMap.get(accountobj.Phone).Email__c) ||(accountobj.Email__c ==  accountEmailMap.get(accountobj.Phone).Name ))){
                      system.debug('In third if');
                      accountobj.ParentId = accountPhoneMap.get(accountobj.Phone).Id;
                 }//end of if
             }//end of else if
             
             
             Else if((accountEmailMap.containsKey(accountobj.Email__c)) && (accountNameMap.containsKey(accountobj.Name)) && (accountPhoneMap.containsKey(accountobj.Phone) ))
             {
                      system.debug('Account');
                      system.debug('Account ' +accountobj.IsParent__c);
                      accountPhoneMap.put(accountobj.Phone,accountobj);   
                      accountEmailMap.put(accountobj.Email__c,accountobj);
                      accountNameMap.put(accountobj.Name,accountobj); 
                      accountobj.IsParent__c = TRUE;  
                      system.debug('Accountafter ' +accountobj.IsParent__c);                  
             
             }//end of else*/
          }//end of for 
            
        }//end of method
        
   }//end of class