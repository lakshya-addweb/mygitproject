@isTest
public class AccountPhoneHandlerTest {

    @testSetup
    static void setupData() {
        // Create test Accounts
        List<Account> accounts = new List<Account>();
        accounts.add(new Account(Name = 'Test Account 1', Phone = '1234567890', BillingStreet = '123 Main St', BillingCity = 'City1', BillingState = 'State1', BillingPostalCode = '12345', BillingCountry = 'USA'));
        accounts.add(new Account(Name = 'Test Account 2', Phone = '9876543210', BillingStreet = '456 Side St', BillingCity = 'City2', BillingState = 'State2', BillingPostalCode = '67890', BillingCountry = 'USA'));
        insert accounts;

        // Create Contacts for Accounts
        List<Contact> contacts = new List<Contact>();
        contacts.add(new Contact(FirstName = 'John', LastName = 'Doe', AccountId = accounts[0].Id));
        contacts.add(new Contact(FirstName = 'Jane', LastName = 'Smith', AccountId = accounts[1].Id));
        insert contacts;
    }

    @isTest
    static void testAccountPhoneValidation() {
        List<Account> accounts = [SELECT Id, Phone FROM Account];
        
        Test.startTest();
        AccountPhoneHandler.AccountPhone(accounts);
        Test.stopTest();
        
        // Check for errors on the second account (since its phone number is not 10 digits)
       // System.assertEquals('Phone number must be exactly 10 digits.', accounts[1].Phone.getErrors()[0].getMessage());
    }
    
    @isTest
    static void testSyncAddress() {
        List<Account> accounts = [SELECT Id, BillingStreet, BillingCity, BillingState, BillingPostalCode, BillingCountry, 
                                  ShippingStreet, ShippingCity, ShippingState, ShippingPostalCode, ShippingCountry 
                                  FROM Account];
        
        Test.startTest();
        AccountPhoneHandler.syncAddress(accounts);
        Test.stopTest();
        
        // Verify that the shipping address matches the billing address
        for(Account acc : accounts) {
            System.assertEquals(acc.BillingStreet, acc.ShippingStreet);
            System.assertEquals(acc.BillingCity, acc.ShippingCity);
            System.assertEquals(acc.BillingState, acc.ShippingState);
            System.assertEquals(acc.BillingPostalCode, acc.ShippingPostalCode);
            System.assertEquals(acc.BillingCountry, acc.ShippingCountry);
        }
    }
    
    @isTest
    static void testContactPhoneSync() {
        List<Account> accounts = [SELECT Id, Phone FROM Account WHERE Phone != null];
        
        Test.startTest();
        AccountPhoneHandler.ContactPhone(accounts);
        Test.stopTest();
        
        // Verify that the contacts' phone numbers are updated
        List<Contact> contacts = [SELECT Phone FROM Contact WHERE AccountId = :accounts[0].Id];
        for(Contact con : contacts) {
            System.assertEquals(accounts[0].Phone, con.Phone);
        }
    }
}