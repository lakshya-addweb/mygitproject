public with sharing class LeadController {
    @AuraEnabled(cacheable=true)
    public static List<Lead> getOpenLeads() {
        return [SELECT Id, Name, Company, Email, Status FROM Lead ];
    }
}