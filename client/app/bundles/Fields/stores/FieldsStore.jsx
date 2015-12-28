import alt from '../alt';
import FieldsActions from '../actions/FieldsActions';

class FieldsStore {
  constructor() {
    this.fields = [];

    this.bindListeners({
      handleRemoveField: FieldsActions.REMOVE_FIELD
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
}

export default alt.createStore(FieldsStore, 'FieldsStore');
