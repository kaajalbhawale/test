public class ContactTriggerHandle {
    
      public void onBeforeInsert(List<Contact> ListContactReceived){
        String[] searchEmailKey=(ListContactReceived.get(0).email).split('@');
        List<Account> ListAccount = [SELECT name 
                                      FROM Account 
                                      WHERE Domain__c =: searchEmailKey[1]  
                                      LIMIT 1];
        system.debug(searchEmailKey[1]);
        system.debug(ListAccount);
        for(Contact contactIndex : ListContactReceived)
        {
            for(Account accountIndex:ListAccount)
            {
                contactIndex.accountID = accountIndex.Id;
            }
        }
    }    
    
}