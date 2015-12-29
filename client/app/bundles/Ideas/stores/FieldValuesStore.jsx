import alt from '../alt';
import FieldValuesActions from '../actions/FieldValuesActions';

class FieldValuesStore {
  constructor() {
    this.fields = [];

    this.bindListeners({
      handleEmptyFieldValues: FieldValuesActions.EMPTY_FIELD_VALUES,
      handleSetFieldValues: FieldValuesActions.SET_FIELD_VALUES,
      handleChangeFieldValue: FieldValuesActions.CHANGE_FIELD_VALUE
    });
  }

  handleEmptyFieldValues(fieldValues) {
    this.fields.forEach((field, index) => {
      this.fields[index].value = '';
    });
  }

  handleSetFieldValues(fieldValues) {
    fieldValues.forEach((field, index) => {
      this.fields[index].value = field.value;
    });
  }

  handleChangeFieldValue(valueChange) {
    this.fields[valueChange.index].value = valueChange.value;
  }
}

export default alt.createStore(FieldValuesStore, 'FieldValuesStore');
