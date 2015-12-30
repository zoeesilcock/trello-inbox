import alt from '../alt';

class FieldValuesActions {
  emptyFieldValues() {
    return null;
  }

  setFieldValues(fieldValues) {
    return fieldValues;
  }

  changeFieldValue(index, value) {
    return { index: index, value: value };
  }
}

export default alt.createActions(FieldValuesActions);
