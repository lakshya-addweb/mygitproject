import { LightningElement , track } from 'lwc';

export default class TrackDecorator extends LightningElement {
    @track fullName = {firstName : "", lastName : ""};
    handleChange(event){
        const field = event.target.name;
        if(field === 'firstname'){
            this.event.firstName = event.target.value;
        }
        else if(field ==='lastname'){
            this.event.lastName = event.target.value; 
        }
    }
}