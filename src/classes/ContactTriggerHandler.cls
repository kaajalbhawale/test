/*
*    Description : Apex TriggerHandler on Contact
*
*    Version        Author            Date            Description
*  
*    1.0            Kaajal Bhawale    08/3/2016      Initial Draft
*/

public class ContactTriggerHandler {
    public void onBeforeInsert(){       
        new ContactTriggerService().domainBasedAllocation();
    } //end of onBeforeInsert  
 }