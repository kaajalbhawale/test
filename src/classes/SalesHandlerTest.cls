/*
*    Description : Apex TestCases on SalesHeader
*
*    Version        Author            Date            Description
*  
*    1.0            Kaajal Bhawale    10/3/2016      Initial Draft
*/

@isTest
public with sharing class SalesHandlerTest {
    
    //Test to insert new Opportunity and check if new case is created 
    static testMethod void testAfterInsert(){
        
        List <Account> accountList = new List<account>();
          account accountobj = new account();
          accountobj.name = 'Satish';
          accountList.add(accountobj);
          insert accountList;
          
    	List<SalesHeader__c> salesHeaderList = new List<SalesHeader__c>();
    	SalesHeader__c salesHeaderRecord = new SalesHeader__c();
            salesHeaderRecord.Status__c ='Open';           
    		salesHeaderRecord.Pick_status__c = 'Open';
    		salesHeaderRecord.Total_Amount__c = 370;
    		
    		salesheaderRecord.Account__c = accountobj.Id;
    		salesHeaderRecord.Bill_to_Street__c = 'Street';
    		salesHeaderRecord.Bill_to_City__c = 'City';
    		salesHeaderRecord.Bill_to_Postal_Code__c = '411013';
    		salesHeaderRecord.Bill_to_State__c = 'Nagar';
    		salesHeaderRecord.Ship_to_Street__c = 'Street';
    		salesHeaderRecord.Ship_to_City__c = 'City Kanpur';
    		salesHeaderRecord.Ship_to_Postal_Code__c = '322190';
    		salesHeaderRecord.Ship_to_State__c = 'Maharshtra';
    		salesHeaderList.add(salesHeaderRecord);
    	
    	
    	
    	Test.startTest();	
		insert salesHeaderList;		
		Test.stopTest();
		
		List <Case> caseObj = new List<Case>([SELECT accountId 
		                                      FROM Case]); 

		system.assertEquals(salesHeaderList.get(0).Account__c,caseObj.get(0).accountId);
    	
    	
    }
    
    //Test Performed after updates
    static testMethod void testAfterUpdate(){
    	List<SalesHeader__c> salesHeaderList = new List<SalesHeader__c>();
    	SalesHeader__c salesHeaderRecord = new SalesHeader__c();
    		salesHeaderRecord.Status__c ='Open';
    		salesHeaderRecord.Pick_status__c = 'Open';
    		salesHeaderRecord.Total_Amount__c = 370;    		
    		salesHeaderRecord.Bill_to_City__c = 'Pune City';
    		salesHeaderRecord.Ship_to_City__c = 'Mumbai City ';
    		salesHeaderRecord.Bill_to_State__c = 'Nagar';
    		salesHeaderRecord.Ship_to_State__c = 'Maharshtra';
    		salesHeaderRecord.Ship_to_Street__c = 'Street';
    		salesHeaderRecord.Bill_to_Street__c = 'Street';
    		salesHeaderRecord.Ship_to_Postal_Code__c = '322190';
    		salesHeaderRecord.Bill_to_Postal_Code__c = '411013';
    		
    		salesHeaderList.add(salesHeaderRecord);
    	
    	
    	
    	Test.startTest();
    	insert salesHeaderList;
    	salesHeaderList[0].Ship_to_City__c = 'UpdatedCity';	
    	salesHeaderList[0].Total_Amount__c = 400;
		update salesHeaderList;
		
		Test.stopTest();
    	List <Case> caseObj = new List<Case>([SELECT accountId 
                                              FROM Case]); 

        system.assertEquals(salesHeaderList.get(0).Account__c,caseObj.get(0).accountId);
    	
    }
    
    
    //Test Performed after updates
    static testMethod void testSecondIf(){
        List<SalesHeader__c> salesHeaderList = new List<SalesHeader__c>();
        SalesHeader__c salesHeaderRecord = new SalesHeader__c();
            salesHeaderRecord.Status__c ='Open';
            salesHeaderRecord.Pick_status__c = 'Open';
            salesHeaderRecord.Total_Amount__c = 370;            
            salesHeaderRecord.Bill_to_City__c = 'Pune City';
            salesHeaderRecord.Ship_to_City__c = 'Mumbai City ';           
            salesHeaderList.add(salesHeaderRecord);

        Test.startTest();
        insert salesHeaderList;
                
        Test.stopTest();
        List <Case> caseObj = new List<Case>([SELECT accountId 
                                              FROM Case]); 

        system.assertEquals(salesHeaderList.get(0).Account__c,caseObj.get(0).accountId);
        
    }
    
    
}