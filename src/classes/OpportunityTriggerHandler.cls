/*
*    Description : Apex TriggerHandler on Opportunity
*
*    Version        Author            Date            Description
*  
*    1.0            Kaajal Bhawale    08/3/2016      Initial Draft
*/

public class OpportunityTriggerHandler {
     
     public void onAfterInsertUpdate(){
        if(CheckRecursion.runOnce()){
            new OpportunityTriggerHelper().cloneOpportunityOnInsert();
        }//end of if
     }//end of onAfterInsert Method   
 }