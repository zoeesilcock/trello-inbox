import React from 'react';
import IdeasContainer from '../containers/IdeasContainer';

const IdeasClient = props => {
  const reactComponent = (
    <IdeasContainer {...props} />
  );
  return reactComponent;
};

export default IdeasClient;
