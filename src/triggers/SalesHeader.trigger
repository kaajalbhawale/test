/*
*    Description : Apex Trigger on SalesHeader
*
*    Version        Author            Date            Description
*  
*    1.0            Kaajal Bhawale    07/3/2016      Initial Draft
*/


trigger SalesHeader on SalesHeader__c (after insert, after update) {
    if(trigger.isAfter) {
        if(trigger.isinsert) {
           new SalesHeaderHandler().onAfterInsert();
         }//end of if
        if(trigger.isupdate){
           new SalesHeaderHandler().onAfterUpdate(); 
        }//end of if
    } //end of if   
}