App.Router.Workspace = Backbone.Router.extend({
  routes: {
    '' : 'index'
  },

  initialize: function() {

  },

  index: function() {
    new App.View.Main();
  }
});
