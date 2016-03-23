/*
*    Description : Apex Trigger on Account to find duplicates records 
*
*    Version        Author            Date            Description
*  
*    1.0            Kaajal Bhawale    21/03/2016      Initial Draft
*/


trigger AccountTrigger on Account (before insert, before update){
    if(trigger.isBefore) {
        if(trigger.isinsert){
            system.debug('Intrigger is After');
            new AccountTriggerHandler().onBeforeInsert();
        }//end of if 
        if(trigger.isupdate){
            new AccountTriggerHandler().onBeforeUpdate();
        }//end of if      
    }//end of if 
  }//end of trigger