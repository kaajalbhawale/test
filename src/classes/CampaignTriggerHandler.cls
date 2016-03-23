/*
*    Description : Apex TriggerHandler on Campaign
*
*    Version        Author            Date            Description
*  
*    1.0            Kaajal Bhawale    08/3/2016      Initial Draft
*/

public class CampaignTriggerHandler {
   
    public void beforeinsert(){
        new CampaignTriggerHelper().compaignMemberRSVPUpdate();
    }
}