import alt from '../alt';

class FieldsActions {
  constructor() {
    this.generateActions('removeField', 'moveField');
  }
}

export default alt.createActions(FieldsActions);
