import { LightningElement, wire } from 'lwc';
import getAccounts from '@salesforce/apex/AccountController.getAccounts';
import { NavigationMixin } from 'lightning/navigation';

export default class AccountTable extends NavigationMixin(LightningElement) {
    accountData = [];
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
        { label: 'Industry', fieldName: 'Industry' },
        { label: 'Phone', fieldName: 'Phone', type: 'phone' },
        { label: 'Type', fieldName: 'Type' }
    ];

    @wire(getAccounts)
    wiredAccounts({ data, error }) {
        this.isLoading = false;
        if (data) {
            this.accountData = data.map((account, index) => ({
                ...account,
                serialNumber: index + 1
            }));
        } else if (error) {
            console.error('Error fetching accounts:', error);
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