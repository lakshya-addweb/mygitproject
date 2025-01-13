public class RelatedProductsController {
    public List<Productt__c> relatedProducts { get; set; }
    
    public RelatedProductsController() {
        // Get the logged-in user's ID
        Id loggedInUserId = UserInfo.getUserId();
        
        // Fetch products related to the logged-in user based on CreatedById
        relatedProducts = [SELECT Id, Name,Product_Name__c, Image__c FROM Productt__c WHERE CreatedById = :loggedInUserId];
    }
}