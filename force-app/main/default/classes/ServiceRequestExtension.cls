public class ServiceRequestExtension {
    private final Service_Request__c serviceRequest;

    public ServiceRequestExtension(ApexPages.StandardController controller) {
        this.serviceRequest = (Service_Request__c)controller.getRecord();
        populateFields();
    }

    private void populateFields() {
        // Retrieve the logged-in user's contact record
        Contact loggedInContact = [SELECT Id FROM Contact WHERE Email = :UserInfo.getUserEmail() LIMIT 1];
        
        if (loggedInContact != null) {
            // Automatically set the Customer__c field to the logged-in user's contact
            serviceRequest.Customer__c = loggedInContact.Id;
        }

        // Automatically set the Status__c field to 'New'
        serviceRequest.Status__c = 'New';
    }
}