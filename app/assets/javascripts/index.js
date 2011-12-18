var App = {
  Router: {},
  Model: {},
  Collection: {},
  View: {},
  url: function(location) {
    return window.location.pathname + location;
  }
}

$(function() {
  new App.Router.Workspace();
  Backbone.history.start();
});
