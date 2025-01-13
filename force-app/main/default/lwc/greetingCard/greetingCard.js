import { LightningElement, track } from 'lwc';

export default class GreetingCard extends LightningElement {
    @track greeting = 'Hello';
    @track greeting1 = 'Hiiii';
    change(){
        this.greeting="me kon hu";
        this.greeting1 = this.greeting1+'   me hu saransh    Saransh the great hu me';
    }
}