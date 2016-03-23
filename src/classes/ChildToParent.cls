/*
*    Description : Class to perform queries for child to parent relationship 
*
*    Version        Author            Date            Description
*  
*    1.0            Kaajal Bhawale    04/03/2015      Initial Draft
*/
      public class ChildToParent {

            //Query on Contact to retrieve all active contacts belonging to 'media' Industry.
            public void retrieveContact(){
                list<contact> listContact = [SELECT id,
                                                     name,
                                                     account.name 
                                              FROM Contact 
                                              WHERE Contact.Account.Active__c = 'Yes' 
                                              AND contact.Account.Industry = 'Media'];
                if(!listContact.isEmpty()){
                    System.debug('The active contacts belonging to media Industry' + listContact);
                 }//end of if
               else{
                    System.debug('There is no active contacts belonging to media Industry');
                }//end of else
            }//end of retrieve method
    
            //Query to retrieve all records of 'C' with name 'John' along with parent details.
            public void retrieveCObject(){
                list<C__c> listJunction = [SELECT C__c.Name, 
                                                  C__c.A__r.name, 
                                                  C__c.B__r.name 
                                           FROM C__c 
                                           WHERE C__c.Name like 'John%'];
               if(!listJunction.isEmpty()){
                 System.debug('All records with name John along with parent details'+listJunction);
               }//end of if
               else{
                   System.debug('No records with name John along with parent details');
               }//end of else     
            }//end of retrieveObject method
      }//end of child to parent class