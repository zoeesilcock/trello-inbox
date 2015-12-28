import alt from '../alt';
import FieldsActions from '../actions/FieldsActions';

class FieldsStore {
  constructor() {
    this.fields = [];
    this.currentIndex = null;
    this.showModal = false;

    this.bindListeners({
      handlePickField: FieldsActions.PICK_FIELD,
      handleUpdateShowModal: FieldsActions.UPDATE_SHOW_MODAL
    });
  }

  handlePickField(index) {
    this.currentIndex = index;
  }

  handleUpdateShowModal(showModal) {
    this.showModal = showModal;
  }
}

export default alt.createStore(FieldsStore, 'FieldsStore');
