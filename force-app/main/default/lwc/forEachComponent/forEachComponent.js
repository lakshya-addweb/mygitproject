import { LightningElement , wire , track} from 'lwc';
import getStudent from '@salesforce/apex/wireStudentClass.getStudent';
export default class ForEachComponent extends LightningElement {
    @track data = [];

    @wire(getStudent) Student;
    

}