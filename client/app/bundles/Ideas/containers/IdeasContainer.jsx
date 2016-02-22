import React, { PropTypes } from 'react';
import alt from '../alt';
import IdeasHeaderContainer from './IdeasHeaderContainer';
import ListContainer from './ListContainer';
import IdeasStore from '../stores/IdeasStore';

export default class IdeasContainer extends React.Component {
  static propTypes = {
    initial_ideas: PropTypes.array.isRequired,
    lists: PropTypes.array.isRequired
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

  renderLists() {
    return this.props.lists.map((list, index) => {
      return (
        <ListContainer list={list} key={index} />
      );
    });
  }

  render() {
    return (
      <div>
        <IdeasHeaderContainer />
        <hr />
        {this.renderLists()}
      </div>
    );
  }
}
