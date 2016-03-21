import React, { PropTypes } from 'react';
import { Table } from 'react-bootstrap';
import HTML5Backend from 'react-dnd-html5-backend';
import { DragDropContext } from 'react-dnd';
import FieldContainer from '../containers/FieldContainer';

export class FieldsListComponent extends React.Component {
  static propTypes = {
    fields: PropTypes.array.isRequired
  };

  render() {
    var fields = [];

    this.props.fields.map(function(field, index) {
      fields.push(<FieldContainer key={index} index={index} field={field} />);
    });

    return (
      <Table id="fields" striped>
        <thead>
          <tr>
            <th></th>
            <th></th>
            <th></th>
            <th>{I18n.t('fields.index.title')}</th>
            <th className="hidden-xs">{I18n.t('fields.index.description')}</th>
            <th>{I18n.t('fields.index.required')}</th>
          </tr>
        </thead>
        <tbody>
          {fields}
        </tbody>
      </Table>
    );
  }
}

export default DragDropContext(HTML5Backend)(FieldsListComponent);
