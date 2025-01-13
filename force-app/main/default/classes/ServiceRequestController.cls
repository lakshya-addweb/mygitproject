public  class ServiceRequestController {
    @AuraEnabled(cacheable=true)
    public static List<Service_Request__c> getServiceRequests() {

            // Query Service_Request__c records where Customer__c is the user's contact
            return [
                SELECT Id, Service_Number__c, Product__c, Service_Type__c,	Employee__c, 
                       Service_Location__c, Description__c, Service_Date__c, 
                       Status__c
                FROM Service_Request__c
                
            ];
    }
}