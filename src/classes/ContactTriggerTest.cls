/*
*    Description : Apex Test on Contact
*
*    Version        Author            Date            Description
*  
*    1.0            Kaajal Bhawale    07/3/2016      Initial Draft
*/
@isTest
public class ContactTriggerTest {
    static testmethod void sameDomainTest(){

        List<Account> listAccount = new List<Account>();

        //adding Record for Account
        for(Integer recordIndex = 0 ;recordIndex < 300 ; recordIndex++){
        
         listAccount.add(new Account(Name = 'kashish'+recordIndex,
                                     Email__c = 'Kashish' +recordIndex +'@gmail.com'));
           
        }//end of for       
         

        //Adding Records for contacts and its associted domain from email
        List<Contact> listContact = new List<Contact>();
        for(Integer contactRecordIndex = 0 ;contactRecordIndex < 300 ;contactRecordIndex ++ ){
    
            listContact.add( new Contact(LastName = 'Pushkar'+contactRecordIndex,
                                         Email = 'pushkar' +contactRecordIndex +'@gmail.com'));            
        }//end of for  
        
        insert listAccount;
        test.startTest();
        insert listContact;
        test.stopTest();
        
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
           
        }//end of for       
         

        //Adding Records for contacts and its associted domain from email
        List<Contact> listContact = new List<Contact>();
        for(Integer contactRecordIndex = 0 ;contactRecordIndex < 300 ;contactRecordIndex ++ ){
    
            listContact.add( new Contact(LastName = 'Praju'+contactRecordIndex,
                                         Email = 'Prajur' +contactRecordIndex +'@eternus.com'));            
        }//end of for  
        
        insert listAccount;
        test.startTest();
        insert listContact;
        test.stopTest();
        
        List<Contact> insertedContacts = [SELECT Id, Name, Email, Contact.Accountid
                                          FROM Contact
                                          WHERE Id IN :listContact];
        Map<Id,Account> insertedAccounts = new Map<Id,Account>([SELECT Id, DomainName__c
                                                                FROM Account
                                                                WHERE Id IN :listAccount]);

        for(Contact contactObj : insertedContacts)
        {    
             System.assertEquals(false,insertedAccounts.containsKey(contactObj.Accountid),'Error in insertion');
        }//end of for
         
     }//end of method
     
     
    //Test method to test both account and contact has different email 
    static testmethod void DifferentDomainFieldTest(){

        List<Account> listAccount = new List<Account>();

        //adding Record for Account
        for(Integer recordIndex = 0 ;recordIndex < 300 ; recordIndex++){
        
         listAccount.add(new Account(Name = 'Kiran'+recordIndex,
                                     Email__c = 'Kiran' +recordIndex +'@rediffmail.com'));
           
        }//end of for       
         

        //Adding Records for contacts and its associted domain from email
        List<Contact> listContact = new List<Contact>();
        for(Integer contactRecordIndex = 0 ;contactRecordIndex < 300 ;contactRecordIndex ++ ){
    
            listContact.add( new Contact(LastName = 'Kirti'+contactRecordIndex,
                                         Email = 'Kirti' +contactRecordIndex +'@eternus.com'));            
        }//end of for  
        
        insert listAccount;
        test.startTest();
        insert listContact;
        test.stopTest();
        
        List<Contact> insertedContacts = [SELECT Id, Name, Email, Contact.Accountid
                                          FROM Contact
                                          WHERE Id IN :listContact];
        Map<Id,Account> insertedAccounts = new Map<Id,Account>([SELECT Id, DomainName__c
                                                                FROM Account
                                                                WHERE Id IN :listAccount]);

        for(Contact contactObj : insertedContacts)
        {    
             System.assertEquals(false,insertedAccounts.containsKey(contactObj.Accountid),'Error in insertion');
        }//end of for
         
     }//end of method
     
     //method to test where no contact email field is entered 
     static testmethod void noContactDomainFieldTest(){

        List<Account> listAccount = new List<Account>();

        //adding Record for Account
        for(Integer recordIndex = 0 ;recordIndex < 300 ; recordIndex++){
        
         listAccount.add(new Account(Name = 'Kiran'+recordIndex,
                                     Email__c = 'Kiran' +recordIndex +'@rediffmail.com'));
           
        }//end of for       
         

        //Adding Records for contacts and its associted domain from email
        List<Contact> listContact = new List<Contact>();
        for(Integer contactRecordIndex = 0 ;contactRecordIndex < 300 ;contactRecordIndex ++ ){
    
            listContact.add( new Contact(LastName = 'Kirti'+contactRecordIndex,
                                         Email = ''));            
        }//end of for  
        
        insert listAccount;
        test.startTest();
        insert listContact;
        test.stopTest();
        
        List<Contact> insertedContacts = [SELECT Id, Name, Email, Contact.Accountid
                                          FROM Contact
                                          WHERE Id IN :listContact];
        Map<Id,Account> insertedAccounts = new Map<Id,Account>([SELECT Id, DomainName__c
                                                                FROM Account
                                                                WHERE Id IN :listAccount]);

        for(Contact contactObj : insertedContacts)
        {    
             System.assertEquals(false,insertedAccounts.containsKey(contactObj.Accountid),'Error in insertion');
        }//end of for
         
     }//end of method
     
     
     
     
 }//end of class