import React, { PropTypes } from 'react';
import IdeaFormFieldsComponent from '../components/IdeaFormFieldsComponent';

export default class IdeaFormFieldsContainer extends React.Component {
  static propTypes = {
    title: PropTypes.string,
    description: PropTypes.string
  }

  render() {
    return (
      <IdeaFormFieldsComponent title={this.props.title} description={this.props.description} />
    );
  }
}
