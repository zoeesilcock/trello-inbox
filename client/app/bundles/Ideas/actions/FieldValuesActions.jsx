import alt from '../alt';

class FieldValuesActions {
  emptyFieldValues() {
    return null;
  }

  setFieldValues(fieldValues) {
    return fieldValues;
  }

  changeFieldValue(index, value, required) {
    return { index: index, value: value, required: required };
  }
}

export default alt.createActions(FieldValuesActions);
