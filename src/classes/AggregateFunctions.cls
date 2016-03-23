/*
*    Description : Class to perform all aggregate function 
*
*    Version        Author            Date            Description
*  
*    1.0            Kaajal Bhawale    03/03/2015      Initial Draft
*/
    public class AggregateFunctions {

     //Write a SOQL query to retrieve sum of all closed Opportunity amount for current fiscal year.
         public void opportunityRecord(){           

           List<AggregateResult> listamountReference = new List<AggregateResult>([SELECT sum(amount) sumAmount,
                                                                                         fiscalYear fiscalYear,
                                                                                         StageName stage 
                                                                                  FROM Opportunity 
                                                                                  WHERE 
                                                                                  closeDate = 
                                                                                  THIS_FISCAL_YEAR and StageName = 'Closed Won'
                                                                                  GROUP BY fiscalYear,StageName ]);
                                                                                 
           Map<Integer, Integer> newMap = new Map<Integer, Integer>();
           for(AggregateResult aggregateResult: listamountReference)
           {
               newMap.put(Integer.ValueOf(aggregateResult.get('fiscalYear')), Integer.ValueOf(aggregateResult.get('sumAmount')));
               
           }// end for
           system.debug('Result is ---- > '+newMap);
         }         
         


        //Total number of distinct Lead records on basis of 'Lead Source' having greater than 10 leads.
        public void leadRecord(){
            List <AggregateResult> listLeadSource = [SELECT count(id),
                                                            leadsource 
                                                 FROM lead 
                                                 GROUP BY leadsource 
                                                 HAVING COUNT(leadsource) >10];
            system.debug(listLeadSource);
        }


        public void LeadStatus(){
    
            List<AggregateResult> listLeadByStatusBySource = [SELECT status,
                                                                     leadsource,
                                                                     count(name) countname 
                                                              FROM Lead 
                                                              GROUP BY status,leadsource];

            Map<String,Integer> innerMap;
            Map<String,Map<String,Integer>> mapLeadByStatusBySource = 
                                new Map<String,Map<String,Integer>>{};


            for(AggregateResult eachAggregateResult : listLeadByStatusBySource){
   
                   if(mapLeadByStatusBySource.containsKey((String)eachAggregateResult .get('Status'))){
                                    innerMap = mapLeadByStatusBySource.get((String)eachAggregateResult .get('Status'));
                                    innerMap.put((String)eachAggregateResult .get('LeadSource'),
                                                 (Integer)eachAggregateResult .get('countname')); 
                                    mapLeadByStatusBySource.put((String)eachAggregateResult .get('Status'),
                                                                 innerMap);                                                               
                          
                  }//end of if               
                  else{
                           mapLeadByStatusBySource.put((String)eachAggregateResult .get('Status'),
                           new Map<String,Integer>{(String)eachAggregateResult .get('LeadSource') => 
                                                   (Integer)eachAggregateResult .get('countname')});
                          
                      }           
               }
            System.debug('Result-------->'+mapLeadByStatusBySource);
   }//end of Leadstatus method
}