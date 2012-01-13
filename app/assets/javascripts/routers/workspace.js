App.Router.Workspace = Backbone.Router.extend({
  routes: {
    '': 'index',
    'search': 'search',
    'search?:url_question': 'search',
    'edit/:type': 'edit',
    'edit/:type/:id': 'edit'
  },

  initialize: function() {
    this.main = new App.View.Main();
  },

  index: function() {
  },

  search: function(url_question) {
    this.main.showSearch(url_question);
  },

  edit: function(type, id) {
    this.main.showEdit(type, id);
  }
});
