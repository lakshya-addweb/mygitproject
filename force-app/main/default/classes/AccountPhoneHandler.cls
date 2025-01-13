public class AccountPhoneHandler {
    public static void AccountPhone(List<Account> alist){
        for(Account a: alist){
            System.debug(a.Phone.length());
            if(a.Phone.length() != 10) {
               // a.addError('Phone number must be exactly 10 digits.');
            }
        }
    }
    public static void syncAddress(List<Account> allist) {
    for (Account acc : allist) {
        // Check if the Billing address fields are not null before copying
        if (acc.BillingStreet != null || acc.BillingCity != null || 
            acc.BillingState != null || acc.BillingPostalCode != null || 
            acc.BillingCountry != null) {
                
            // Only update if the Shipping address is different from the Billing address
            if (acc.ShippingStreet != acc.BillingStreet ||
                acc.ShippingCity != acc.BillingCity ||
                acc.ShippingState != acc.BillingState ||
                acc.ShippingPostalCode != acc.BillingPostalCode ||
                acc.ShippingCountry != acc.BillingCountry) {
                
                acc.ShippingStreet = acc.BillingStreet;
                acc.ShippingCity = acc.BillingCity;
                acc.ShippingState = acc.BillingState;
                acc.ShippingPostalCode = acc.BillingPostalCode;
                acc.ShippingCountry = acc.BillingCountry;
            }
        }
    }
}
    public static void ContactPhone(List<Account> acclist){
        List<Contact> clist= new List<Contact>();
        system.debug('AccountSize:'+acclist.size());
        for(Account acc : acclist){
            if(acc.Phone!= null){
                List<Contact> contacts = [Select Id ,Phone from Contact where AccountId =: acc.Id];
                system.debug('ContactSize:'+contacts.size());
                for(Contact con : contacts){
                    con.Phone = acc.Phone;
                    clist.add(con);
                }
            }
        }
        if(!clist.isEmpty()){
            update clist;
        }
    }
}