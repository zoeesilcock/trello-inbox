import alt from '../alt';
import FieldsActions from '../actions/FieldsActions';

class FieldsStore {
  constructor() {
    this.fields = [];
  }
}

export default alt.createStore(FieldsStore, 'FieldsStore');
