var App = {
  Globals: {},
  Router: {},
  Model: {},
  Collection: {},
  View: {},
  url: function(location) {
    if (window.location.pathname == '/')
      return location;
    else
      return window.location.pathname + '/' + location;
  }
}

$(function() {
  App.Globals.Workspace = new App.Router.Workspace();
  Backbone.history.start();
});
