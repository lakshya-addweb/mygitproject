import { LightningElement, wire, track } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import { refreshApex } from '@salesforce/apex';
import getServiceRequests from '@salesforce/apex/ServiceRequestController.getServiceRequests';

export default class TrackServiceRequests extends NavigationMixin(LightningElement) {
    @track serviceRequests = [];
    @track isLoading = true;
    wiredServiceRequestResult; // To store the wired result for refresh

    // Define the columns for the datatable
    columns = [
        { label: 'Service Number', fieldName: 'Service_Number__c' },
        { label: 'Product', fieldName: 'Product__c' }, 
        { label: 'Employee', fieldName: 'Employee__c' },
        { label: 'Service Type', fieldName: 'Service_Type__c' },
        { label: 'Service Date', fieldName: 'Service_Date__c', type: 'date' },
        { label: 'Status', fieldName: 'Status__c' },
        { type: 'button', typeAttributes: { label: 'View Details', name: 'view_details', variant: 'brand' } }
    ];

    // Wire the Apex method to get service requests
    @wire(getServiceRequests)
    wiredServiceRequests(result) {
        this.wiredServiceRequestResult = result; // Store the wired result for refresh
        const { data, error } = result;
        if (data) {
            this.serviceRequests = data;
            this.isLoading = false;
        } else if (error) {
            this.isLoading = false;
            this.serviceRequests = [];
            console.error('Error fetching service requests:', error);
        }
    }

    // Handle the row action (button click)
    handleRowAction(event) {
        const row = event.detail.row;
        this.navigateToRecordViewPage(row.Id);
    }

    // Navigate to the record view page
    navigateToRecordViewPage(recordId) {
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: recordId,
                objectApiName: 'Service_Request__c', // Object API name
                actionName: 'view'
            }
        });
    }

    // Refresh data every 30 seconds
    connectedCallback() {
        this.refreshInterval = setInterval(() => {
            refreshApex(this.wiredServiceRequestResult);
        }, 5000); // 5 seconds interval
    }

    // Clear interval when component is disconnected
    disconnectedCallback() {
        clearInterval(this.refreshInterval);
    }
}