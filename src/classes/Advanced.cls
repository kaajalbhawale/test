/*
*    Description : Class to perform all advanced queries 
*
*    Version        Author            Date            Description
*  
*    1.0            Kaajal Bhawale    03/03/2015      Initial Draft
*/

    public class Advanced {

    //Query on all Contact records & add all to the List 
    public void retrieveContact(){
        list<Contact> Listcontact = [ SELECT Id, 
                                             Name 
                                      FROM Contact];
        if(!Listcontact.isEmpty()){
            System.debug('The Contact List is : ' + Listcontact);
        }//end of if
        else{
            System.debug('The Contact List is empty');
        }
    }//End of retriveContact method


    //Query on all the associated contact records of the Account
    public void associatedContact(){
        list<Account> accountList = [SELECT account.Name,
                                            ( SELECT Contact.FirstName, 
                                                     Contact.LastName 
                                              FROM account.contacts) 
                                     FROM account];
        if(!accountList.isEmpty()){
            system.debug('The related list of contact with account ' + accountList);
        }//end of if
        else{
            System.debug('The Account List is empty');
        }//end of else
    }


    //Creation of Account , Contact, Lead , Opportunity record through DML operations 
    public void insertRecords(){
        Contact newContact = new Contact(LastName = 'Bhondve', 
                                         Phone = '9922442355');
        try{
            insert newContact;
            system.debug('Record is inserted');
        } 
        catch (DmlException e){
            system.debug('Error in inserting new contact');
        }

        //creation of new opportunity
        Opportunity newOpportunity = new Opportunity(Name = 'Harshal',
                                                     CloseDate = date.parse('05/11/2012'),
                                                     StageName = 'Negotiation/Review');
        try{
            insert newOpportunity;
            system.debug('Record is inserted');
        } 
        catch (DmlException e){
            system.debug('Error in inserting new opportunity');
        }

        //creation of new Account
        Account newAccount = new Account(Name ='Kanchan', 
                                        AccountNumber='334455',
                                        Description = 'This record is craeted by DML operation');
        try{
            insert newAccount;
            system.debug('Record is inserted');
        }
        catch (DmlException e){
            system.debug('Error in inserting new Account');
        }

        //creation of new Lead
        Lead newLead = new Lead(LastName = 'Sadik', 
                                Company = 'Eternus',
                                Description = 'This record is created by DML operation');
        try{
            insert newLead;
            system.debug('Record is inserted');
        }
        catch (DmlException e) 
        {
            system.debug('Error in inserting new Lead');
        }
    }


    //Query to show Parent Child relationship
    public void relationship(){
        list<Account> accountList = [SELECT account.Name,
                                            ( SELECT Contact.FirstName, 
                                                     Contact.LastName 
                                              FROM account.contacts) 
                                     FROM account];

         if(!accountList.isEmpty()){
                system.debug('The related list of contact with account ' + accountList);
         }
         else{
            System.debug('The Account List is empty');
        }//end of else
    }

     //Query to retrieve/print the User records where Active = true
    public void printMap(){
        Map<ID, User> UserMap = new Map<ID, User>([SELECT ID,
                                                          Username 
                                                   FROM User 
                                                   WHERE IsActive=True]);
        system.debug(UserMap); 
    }


    public void CreationOfAccountMap(){
     
        List<Account> ListAccount = new List<Account>([SELECT Name, 
                                                              id 
                                                       FROM Account]);
        Map<String,id> accountMap = new Map<String,id>();
        for(Account accountIndex : ListAccount)
        {
            accountMap.put(accountIndex.name, accountIndex.id);
        }
        system.debug(accountMap);
        
            
        map<ID,Account> accountMapList = new map<ID,Account>([SELECT ID,
                                                                     Name 
                                                              FROM Account]);
        system.debug(accountMapList);

    }

}