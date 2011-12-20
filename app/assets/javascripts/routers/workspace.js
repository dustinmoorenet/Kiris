App.Router.Workspace = Backbone.Router.extend({
  routes: {
    '': 'index',
    'search': 'search',
    'edit/:type': 'edit',
    'edit/:type/:id': 'edit'
  },

  initialize: function() {
    this.main = new App.View.Main();
  },

  index: function() {
  },

  search: function() {
    this.main.showSearch();
  },

  edit: function(type, id) {
    this.main.showEdit(type, id);
  }
});
