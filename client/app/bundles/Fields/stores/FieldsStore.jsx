import alt from '../alt';
import FieldsActions from '../actions/FieldsActions';

class FieldsStore {
  constructor() {
    this.fields = [];

    this.bindListeners({
      handleRemoveField: FieldsActions.REMOVE_FIELD,
      handleMoveField: FieldsActions.MOVE_FIELD
    });
  }

  handleRemoveField(index) {
    let field = this.fields[index];

    $.ajax({
      url: field.destroy_path,
      method: 'DELETE'
    });

    this.fields.splice(index, 1);
  }

  handleMoveField(indexes) {
    const fromIndex = indexes[0];
    const toIndex = indexes[1];
    let moveField = this.fields.splice(fromIndex, 1);
    this.fields.splice(toIndex, 0, moveField[0]);

    for (var i = 0; i < this.fields.length; i++) {
      this.fields[i].order = i;
    }

    console.log("Move from", fromIndex, toIndex);
  }
}

export default alt.createStore(FieldsStore, 'FieldsStore');
