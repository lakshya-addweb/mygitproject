import { LightningElement, wire } from 'lwc';
import getRelatedProducts from '@salesforce/apex/ProductCatalogController.getRelatedProducts';
import { NavigationMixin } from 'lightning/navigation';

export default class ProductCatalog extends NavigationMixin(LightningElement) {
    products;
    error;

    @wire(getRelatedProducts)
    wiredProducts({ error, data }) {
        if (data) {
            this.products = data;
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.products = undefined;
        }
    }

    handleViewDetails(event) {
        const productId = event.target.dataset.id;

        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: productId,
                objectApiName: 'Product__c', // Ensure this matches the correct object API name
                actionName: 'view',
            },
        });
    }
}