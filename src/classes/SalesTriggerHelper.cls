/*
*    Description : Apex Service Trigger on SalesHeader
*
*    Version        Author            Date            Description
*  
*    1.0            Kaajal Bhawale    08/3/2016      Initial Draft
*/

public class SalesTriggerHelper {
    
    public void newCaseCreation(){
        
       List<Case> listNewCase = new List<Case>();
       
       //Creation of new SalesHeader
       for(SalesHeader__c salesHeaderObject :(List<SalesHeader__c>)(trigger.newMap).values()){
           
           //Checking for status ,Picksatus and Amount as Initial Condition
           if(salesHeaderObject.Status__c =='Open' && 
              salesHeaderObject.Pick_status__c == 'Open' && 
              salesHeaderObject.Total_Amount__c > 300) {
              	
       			//Check for Other Criteria before creating new case
                if (SalesHeader__c.Bill_to_Street__c <> SalesHeader__c.Ship_to_Street__c || 
                SalesHeader__c.Bill_to_City__c <> SalesHeader__c.Ship_to_City__c ||
                SalesHeader__c.Bill_to_Postal_Code__c <> SalesHeader__c.Ship_to_Postal_Code__c ||
                SalesHeader__c.Bill_to_State__c <> SalesHeader__c.Ship_to_State__c) {

                    //Creation of new case
                     Case newCase = new Case();
                     newCase.AccountID = salesHeaderObject.Account__c;
                     newCase.ContactID = salesHeaderObject.Contact__c;
                     newCase.Origin = 'Internal';                    
                   
                     newCase.Reason = 'Unable to Cross Ship';
                     newCase.Priority = 'Medium';
                     newCase.Status = 'New';
                     newCase.Type = 'Unable to Cross Ship';
                     newCase.Subject =   newCase.Account.Name + newcase.Type;
                     newCase.Open_Sales_Order__c = salesHeaderObject.Id;
                     newCase.Sales_Order_Number__c = salesHeaderObject.Name;
                     
                    listNewCase.add(newCase);
                    
                    AssignmentRule assignmentobj  = new AssignmentRule();
                    assignmentobj = [Select id from AssignmentRule where SobjectType='Case' and Active = true Limit 1]; 
                    Database.DMLOptions dmo = new Database.DMLOptions();
                    dmo.assignmentRuleHeader.assignmentRuleId = assignmentobj.Id ;
                    newcase.setOptions(dmo);
                  
                    system.debug('case member is are '+listNewCase);
                }//end of if
            }//end of if
       }//end of for
       insert(listNewCase);
       
    }//end of method
    
}