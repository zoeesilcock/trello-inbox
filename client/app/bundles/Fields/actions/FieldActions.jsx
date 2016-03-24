import alt from '../alt';

class FieldActions {
  constructor() {
    this.generateActions(
      'updateId',
      'updateTitle',
      'updateDescription',
      'updateRequired',
      'updateShowModal'
    );
  }
}

export default alt.createActions(FieldActions);
