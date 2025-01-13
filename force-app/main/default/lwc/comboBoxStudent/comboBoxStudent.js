import { LightningElement , track } from 'lwc';
import getStudent from '@salesforce/apex/comboBoxStudent.getStudent';

export default class ComboBoxStudent extends LightningElement {
@track value='';
@track studeoptions=[];
    get options(){
        return this.studeoptions;
    }
connectedCallback(){
    getStudent()
        .then(result=>{
            let arr=[];
            for(let i=0;i<result.length;i++){
                arr.push({label:result[i].Name__c, value:result[i].Id});
            }
            this.studeoptions= arr;
        })
        .catch(error=>{
            console.log('Error');
        })
}
handleChange(event){
    this.value= event.detail.value;
    window.alert(JSON.stringify(this.value));
}
}