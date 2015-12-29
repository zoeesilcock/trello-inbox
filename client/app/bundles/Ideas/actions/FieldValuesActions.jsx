import alt from '../alt';

class FieldValuesActions {
  emptyFieldValues() {
    this.dispatch();
  }

  setFieldValues(fieldValues) {
    this.dispatch(fieldValues);
  }

  changeFieldValue(index, value) {
    this.dispatch({ index: index, value: value });
  }
}

export default alt.createActions(FieldValuesActions);
