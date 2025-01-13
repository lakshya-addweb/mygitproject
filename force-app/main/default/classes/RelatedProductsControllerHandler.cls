public class RelatedProductsControllerHandler {
    @AuraEnabled(cacheable=true)
    public static List<Productt__c> getProductCatalog() {
        Id loggedInUserId = UserInfo.getUserId();
        return [SELECT Id, Name, Product_Name__c, Image__c FROM Productt__c WHERE CreatedById = :loggedInUserId];
    }
}