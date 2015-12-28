import React, { PropTypes } from 'react';
import alt from '../alt';
import FieldsListContainer from './FieldsListContainer';
import FieldsStore from '../stores/FieldsStore';

class FieldsContainer extends React.Component {
  static propTypes = {
    initial_fields: PropTypes.array.isRequired
  }

  state = FieldsStore.getState()

  componentDidMount() {
    FieldsStore.listen(this.onChange.bind(this));
    alt.bootstrap(JSON.stringify({
      FieldsStore: {
        fields: this.props.initial_fields
      }
    }));
  }

  componentWillUnmount() {
    FieldsStore.unlisten(this.onChange);
  }

  onChange(state) {
    this.setState(state);
  }

  render() {
    return (
      <div>
        <h1>{I18n.t('fields.index.fields')}</h1>
        <FieldsListContainer fields={this.state.fields} />
      </div>
    );
  }
}

export default FieldsContainer;
