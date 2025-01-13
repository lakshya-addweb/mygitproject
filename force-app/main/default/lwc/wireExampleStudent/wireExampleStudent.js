import { LightningElement , track , wire} from 'lwc';
import getStudent from '@salesforce/apex/wireStudentClass.getStudent';
const columns=[
    {label:'Student Id', fieldName: 'Id' },
    {label:'Student Name', fieldName: 'Name__c' , type:'text', editable:'true'},
    {label:'Total Fees', fieldName:'Total_Paid_Fees__c' , type:'number', editable:'true'},]
export default class WireExampleStudent extends LightningElement {
@track columns = columns;
@track data=[];
/*@wire(getStudent)
wiredStudent({data, error}){
    if(data){
        this.data = data;
    }else if(error){
            console.error('Error fetching accounts:', error);
}}*/
connectedCallback(){
    getStudent()
        .then(result=>{
            this.data = result;
        })
        .catch(error=>{
          console.log('error');
        })
    }
handleClick(){
    window.alert('Hello addweb');
}}