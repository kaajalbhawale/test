/*
*    Description : Apex Service Trigger on Opportunity to make clone of it
*
*    Version        Author            Date            Description
*  
*    1.0            Kaajal Bhawale    08/3/2016      Initial Draft
*/

public class OpportunityTriggerHelper {

    public void cloneOpportunityOnInsert(){
        //List that will store Cloned Opportunity
        List<Opportunity> ListNewClonedOpportunity = new List<Opportunity>();
        
        for( Opportunity opportunityObject :(List<Opportunity>)(trigger.new))
        {               
            if(opportunityObject.IsClone__c){            
                ListNewClonedOpportunity.add(opportunityObject.clone(false,true,true,false));              
            }//end of if
        }//end of for
        
        if(ListNewClonedOpportunity.size() > 0){
            insert ListNewClonedOpportunity;  
        }//end of if
        
    }//end of cloneOpportunityOnInsert        
       
}//end of class