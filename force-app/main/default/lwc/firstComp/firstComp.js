import { LightningElement } from 'lwc';
import{ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class FirstComp extends LightningElement {
    myTitle="Salesforce";
    click(){
    this.showToast(this.myTitle);
    }
     showToast(firstFunctionArgument){
        const event=new ShowToastEvent({
            title: firstFunctionArgument,
            message:"hello",
            variant:'Success',
        })
        this.dispatchEvent(event);}

  connectedCallback(){
       let callmyFunction = this.myfunction(10,2);
       
       window.alert('result  '+callmyFunction);
    }
myfunction=(divident,divisor) => {

    return divident/divisor;
}
}