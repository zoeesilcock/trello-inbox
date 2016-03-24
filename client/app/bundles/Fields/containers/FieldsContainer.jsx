import React, { PropTypes } from 'react';
import { Panel } from 'react-bootstrap';
import alt from '../alt';

import FieldsStore from '../stores/FieldsStore';
import FieldsListContainer from './FieldsListContainer';
import NewFieldButtonContainer from './NewFieldButtonContainer';

export class FieldsContainer extends React.Component {
  static propTypes = {
    initial_fields: PropTypes.array.isRequired,
    order_path: PropTypes.string.isRequired,
  };

  state = FieldsStore.getState();

  componentDidMount() {
    const initialData = {
      FieldsStore: {
        fields: this.props.initial_fields,
        orderPath: this.props.order_path,
      },
    };

    FieldsStore.listen(this.onChange.bind(this));
    alt.bootstrap(JSON.stringify(initialData));
  }

  componentWillUnmount() {
    FieldsStore.unlisten(this.onChange);
  }

  onChange(state) {
    this.setState(state);
  }

  render() {
    const title = (<h2>{I18n.t('fields.index.fields')}</h2>);

    return (
      <Panel header={title}>
        <FieldsListContainer fields={this.state.fields} />
        <NewFieldButtonContainer />
      </Panel>
    );
  }
}

export default FieldsContainer;
