public class CartController {
    public List<CartItem__c> cartItems { get; set; }
    public Id selectedItemId { get; set; }
    public Order__c newOrder { get; set; }
    public Boolean orderGenerated{get;set;}
   
    public CartController() {
        loadCartItems();
        orderGenerated = false;
    }
    
    private void loadCartItems() {
        cartItems = [SELECT Id, Product__c, Product__r.Name, Product__r.Price__c, Quantity__c
                     FROM CartItem__c WHERE CreatedById = :UserInfo.getUserId()];
    }
    
    public void removeFromCart() {
        CartItem__c cartItem = [SELECT Id FROM CartItem__c WHERE Id = :selectedItemId ];
        if (cartItem != null) {
            delete cartItem;
            loadCartItems();
        }
    }
    
    public Decimal getTotalAmount() {
        Decimal total = 0;
        for (CartItem__c item : cartItems) {
            total += item.Product__r.Price__c * item.Quantity__c;
        }
        return total;
    }
    
    public Integer getCartSize() {
        AggregateResult result = [SELECT SUM(Quantity__c) counter FROM CartItem__c WHERE CreatedById = :UserInfo.getUserId()];
        Decimal sum = (Decimal)result.get('counter');
        return sum != null ? sum.intValue() : 0;
    }
    
    public PageReference placeOrder() {
        // Create a new Order record
        newOrder = new Order__c();
        newOrder.Total_Amount__c = getTotalAmount();
        newOrder.No_of_Items__c = getCartSize();
        insert newOrder;
        
        // Create Order Items
        List<Order_Item__c> orderItems = new List<Order_Item__c>();
        for (CartItem__c cartItem : cartItems) {
            Order_Item__c orderItem = new Order_Item__c();
            orderItem.Order__c = newOrder.Id;
            orderItem.Product__c = cartItem.Product__c;
            orderItem.Quantity__c = cartItem.Quantity__c;
            orderItem.Price__c = cartItem.Product__r.Price__c;
            orderItem.Amount__c = cartItem.Product__r.Price__c * cartItem.Quantity__c;
            orderItems.add(orderItem);
        }
        insert orderItems;
        
        // Clear the cart
        for (CartItem__c item : cartItems) {
            delete item;
        }
        
        // Reload the cart items to reflect changes
        loadCartItems();
         orderGenerated = true;
        return null;
    }
}