/*
*    Description : Apex Trigger on Campaign
*
*    Version        Author            Date            Description
*  
*    1.0            Kaajal Bhawale    07/3/2016      Initial Draft
*/
trigger CampaignTrigger on CampaignMember (before insert) {
    
    if(trigger.isBefore) {
        if(trigger.isinsert) {
            new CampaignTriggerHandler().beforeinsert();
        }//end of if
    }//end of if    
    
}