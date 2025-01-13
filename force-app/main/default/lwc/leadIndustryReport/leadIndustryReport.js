import { LightningElement, wire } from 'lwc';
import getLeadReport from '@salesforce/apex/LeadReportController.getLeadReport';

export default class LeadIndustryReport extends LightningElement {
    leadData = [];
    error;
    isLoading = true;

    columns = [
        { label: 'Industry', fieldName: 'industry', type: 'text' },
        { label: 'Total Leads', fieldName: 'totalLeads', type: 'number' }
    ];

    @wire(getLeadReport)
    wiredLeads({ error, data }) {
        this.isLoading = false;
        if (data) {
            this.leadData = data;
            this.error = undefined;
        } else if (error) {
            this.error = error.body.message;
            this.leadData = [];
        }
    }
}