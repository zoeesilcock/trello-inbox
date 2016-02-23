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

  handleEmptyFieldValues() {
    this.fields.forEach((field, index) => {
      this.fields[index].value = '';
      this.fields[index].valid = !field.required;
    });
  }

  handleSetFieldValues(fieldValues) {
    fieldValues.forEach((field, index) => {
      this.fields[index].value = field.value;
      this.fields[index].valid = !field.required;
    });
  }

  handleChangeFieldValue(valueChange) {
    this.fields[valueChange.index].value = valueChange.value;
    this.fields[valueChange.index].valid = valueChange.value.length > 0 || !valueChange.required;
  }
}

export default alt.createStore(FieldValuesStore, 'FieldValuesStore');
