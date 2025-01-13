import { LightningElement, wire } from 'lwc';
import getOpenLeads from '@salesforce/apex/LeadController.getOpenLeads';
import { NavigationMixin } from 'lightning/navigation';

export default class LeadTable extends NavigationMixin(LightningElement) {
    leadData = [];
    isLoading = true;

    columns = [
        { label: 'S.No', fieldName: 'serialNumber', type: 'number', initialWidth: 75 },
        {
            label: 'Name',
            fieldName: 'Name',
            type: 'button',
            typeAttributes: {
                label: { fieldName: 'Name' },
                variant: 'base'
            }
        },
        { label: 'Company', fieldName: 'Company' },
        { label: 'Email', fieldName: 'Email', type: 'email' },
        { label: 'Status', fieldName: 'Status' }
    ];
    

    @wire(getOpenLeads)
    wiredLeads({ data, error }) {
        this.isLoading = false;
        if (data) {
            this.leadData = data.map((lead, index) => ({
                ...lead,
                serialNumber: index + 1 // Assign serial number
            }));
        } else if (error) {
            console.error('Error fetching leads:', error);
        }
    }

    handleRowAction(event) {
        const row = event.detail.row;
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: row.Id,
                actionName: 'view'
            }
        });
    }
}