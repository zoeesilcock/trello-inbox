import alt from '../alt';

class FieldValuesActions {
  changeFieldValue(index, value) {
    this.dispatch({ index: index, value: value });
  }
}

export default alt.createActions(FieldValuesActions);
