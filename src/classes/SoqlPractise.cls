/*
*    Description : Class to perform all SOQL operations 
*
*    Version        Author            Date            Description
*  
*    1.0            Kaajal Bhawale    03/03/2015      Initial Draft
*/

    public class SoqlPractise {

        //Query on all Contact records & add all to the List 
        public void retrieveContact()
        {
            list<Contact> Listcontact = [ SELECT Id , 
                                                 Name 
                                          FROM Contact];
            if(!Listcontact.isEmpty()){
                System.debug('The Contact List is : ' + Listcontact);
            }//end of if
            else{
                System.debug('The Contact List is empty');
            }

        }//End of retriveContact method


        //Query to retrieve/print the User records where Active = true
        public void printMap()
        {
            Map<ID, User> UserMap = new Map<ID, User>([SELECT ID,
                                                              Username 
                                                       FROM User 
                                                       WHERE IsActive=True]);
            system.debug(UserMap); 
        }//End of printMap method

        //Query on MAP
        public void mapTest()
        {
            Map<String,ID> accountMap = new Map<String,ID>();
            List<Account> listAccountId = [SELECT ID,
                                           Name 
                                    FROM Account];
            for(Account accountIndex: listAccountId)
            {
                Account accountList = [SELECT Name,
                                              ID 
                                       FROM Account
                                       WHERE ID =: accountIndex.ID];
                accountMap.put(accountList.Name, accountIndex.ID);
            }
            system.debug(accountMap); 

            map<ID,Account> accountMapList = new map<ID,Account>([SELECT ID,
                                                                         Name 
                                                                  FROM Account]);
            system.debug(accountMapList);
         }

        //All account records where for selected 'Enrollment Year'
        public void accountPicklist()
        {
            list <Account> listAccountEnrolment = [SELECT Id,
                                                      name 
                                               FROM account 
                                               WHERE Enrollment_Year__c 
                                               INCLUDES ('2010')];
            if(!listAccountEnrolment.isEmpty()){
                  system.debug('Name of account for Enrollment year 2010 : '+listAccountEnrolment);
            }//end of if
            else{
                System.debug('There is no record with Enrollment year 2010');
            }//end of else

            list <Account> listAccountYear = [SELECT Id,
                                                 name 
                                          FROM account 
                                          WHERE Enrollment_Year__c 
                                          INCLUDES ('2013','2014')];
            if(!listAccountYear.isEmpty()){
                system.debug('Name of account for Enrollment year 2013 and 2014 : ' +listAccountYear);
            }
            else{
                System.debug('There is no record with Enrollment year 2013 and 2014');
            }
            
        }


        //Query to find all Account records where 'Billing State' is not 'Maharashtra' and 'Kerala'.
        public void billingState()
        {
            list <Account> listAccountBilling = [SELECT Name 
                                             FROM Account 
                                             WHERE BillingState 
                                             NOT IN ('Maharashtra','Kerela')
                                             ORDER BY Name 
                                             DESC NULLS LAST 
                                             limit 10000];
            if(!listAccountBilling.isEmpty()){
                system.debug(listAccountBilling);
            }//end of if
            else{
                System.debug('There is no record with Billing state not maharshtra and kerela');
            }//end of else
        }   

        //SOQL query to display 100 opportunity records with amount greater than 10,000 order 
        //by created date
        public void opportunityTest()
        {
            list <opportunity> listOpportunity = [SELECT id ,
                                                         name 
                                                  FROM opportunity 
                                                  WHERE (amount > 10000 or  isDeleted = true) 
                                                  ORDER BY CreatedDate ASC 
                                                  LIMIT 100 offset 50];
            if(!listOpportunity.isEmpty()){
                system.debug('Record with amount greater than 10000' +listOpportunity);
            }
            else{
               system.debug('There is no Record with amount greater than 10000');
            }
        } 

}//End of class SoqlPractise