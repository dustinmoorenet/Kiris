var App = {
  Router: {},
  Model: {},
  Collection: {},
  View: {}
}

$(function() {
  new App.Router.Workspace();
  Backbone.history.start();
});
