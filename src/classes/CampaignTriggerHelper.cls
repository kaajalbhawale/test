/*
*    Description : Apex Service Trigger on CampaignTriggerHelper
*
*    Version        Author            Date            Description
*  
*    1.0            Kaajal Bhawale    08/3/2016      Initial Draft
*/

public class CampaignTriggerHelper {
    public void compaignMemberRSVPUpdate(){

        //Find Lead Associated with the CampaignMember  
        List<Id> campaignMemberLead  = new List<Id>();
        for(CampaignMember campaignMemberObject : (List<CampaignMember>)Trigger.new){         
           campaignMemberLead.add(campaignMemberObject.LeadId);
        }    
                  
         //Get RSVP Field for Lead asscoiated with Campaign Member
         Map<Id,String> leadRsvpIdMap = new Map<Id,String>();
     
        //Find Associated Lead RSVP Field
         for(Lead leadObj : [SELECT Id,
                                    RSVP__c
                             FROM Lead
                             WHERE Id IN :campaignMemberLead
                             AND RSVP__c != NULL]){
                             
                leadRsvpIdMap.put(leadObj.Id,leadObj.RSVP__c);               
                
            }//end of for
       
       
        //Associating RSVP field value of Lead to Contact RSVP field 
        for(CampaignMember campaignMemberLeadObj :(List<CampaignMember>) Trigger.new){
            if(String.isBlank(String.valueOf(campaignMemberLeadObj.get('RSVP__c'))) &&
               leadRsvpIdMap.containsKey(campaignMemberLeadObj.LeadId))
            { 
                campaignMemberLeadObj.put('RSVP__C',leadRsvpIdMap.get(campaignMemberLeadObj.LeadId));
                system.debug('Check RSVP and Values' +campaignMemberLeadObj); 
             }//end of if
         }//end of for          
            
       }//end of Method   
}//end of