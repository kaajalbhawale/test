/*
*    Description : Apex TriggerHandler on Account to find whether any duplicates present for 
                   for account created or modified
*
*    Version        Author            Date            Description
*  
*    1.0            Kaajal Bhawale    21/03/2016      Initial Draft
*/


public class AccountTriggerHandler {
    public void onBeforeInsert(){
        system.debug('In trigger handler');
        new AccountTriggerService().findDuplicateBeforeInsert();
    }//end of afterInsert method
    
    public void onBeforeUpdate(){
        new AccountTriggerService().findDuplicateBeforeInsert();
    }//end of afterUpdate method
}