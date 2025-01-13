import { LightningElement, wire, track } from 'lwc';
import getAccount from '@salesforce/apex/wireDemo.getAccount';

const columns = [
    { label: 'Name', fieldName: 'Name' },
    { label: 'Record Id', fieldName: 'Id' },
];
export default class WireDemo extends LightningElement {
    @track columns = columns;
    @track data = [];
    @wire(getAccount)
    wiredAccount({ data, error }) { 
        if (data) {
            this.data = data;
        } else if (error) {
            console.error('Error fetching accounts:', error);
        }
    }
}