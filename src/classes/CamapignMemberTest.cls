/*
*    Description : Apex Test on Campaign Member
*
*    Version        Author            Date            Description
*  
*    1.0            Kaajal Bhawale    07/3/2016      Initial Draft
*/

@isTest
public class CamapignMemberTest {
    static testmethod void checkRsvp(){

     /*   List<Lead> leadList = new List<Lead>();

        //adding Record for Account
        for(Integer recordIndex = 0 ;recordIndex < 300 ; recordIndex++){
        
         leadList.add(new Lead(Company = 'Eternus' +recordIndex,
                               Status = 'Working Contacted',
                               RSVP__c = 'RSVP status Replied'));
           
        }//end of for       
         

        //Adding Records for contacts and its associted domain from email
        List<CampaignMember> listCampaignMember = new List<CampaignMember>();
        for(Integer recordIndex = 0 ;recordIndex < 300 ;recordIndex ++ ){
    
            listCampaignMember.add( new CampaignMember(Campaign = 'Hello World Campaign'+recordIndex,
                                         Lead = 'priyanka' +recordIndex,
                                         status = 'sent',
                                         CompanyOrAccount = 'Eternus',
                                         RSVP__c = '' ));            
        }//end of for  
        
        
        test.startTest();
        insert leadList;
        insert listCampaignMember;
        test.stopTest();*/
       /*
        List<Contact> insertedContacts = [SELECT Id, Name, Email, Contact.Accountid
                                          FROM Contact
                                          WHERE Id IN :listContact];
        Map<Id,Account> insertedAccounts = new Map<Id,Account>([SELECT Id, DomainName__c
                                                                FROM Account
                                                                WHERE Id IN :listAccount]);

        for(Contact contactObj : insertedContacts)
        {    
             System.assertEquals(true,insertedAccounts.containsKey(contactObj.Accountid),'Error in insertion');
        }//end of for
         
     }//end of method
     
     
    //Test Method to test if account email field is empty and list has an email 
    static testmethod void oneEmptyDomainFieldTest(){

        List<Account> listAccount = new List<Account>();

        //adding Record for Account
        for(Integer recordIndex = 0 ;recordIndex < 300 ; recordIndex++){
        
         listAccount.add(new Account(Name = 'Pari'+recordIndex,
                                     Email__c = ''));
           
        }//end of for  */
        
    }         
 }