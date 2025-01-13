import { LightningElement, api, wire } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';

const FIELDS = [
    'Service_Request__c.Customer__c',
    'Service_Request__c.Description__c',
    'Service_Request__c.Employee__c',
    'Service_Request__c.Product__c',
    'Service_Request__c.Service_Center__c',
    'Service_Request__c.Service_Date__c',
    'Service_Request__c.Service_Location__c',
    'Service_Request__c.Service_Number__c',
    'Service_Request__c.Service_Type__c',
    'Service_Request__c.Status__c',
    'Service_Request__c.Title__c'
];

export default class ServiceRequestDetail extends LightningElement {
    @api recordId;
    isLoading = true; // track loading state
    hasError = false; // track error state

    @wire(getRecord, { recordId: '$recordId', fields: FIELDS })
    serviceRequest({ error, data }) {
        if (data) {
            this.isLoading = false;
            this.hasError = false;
        } else if (error) {
            this.isLoading = false;
            this.hasError = true;
            console.error('Error retrieving data: ', error); // Log the error to the console
        }
    }

    get serviceRequestAvailable() {
        return !this.isLoading && !this.hasError && this.serviceRequest.data;
    }
}