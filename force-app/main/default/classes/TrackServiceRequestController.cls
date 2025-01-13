public class TrackServiceRequestController {
    public List<Service_Request__c> serviceRequests { get; set; }
    public Id selectedServiceRequestId { get; set; }
    public Service_Request__c selectedServiceRequest { 
        get {
            if (selectedServiceRequestId != null) {
                return [SELECT Service_Number__c, Product__c, Service_Type__c, Service_Location__c, 
                        Description__c, Service_Date__c, Status__c, Service_Center__c 
                        FROM Service_Request__c 
                        WHERE Id = :selectedServiceRequestId LIMIT 1];
            }
            return null;
        }
    }

    public TrackServiceRequestController() {
        // Get the Contact ID of the logged-in Experience Cloud user
        Id contactId = [SELECT ContactId FROM User WHERE Id = :UserInfo.getUserId() LIMIT 1].ContactId;
        
        System.debug('Logged-in User Contact ID: ' + contactId);

        if (contactId != null) {
            // Fetch all service requests related to the logged-in user's Contact
            serviceRequests = [SELECT Id, Service_Number__c, Product__c, Service_Type__c, 
                              Service_Date__c, Status__c 
                              FROM Service_Request__c
                              WHERE Customer__c = :contactId];
            
            System.debug('Service Requests found: ' + serviceRequests);
            System.debug('Number of Service Requests: ' + serviceRequests.size());
        } else {
            serviceRequests = new List<Service_Request__c>();
          
        }
    }

    public PageReference viewDetails() {
        // Return null to stay on the same page after selecting a record
        return null;
    }
}