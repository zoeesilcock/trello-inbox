import React, { PropTypes } from 'react';
import { Panel } from 'react-bootstrap';
import alt from '../alt';
import FieldsStore from '../stores/FieldsStore';
import FieldsListContainer from './FieldsListContainer';
import NewFieldButtonContainer from './NewFieldButtonContainer';

class FieldsContainer extends React.Component {
  static propTypes = {
    initial_fields: PropTypes.array.isRequired
  };

  state = FieldsStore.getState();

  componentDidMount() {
    FieldsStore.listen(this.onChange.bind(this));
    alt.bootstrap(JSON.stringify({
      FieldsStore: {
        fields: this.props.initial_fields,
        orderPath: this.props.order_path
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
    let title = (<h2>{I18n.t('fields.index.fields')}</h2>);
    return (
      <Panel header={title}>
        <FieldsListContainer fields={this.state.fields} />
        <NewFieldButtonContainer />
      </Panel>
    );
  }
}

export default FieldsContainer;
