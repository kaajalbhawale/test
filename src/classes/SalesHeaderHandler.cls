/*
*    Description : Apex TriggerHandler on SalesHeade
*
*    Version        Author            Date            Description
*  
*    1.0            Kaajal Bhawale    08/3/2016      Initial Draft
*/
public class SalesHeaderHandler {
    
    //Call to Service method After insertion of SalesHeader
    public void onAfterInsert(){
        new SalesTriggerHelper().newCaseCreation();
    }
    
    //Call to Service method after update of SalesHeaderField
    public void onAfterUpdate(){
        new SalesTriggerHelper().newCaseCreation();
    }
}