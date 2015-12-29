import alt from '../alt';
import FieldValuesActions from '../actions/FieldValuesActions';

class FieldValuesStore {
  constructor() {
    this.fields = [];

    this.bindListeners({
      handleChangeFieldValue: FieldValuesActions.CHANGE_FIELD_VALUE
    });
  }

  handleChangeFieldValue(valueChange) {
    this.fields[valueChange.index].value = valueChange.value;
  }
}

export default alt.createStore(FieldValuesStore, 'FieldValuesStore');
