@isTest
public class AccountExtensionClassTest
{
    static testMethod void AccountExtensionClassMethod()
    {
        List<Contact> contactObj = new List<Contact>{};
        for(Integer contactIndex = 1; contactIndex < 200; contactIndex++)
        {
           Contact contactRecord = new Contact(LastName='Sancheti' + contactIndex, Phone='993322111' + contactIndex, Email = 'sancheti'+contactIndex+'@gmail.com');
           
           contactobj.add(contactRecord);
        
        }
    
    
        List<Account> accountObj = new List<Account>{};
        for(Integer accountIndex = 1; accountIndex < 200; accountIndex++)
        {
           Account accountRecord = new Account(Name='Sakshi' + accountIndex, Phone='993322111' + accountIndex, Email__c = 'Sakshi'+accountIndex+'@gmail.com',Website = 'www.google.com');
           accountobj.add(accountRecord);
        
        }        
        
    }
    
}