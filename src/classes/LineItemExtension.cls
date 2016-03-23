public class LineItemExtension
{
    public List<Line_item__c> lineItemList = new List<Line_item__c>();
    public String currentId {get;set;}  
    
    ApexPages.StandardController sc1;     
    public LineItemExtension(ApexPages.StandardController controller)
    {
        currentId=ApexPages.currentPage().getParameters().get('id');
    }
    
     
    public List<Line_item__c> getlineItemList()
    {
        List<Line_item__c> productList = [select Price__c,Product_Name__c,Units__c,Service_Fee__c,tax__c,New_client_Discount__c,Labour__c,total__c from Line_item__c where Invoice_Statement__c =: currentId];
        system.debug(productList);
        return productList ;
    }
    
}