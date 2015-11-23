import alt from '../alt';
var lunr = require('lunr');

class IdeasStore {
  constructor() {
    this.ideas = [];

    this.on('bootstrap', () => {
      this.index = lunr(function() {
        this.ref('id');
        this.field('title', { boost: 10 });
        this.field('description');
      });

      for (var i = 0; i < this.ideas.length; i++) {
        this.index.add(this.ideas[i]);
      }
    });
  }
}

export default alt.createStore(IdeasStore, 'IdeasStore');
