import { LightningElement } from 'lwc';

export default class ComboBoxLwc extends LightningElement {
    value='';
    get options(){
        return[
        {label:'New', value:'New value'},
    { label:'Old', value:'Old value'}]
    }
    handleChange(event){
    this.value= event.detail.value;
    }
}