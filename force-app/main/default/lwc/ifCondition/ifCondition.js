import { LightningElement , track } from 'lwc';

export default class IfCondition extends LightningElement {
    @track buttonlabel = 'show';
    mytitle='Lakshya soni';
    @track cardVisible = false;

    changeButtonLabel(event){
        const label = event.target.label;
        if(label==='show'){
            this.buttonlabel='hide';
            this.cardVisible= true;
        }
        else if(label ==='hide'){
            this.buttonlabel='show';
            this.cardVisible= false;
        }
    }
}