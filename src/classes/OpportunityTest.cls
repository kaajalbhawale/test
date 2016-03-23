/*
*    Description : Apex TestCases on Opportunity
*
*    Version        Author            Date            Description
*  
*    1.0            Kaajal Bhawale    10/3/2016      Initial Draft
*/


@isTest
public class OpportunityTest {
    static testMethod void cloneOpportunityTest(){
        
        List<Opportunity> opportunityList = new List<Opportunity>();
        
        //insert new Opportunity to clone them
        for(Integer insertOpportunity = 0; insertOpportunity < 400 ;insertOpportunity++){
            Opportunity newOpportunity = new Opportunity(name = 'Shravani'+insertOpportunity,
                                                         StageName ='Closed Won', 
                                                         CloseDate = date.today(),
                                                         IsClone__c = true
                                                         );

            opportunityList.add(newOpportunity); 
        }
        

        Test.startTest();
        insert opportunityList;
        Test.stopTest();
        
        List<Opportunity> QueryResultSize = [Select id from Opportunity];
        
        system.assertEquals(800,QueryResultSize.size());
    }   
    
    
     //Method to test when IsClone__c = false 
     static testMethod void cloneOpportunityNegativeTest(){
         
         List<Opportunity> opportunityList = new List<Opportunity>();
        
        //insert new Opportunity to clone them
        for(Integer insertOpportunity = 0; insertOpportunity < 200 ;insertOpportunity++){
            Opportunity newOpportunity = new Opportunity(name = 'Payal'+insertOpportunity,
                                                         StageName ='Closed Won', 
                                                         CloseDate = date.today(),
                                                         IsClone__c = false
                                                         );

            opportunityList.add(newOpportunity); 
        }
        

        Test.startTest();
        insert opportunityList;
        Test.stopTest();
        
        List<Opportunity> QueryResultSize = [Select id from Opportunity];
        
        system.assertEquals(200,QueryResultSize.size());
        
    }    
    
}