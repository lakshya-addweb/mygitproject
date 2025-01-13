import { LightningElement, wire, track } from 'lwc';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
import USER_ID from '@salesforce/user/Id';
import CONTACT_ID_FIELD from '@salesforce/schema/User.ContactId';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class ServiceRequestForm extends LightningElement {
    customerId;
    @track isFormVisible = true;
    @track serviceRequestId;

    @wire(getRecord, { recordId: USER_ID, fields: [CONTACT_ID_FIELD] })
    wiredUser({ error, data }) {
        if (data) {
            this.customerId = getFieldValue(data, CONTACT_ID_FIELD);
        } else if (error) {
            this.showToast('Error loading contact', error.body.message, 'error');
        }
    }

    handleSubmit(event) {
        // Prevent the default submit action
        event.preventDefault();

        // Get the fields to submit
        const fields = event.detail.fields;

        // Set the Customer__c and Status__c fields
        fields.Customer__c = this.customerId;
        fields.Status__c = 'New';

        // Submit the form with updated fields
        this.template.querySelector('lightning-record-edit-form').submit(fields);
    }

    handleSuccess(event) {
        this.serviceRequestId = event.detail.id; // Capture the record ID
        this.isFormVisible = false;
        this.showToast('Success', 'Service Request created successfully', 'success');
    }

    showToast(title, message, variant) {
        const event = new ShowToastEvent({
            title,
            message,
            variant,
        });
        this.dispatchEvent(event);
    }
}