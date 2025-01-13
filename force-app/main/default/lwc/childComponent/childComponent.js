import { LightningElement , api} from 'lwc';

export default class ChildComponent extends LightningElement {
   @api itemName = 'Hello Child Component';
  @api handleChangeValue(){
      this.itemName ='Hello i m lakshya soni';
   }
}