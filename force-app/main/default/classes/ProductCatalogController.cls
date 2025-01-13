global without sharing class ProductCatalogController {
    @AuraEnabled(cacheable=true)
    public static List<Productt__c> getRelatedProducts() {
        // Fetch related products
        return [
            SELECT Id, Name, Product_Name__c, Image__c 
            FROM Productt__c
        ];
    }
}