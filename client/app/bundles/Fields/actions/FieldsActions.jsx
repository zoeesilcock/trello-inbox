import alt from '../alt';

class FieldsActions {
  constructor() {
    this.generateActions('pickField', 'updateShowModal');
  }
}

export default alt.createActions(FieldsActions);
