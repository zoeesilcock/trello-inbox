import alt from '../alt';

class FieldsActions {
  constructor() {
    this.generateActions('removeField', 'moveField', 'saveOrder');
  }
}

export default alt.createActions(FieldsActions);
