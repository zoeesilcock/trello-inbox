import React, { PropTypes } from 'react';
import alt from '../alt';
import IdeasHeaderContainer from './IdeasHeaderContainer';
import IdeasListContainer from './IdeasListContainer';
import IdeasStore from '../stores/IdeasStore';

export default class IdeasContainer extends React.Component {
  static propTypes = {
    initial_ideas: PropTypes.array.isRequired
  };

  state = IdeasStore.getState();

  componentDidMount() {
    IdeasStore.listen(this.onChange.bind(this));
    alt.bootstrap(JSON.stringify({
      IdeasStore: {
        ideas: this.props.initial_ideas
      }
    }));
  }

  componentWillUnmount() {
    IdeasStore.unlisten(this.onChange);
  }

  onChange(state) {
    this.setState(state);
  }

  render() {
    return (
      <div>
        <IdeasHeaderContainer />
        <hr />
        <IdeasListContainer ideas={this.state.ideas} index={this.state.index} />
      </div>
    );
  }
}
