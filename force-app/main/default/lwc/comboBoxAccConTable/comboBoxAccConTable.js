import { LightningElement , track } from 'lwc';
import getAccounts from '@salesforce/apex/comboBoxAccContact.getAccounts';
import getContacts from '@salesforce/apex/comboBoxAccContact.getContacts';

const columns=[
    {label:'Contact Name', fieldName:'Name'},
    {label:'Contact Email', fieldName:'Email'},
]
export default class ComboBoxAccConTable extends LightningElement {
    @track value='';
    @track accOptions=[];
    @track showContact=false;
    @track data=[];
    @track columns = columns;
    get options(){
        return this.accOptions;
    }
     connectedCallback(){ 
        getAccounts()
        .then(result=>{
            let arr=[];
            for(var i= 0;i<result.length;i++){
                arr.push({label:result[i].Name , value:result[i].Id});
            }
            this.accOptions=arr;
        })
     }
     handleChange(event){
        this.showContact = true;

        this.value= event.detail.value;
        getContacts({selectedAccountId: this.value})
        .then(result=>{
            this.data = result;
        })
        .catch(error=>{
            window.alert('error');  
        })
     
     }
}