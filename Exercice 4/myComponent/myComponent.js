import { LightningElement, track } from 'lwc';
import searchRecords from '@salesforce/apex/AC_MyApexController.searchRecords';
export default class MyComponent extends LightningElement {
    
    @track results;
    @track keyword;
    
    getKeyword(event) {
        this.keyword = event.target.value;
    }
    handleClick(event) {
        searchRecords({keyword: this.keyword})
        .then(result => {
            this.results = result;
        })
        .catch(error => {
            console.error(error);
        });
    }
}