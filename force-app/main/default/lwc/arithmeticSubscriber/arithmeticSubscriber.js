import { LightningElement, wire } from 'lwc';
import { subscribe, MessageContext } from 'lightning/messageService';
import ARITHMETIC_MESSAGE_CHANNEL from '@salesforce/messageChannel/arithmeticMessageChannel__c';

export default class ArithmeticSubscriber extends LightningElement {
    operation;
    input1;
    input2;
    result;

    @wire(MessageContext)
    messageContext;

    connectedCallback() {
        this.subscribeToMessageChannel();
    }

    subscribeToMessageChannel() {
        subscribe(
            this.messageContext,
            ARITHMETIC_MESSAGE_CHANNEL,
            (message) => this.handleMessage(message)
        );
    }

    handleMessage(message) {
        this.operation = message.operation;
        this.input1 = message.input1;
        this.input2 = message.input2;
        this.calculateResult();
    }

    calculateResult() {
        switch (this.operation) {
            case 'add':
                this.result = this.input1 + this.input2;
                break;
            case 'subtract':
                this.result = this.input1 - this.input2;
                break;
            case 'multiply':
                this.result = this.input1 * this.input2;
                break;
            case 'divide':
                this.result = this.input1 / this.input2;
                break;
            default:
                this.result = 'Unknown operation';
        }
    }
}