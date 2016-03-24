import React, { PropTypes } from 'react';
import { DragSource, DropTarget } from 'react-dnd';
import FieldsActions from '../actions/FieldsActions';

export class FieldComponent extends React.Component {
  static propTypes = {
    field: PropTypes.object.isRequired,
    index: PropTypes.number.isRequired,
    editField: PropTypes.func.isRequired,
    removeField: PropTypes.func.isRequired,
    connectDragSource: PropTypes.func.isRequired,
    connectDropTarget: PropTypes.func.isRequired,
    isDragging: PropTypes.bool.isRequired,
  };

  render() {
    const { connectDragSource, connectDropTarget } = this.props;
    const opacity = this.props.isDragging ? 0 : 1;
    const required = this.props.field.required ?
      I18n.t('fields.index.required_yes') : I18n.t('fields.index.required_no');

    return connectDragSource(connectDropTarget(
      <tr style={{ opacity }}>
        <td>
          <i className="glyphicon glyphicon-list"></i>
        </td>
        <td>
          <a href="#" onClick={this.props.editField}>
            <i className="glyphicon glyphicon-pencil"></i>
          </a>
        </td>
        <td>
          <a href="#" onClick={this.props.removeField}>
            <i className="glyphicon glyphicon-trash"></i>
          </a>
        </td>
        <td>
          <span>{this.props.field.title}</span>
        </td>
        <td className="hidden-xs">
          <span>{this.props.field.description}</span>
        </td>
        <td>
          <span>{required}</span>
        </td>
      </tr>
    ));
  }
}

const fieldSource = {
  beginDrag: (props) => ({ id: props.field.id, index: props.index }),
  isDragging: (props, monitor) => (props.field.id === monitor.getItem().id),
  endDrag: (props, monitor, component) => {
    FieldsActions.saveOrder();
  },
};

const fieldTarget = {
  hover: (props, monitor, component) => {
    const dragIndex = monitor.getItem().index;
    const hoverIndex = props.index;

    if (hoverIndex === dragIndex) {
      return;
    }

    FieldsActions.moveField(dragIndex, hoverIndex);
    monitor.getItem().index = hoverIndex;
  },
};

function sourceCollect(connect, monitor) {
  return {
    connectDragSource: connect.dragSource(),
    isDragging: monitor.isDragging(),
  };
}

function targetCollect(connect, monitor) {
  return {
    connectDropTarget: connect.dropTarget(),
  };
}

export default new DropTarget('field', fieldTarget, targetCollect)(
    new DragSource('field', fieldSource, sourceCollect)(FieldComponent));
