import React from 'react';
import { Input } from 'react-bootstrap';
import I18n from 'i18n-js';

export default class IdeasSearchComponent extends React.Component {
  render() {
    return (
      <div className="col-xs-12 col-sm-3 col-sm-offset-3 header-right">
        <form className="form-inline search-form">
          <Input type="text" name="search" placeholder={I18n.t('ideas.index.search.label')} />
        </form>
      </div>
    );
  }
}
