/*
*    Description : Apex Trigger on Contact 
*
*    Version        Author            Date            Description
*  
*    1.0            Kaajal Bhawale    08/3/2016      Initial Draft
*/

trigger ContactTrigger on Contact (before insert) {

    if(trigger.isBefore) {
        if(trigger.isinsert) {
            new ContactTriggerHandler().onBeforeInsert();
        }//end of if
	}//end of if 
  }