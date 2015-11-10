import React from 'react';
import I18n from 'i18n-js';
import { Input } from 'react-bootstrap';

export default class IdeasSortComponent extends React.Component {
  render() {
    return (
      <div>
        <form className="form-inline pull-left sort-form">
          <Input type="select" label={I18n.t('ideas.index.sort.label')} placeholder="select">
            <option value="date">{I18n.t('ideas.index.sort.date')}</option>
            <option value="title">{I18n.t('ideas.index.sort.title')}</option>
            <option value="votes">{I18n.t('ideas.index.sort.votes')}</option>
          </Input>
        </form>
      </div>
    );
  }
}
