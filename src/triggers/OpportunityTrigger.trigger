/*
*    Description : Apex Trigger on Opportunity to make clone of it
*
*    Version        Author            Date            Description
*  
*    1.0            Kaajal Bhawale    08/3/2016      Initial Draft
*/

trigger OpportunityTrigger on Opportunity (after insert,after update) {
    if(trigger.isAfter) {
        if((trigger.isinsert) || (trigger.isupdate)) {
            new OpportunityTriggerHandler().onAfterInsertUpdate();
        }//end of if       
    }//end of if 
  }//end of trigger