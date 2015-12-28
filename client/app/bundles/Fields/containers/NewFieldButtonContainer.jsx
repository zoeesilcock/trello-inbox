import React from 'react';
import NewFieldButtonComponent from '../components/NewFieldButtonComponent';
import FieldActions from '../actions/FieldActions';

export default class NewFieldButtonContainer extends React.Component {
  openModal() {
    FieldActions.updateId(null);
    FieldActions.updateTitle('');
    FieldActions.updateDescription('');
    FieldActions.updateShowModal(true);
  }

  render() {
    return (
      <NewFieldButtonComponent openModal={this.openModal} />
    );
  }
}
