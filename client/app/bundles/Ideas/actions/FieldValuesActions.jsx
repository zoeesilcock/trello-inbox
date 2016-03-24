import alt from '../alt';

class FieldValuesActions {
  emptyFieldValues() {
    return null;
  }

  setFieldValues(fieldValues) {
    return fieldValues;
  }

  changeFieldValue(index, value, required) {
    return { index, value, required };
  }
}

export default alt.createActions(FieldValuesActions);
