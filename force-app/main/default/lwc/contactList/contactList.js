import { LightningElement, wire } from 'lwc';
import getContacts from '@salesforce/apex/ContactController.getContacts';
import { NavigationMixin } from 'lightning/navigation';

export default class ContactTable extends NavigationMixin(LightningElement) {
    contactData = [];
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
        { label: 'Email', fieldName: 'Email', type: 'email' },
        { label: 'Phone', fieldName: 'Phone', type: 'phone' },
        { label: 'Account Name', fieldName: 'AccountName' }
    ];

    @wire(getContacts)
    wiredContacts({ data, error }) {
        this.isLoading = false;
        if (data) {
            this.contactData = data.map((contact, index) => ({
                ...contact,
                serialNumber: index + 1
            }));
        } else if (error) {
            console.error('Error fetching contacts:', error);
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