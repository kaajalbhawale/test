public with sharing class Query {
  public void  first()
  {
		List<Contact> contactList = [SELECT Name, Id, Email FROM Contact];
		System.debug(contactList);
  
  }
  
  public void second()
  {
  		Map<Id,User> UserMap = new Map<Id,User>([SELECT Id,Username FROM User where isActive= true ]);
		System.debug(UserMap);
  
  }
  
  public void third()
  {
  
  		map<String,Account> map1 = new map<String,Account>([select ID,Name from Account]);
	 	system.debug(map1);
	 
	 	map<ID,Account> map2 = new map<ID,Account>([select ID,Name from Account]);
	 	system.debug(map2);

  }
  
  
  public void four()
  {
  		list <Account> Acc1=[select Id,name from account where Enrollment_Year__c includes ('2010')];
   		system.debug(Acc1);
   
    	list <Account> Acc2=[select Id,name from account where Enrollment_Year__c includes ('2013','2014')];
   		system.debug(Acc2);
    }
    
    public void five()
    {
   		 list <Account> Acc= [Select Name FROM Account where BillingState NOT IN ('Maharashtra','Kerala')
    	 ORDER BY Name DESC NULLS LAST limit 10000];
 		system.debug(Acc);
    }
    
    public void six()
    {
    	list <opportunity> Acc=[select id ,name from opportunity where (amount > 10000) and  (isDeleted = true) order by CreatedDate ASC limit 100 offset 50];
    	system.debug(Acc);
    }   
       
}