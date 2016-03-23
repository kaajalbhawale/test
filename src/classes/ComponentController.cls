public Class ComponentController
{
    public List<Account> accountList; 
    public List<Contact> contactList;
    public String currentContactId{ get; set;}
    public Integer size{get; set;}
       
    public ComponentController() {
        accountList = new List<Account>();
        contactList = new List<Contact>();

    }
    
    
    public List<Account> getAccountList(){
                accountList = [SELECT Id, 
                               Name, 
                               Phone, 
                               Website, 
                               Email__c, 
                               Industry, 
                               AccountNumber
                         FROM Account];
           size = accountList.size();
           system.debug('Size-------------------'+size);
           return accountList; 
                   
                     
            
       }
  
   
   
  
       public List<Contact> getContactList(){
           
          contactList=[SELECT Id, 
                          Name, 
                          Phone, 
                          Email                      
                   FROM Contact 
                   WHERE AccountId=:currentContactId];
             size = contactList.size();
             system.debug('Size- contact------------------'+size);
             return contactList; 
       } 
   /*
       public Integer getContactListSize(){
           return getAccountList().size();
       }
*/
}