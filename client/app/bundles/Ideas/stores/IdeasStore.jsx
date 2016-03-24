import alt from '../alt';
const lunr = require('lunr');

class IdeasStore {
  constructor() {
    this.ideas = [];
    this.index = null;

    this.on('bootstrap', () => {
      this.index = lunr(function handle() {
        this.ref('id');
        this.field('title', { boost: 10 });
        this.field('fields_text', { boost: 5 });
      });

      for (let i = 0; i < this.ideas.length; i++) {
        this.index.add(this.ideas[i]);
      }
    });
  }
}

export default alt.createStore(IdeasStore, 'IdeasStore');
