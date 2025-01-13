import { LightningElement } from 'lwc';

export default class ConditionalStatement extends LightningElement {
  buttonlabel = 'Button 3';
    property1= false;
     property2= false;

     changeButtonLabel(){
        if(this.property1 ===true){
            this.property1= false;
            this.property2= true;
            this.buttonlabel= 'Button 2';
        }else{
            this.property2=false;
            this.property1=true;
            
            this.buttonlabel= 'Button 1';
        }
     }
}