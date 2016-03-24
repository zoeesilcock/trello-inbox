import alt from '../alt';
import request from 'superagent';
require('superagent-rails-csrf')(request);

import FieldsActions from '../actions/FieldsActions';

class FieldsStore {
  constructor() {
    this.fields = [];
    this.orderEndpoint = '';

    this.bindListeners({
      handleRemoveField: FieldsActions.REMOVE_FIELD,
      handleMoveField: FieldsActions.MOVE_FIELD,
      handleSaveOrder: FieldsActions.SAVE_ORDER,
    });
  }

  handleRemoveField(index) {
    const field = this.fields[index];

    request
      .delete(field.destroy_path)
      .setCsrfToken()
      .end((err, res) => {
        // no-op
      });

    this.fields.splice(index, 1);
  }

  handleMoveField(indexes) {
    const fromIndex = indexes[0];
    const toIndex = indexes[1];
    const moveField = this.fields.splice(fromIndex, 1);
    this.fields.splice(toIndex, 0, moveField[0]);

    for (let i = 0; i < this.fields.length; i++) {
      this.fields[i].sorting = i;
    }
  }

  handleSaveOrder() {
    const newOrder = this.fields.map((field) =>
        ({ id: field.id, sorting: field.sorting }));

    request
      .put(this.orderPath)
      .send({ order: newOrder })
      .setCsrfToken()
      .end((err, res) => {
        // no-op
      });
  }
}

export default alt.createStore(FieldsStore, 'FieldsStore');
