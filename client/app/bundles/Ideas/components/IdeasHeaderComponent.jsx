import React from 'react';
import IdeasFilterContainer from '../containers/IdeasFilterContainer';
import IdeasSortContainer from '../containers/IdeasSortContainer';
import IdeasSearchContainer from '../containers/IdeasSearchContainer';

export default class IdeasHeaderComponent  extends React.Component {
  render() {
    return (
      <div className="row">
        <IdeasFilterContainer />
        <IdeasSortContainer />
        <IdeasSearchContainer />
      </div>
    );
  }
}
