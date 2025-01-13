public class ProductListingController {
    public List<Product__c> products { get; set; }
    public String searchKeyword { get; set; }
    public Map<Id, Integer> selectedQuantities { get; set; }
    public Id selectedProductId { get; set; }
    public List<SelectOption> quantityOptions { get; set; }
    
    public ProductListingController() {
        products = [SELECT Id, Name, Price__c, ImageURL__c FROM Product__c ];
        selectedQuantities = new Map<Id, Integer>();
        for (Product__c product : products) {
            selectedQuantities.put(product.Id, 1);
        }
        quantityOptions = new List<SelectOption>();
        for (Integer i = 1; i <= 10; i++) {
            quantityOptions.add(new SelectOption(String.valueOf(i), String.valueOf(i)));
        }
    }
    public Integer getCartSize() {
        
        AggregateResult result = [SELECT SUM(Quantity__c) counter FROM CartItem__c WHERE CreatedById = :UserInfo.getUserId()];
        
        // Extract the sum from the AggregateResult
        Decimal sum = (Decimal)result.get('counter');
        
        // Convert the sum to Integer and return
        return sum != null ? sum.intValue() : 0;
    }
    public PageReference addToCart() {
        CartItem__c cartItem = new CartItem__c(
            Product__c = selectedProductId,
            Quantity__c = selectedQuantities.get(selectedProductId)
        );
        insert cartItem;
        return null;
    }
    
    public void searchProducts() {
        products = [SELECT Id, Name, Price__c, ImageURL__c FROM Product__c WHERE Name LIKE :('%' + searchKeyword + '%')];
    }
}