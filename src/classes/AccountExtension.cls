public class AccountExtension {

    private ApexPages.StandardController sController; 
    private Account getAccountRecord;
    public List<Account> accountList;
    public List<Contact> contactList {get;set;}
    public list <account> searchAccountList {get;set;}
    public list <Contact> contactSearchList {get;set;} 
    public String currentContactId{ get; set;}
    public List<Contact> deleteContact = new List<Contact>();
    public Integer count{get; set;}
    public String searchString {get;set;} 
    public List<String> searchAlpabet{get;set;}
    public String searchAll{get;set;} 
    public List<Contact> displayContactList {get;set;}
  
  
       
    public AccountExtension(ApexPages.StandardController controller) {       
        sController = controller; 
        getAccountRecord = (Account)controller.getRecord();
   
           
        searchAlpabet=new List<String>{'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','All'};
        searchAll = 'All';
        accountList = new List<Account>();
        contactList = new List<Contact>();     
        currentContactId = ApexPages.currentPage().getParameters().get('id'); 
        displayContactList=new List<Contact>([SELECT Id,Name,Phone,Email FROM Contact WHERE AccountId=:currentContactId ORDER BY Name ]); 
        contactSearchList =new List<Contact>();
        for(Contact objContact: displayContactList){
            if(searchAll.equals('All')){
                contactSearchList.add(objContact);
            }
            else{
                if((objContact.Name.startsWith(searchAll)) || (objContact.Name.startsWith(searchAll.toLowerCase()))){
                    contactSearchList.add(objContact);
                }                
            }
        }    
               
    }
    
    //Get List Of all Accounts
    public List<Account> getAccountList(){      
        accountList=[SELECT Id,
                      Name,
                      Phone,
                      Website,
                      Email__c,
                      industry,
                      AccountNumber 
               FROM Account];
               
       count = accountList.size();
      system.debug('Size-------------------'+count);
      return accountList;                        
   }

   //DeleteAll Contact 
   public pageReference deleteAll(){
    /*   deleteContact = [SELECT Id 
                        FROM Contact
                        WHERE AccountId=:currentContactId ];*/
        List<Contact> delContact=new List<Contact>(contactSearchList);                 
       delete delContact;
       PageReference referenceAccountList = new PageReference('/apex/AccountList');
       referenceAccountList.setredirect(True);
       return referenceAccountList;
   } 
   
    public void search(){   
       if(searchString.length() < 3)
       {
           ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Input at least 3 characters to perform search'));
           searchAccountList.clear();
       }//end of if
       else{
             String searchquery='SELECT name,Email__c,Phone,Website FROM account WHERE name like \''+searchString+'\'';  
             searchAccountList = Database.query(searchquery);
             if(searchAccountList.size() == 0){
                 ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'No Results Found !'));
             }
                           
      } //end of else  
      count = searchAccountList.size();
          
   }//end of search  
   
   public void clear(){  
       searchAccountList.clear();  
   }//end of clear 
   

   public void displayAlphabeticalSearch(){
        contactSearchList.clear();
        for(Contact objContact: displayContactList){
            if(searchAll.equals('All')){
                contactSearchList.add(objContact);
            }
            else{
                if((objContact.Name.startsWith(searchAll)) || (objContact.Name.startsWith(searchAll.toLowerCase()))){
                    contactSearchList.add(objContact);
                }                
            }
        }  

        if(contactSearchList.size()==0){
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'No Contacts to display !'));
         }      
        count = contactSearchList.size();
        
        
    } 
    
    public pageReference SaveNew(){
    
    try {  
            // Save the current sObject  
            sController.save();  
  
            // Get the Meta Data for Account  
            Schema.DescribeSObjectResult describeResult = sController.getRecord().getSObjectType().getDescribe();  
            // Create PageReference for creating a new sObject and add any inbound query string parameters.  
            PageReference pr = Page.AccountCreation;  
            // Don't redirect with the viewstate of the current record.  
            pr.setRedirect(true);  
            return pr;  
        } catch(Exception e) {  
            // Don't redirect if something goes wrong. May be a validation or trigger issue on save.  
            ApexPages.addMessages(e);  
            return null;  
        }  
    }  
 
    
   
   @RemoteAction
   public static void deleteContact(Id ContactId ) 
   {
      Contact deleteContactlist = [Select Id from Contact where Id=:ContactId ];
      delete deleteContactlist ;
   }      
}