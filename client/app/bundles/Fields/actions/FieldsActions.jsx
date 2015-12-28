import alt from '../alt';

class FieldsActions {
  constructor() {
    this.generateActions('removeField');
  }
}

export default alt.createActions(FieldsActions);
