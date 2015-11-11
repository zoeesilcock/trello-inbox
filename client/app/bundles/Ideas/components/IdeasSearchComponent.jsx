import React from 'react';
import { Input } from 'react-bootstrap';
import I18n from 'i18n-js';

export default class IdeasSearchComponent extends React.Component {
  render() {
    return (
      <div>
        <form className="form-inline pull-right search-form">
          <Input type="text" name="search" placeholder={I18n.t('ideas.index.search.label')} />
        </form>
      </div>
    );
  }
}
