import { LightningElement, wire } from 'lwc';
import { publish, MessageContext } from 'lightning/messageService';
import ARITHMETIC_MESSAGE_CHANNEL from '@salesforce/messageChannel/arithmeticMessageChannel__c';

export default class ArithmeticPublisher extends LightningElement {
    operation = '';
    input1 = 0;
    input2 = 0;

    operations = [
        { label: 'Add', value: 'add' },
        { label: 'Subtract', value: 'subtract' },
        { label: 'Multiply', value: 'multiply' },
        { label: 'Divide', value: 'divide' }
    ];

    @wire(MessageContext)
    messageContext;

    handleOperationChange(event) {
        this.operation = event.detail.value;
    }

    handleInputChange1(event) {
        this.input1 = parseFloat(event.target.value);
    }

    handleInputChange2(event) {
        this.input2 = parseFloat(event.target.value);
    }

    publishMessage() {
        const data = {
            operation: this.operation,
            input1: this.input1,
            input2: this.input2
        };
        publish(this.messageContext, ARITHMETIC_MESSAGE_CHANNEL, data);
    }
}