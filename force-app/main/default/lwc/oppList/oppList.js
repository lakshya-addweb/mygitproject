import { LightningElement, wire } from 'lwc';
import getOpportunities from '@salesforce/apex/OpportunityController.getOpportunities';
import { NavigationMixin } from 'lightning/navigation';

export default class OpportunityTable extends NavigationMixin(LightningElement) {
    opportunityData = [];
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
        { label: 'Stage Name', fieldName: 'StageName' },
        { label: 'Amount', fieldName: 'Amount', type: 'currency' },
        { label: 'Close Date', fieldName: 'CloseDate', type: 'date' }
    ];

    @wire(getOpportunities)
    wiredOpportunities({ data, error }) {
        this.isLoading = false;
        if (data) {
            this.opportunityData = data.map((opportunity, index) => ({
                ...opportunity,
                serialNumber: index + 1
            }));
        } else if (error) {
            console.error('Error fetching opportunities:', error);
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