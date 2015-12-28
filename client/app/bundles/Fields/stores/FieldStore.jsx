import alt from '../alt';
import FieldActions from '../actions/FieldActions';

class FieldStore {
  constructor() {
    this.id = null;
    this.title = '';
    this.description = '';
    this.required = false;
    this.showModal = false;

    this.bindListeners({
      handleIdUpdate: FieldActions.UPDATE_ID,
      handleTitleUpdate: FieldActions.UPDATE_TITLE,
      handleDescriptionUpdate: FieldActions.UPDATE_DESCRIPTION,
      handleRequiredUpdate: FieldActions.UPDATE_REQUIRED,
      handleModalUpdate: FieldActions.UPDATE_SHOW_MODAL
    });
  }

  handleIdUpdate(id) {
    this.id = id;
  }

  handleTitleUpdate(title) {
    this.title = title;
  }

  handleDescriptionUpdate(description) {
    this.description = description;
  }

  handleRequiredUpdate(required) {
    this.required = required;
  }

  handleModalUpdate(showModal) {
    this.showModal = showModal;
  }
}

export default alt.createStore(FieldStore, 'FieldStore');
