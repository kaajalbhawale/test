/*
*    Description : Class to perform Parent to child relationship 
*
*    Version        Author            Date            Description
*  
*    1.0            Kaajal Bhawale    03/04/2015      Initial Draft
*/
        public class Parenttochild {

            //Query on Account and find all associated contact records of the
            // Account which contains the word 'John'
            public void associatedContact(){
                list<account> listAccount = [SELECT id,
                                                    name,
                                                    (SELECT name 
                                                     FROM contacts
                                                     WHERE firstname = 'John') 
                                             FROM account 
                                             WHERE id IN 
                                                      (SELECT accountid 
                                                       FROM contact 
                                                       WHERE firstname = 'John')];
                if(!listAccount.isEmpty()){
                    System.debug('all associated contact records that contains word John:' 
                                        + listAccount);
                }//end of if
                else{
                    System.debug('No associated contact records that contains word John:'); 
                }//end of else
            }//end of associated contact method


            //query to find all Account records which have at least an opportunity 
            //record which is 'Closed Won'.
             public void accountRecord(){
                List <Account> listAccount = new List<Account> ([SELECT name , 
                                                                        (SELECT name 
                                                                         FROM opportunities 
                                                                         WHERE stagename 
                                                                                   = 'Closed Won') 
                                                                 FROM account 
                                                                 WHERE id in 
                                                                        (SELECT accountid 
                                                                        FROM opportunity 
                                                                        WHERE stagename 
                                                                            = 'Closed Won')]);
                if(!listAccount.isEmpty()){
                    system.debug('All Account records with least opportunity closed won'
                                    +listAccount);
                }//end of if
                else
                {
                    system.debug('No Account records with least opportunity closed won');
                }//end of else
             }//end of accountRecord 


            //query on 'A' and retrieve all parents with all their child
            // records where in child name is 'John'.
            public void customRecord(){
                List <A__c>  listAObject = ([SELECT id,
                                              name, 
                                              (SELECT name 
                                              FROM C__r 
                                              WHERE name ='John') 
                                      FROM A__c
                                      WHERE id in 
                                            (SELECT A__c 
                                            FROM C__c 
                                            WHERE name ='John')]);
                if(!listAObject.isEmpty()){
                    System.debug('All records of child where name is john' +listAObject);
                }//end of if
                else
                {
                    System.debug('No records of child where name is john');
                }//end of else    
            }//end of customRecord 


    //Find the word 'test' in all name fields returning Contact, Account, Lead and User.
    public void allRecords(){
        List<List<SObject>> listAllObject = new List<List<SObject>> ([find 'test' in all fields returning  Contact, Account, Lead , User]);
        system.debug(listAllObject);
    }
}