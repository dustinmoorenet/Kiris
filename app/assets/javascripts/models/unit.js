App.Model.Unit = Backbone.Model.extend({
  urlRoot: App.url('units')
});

App.Collection.Units = Backbone.Collection.extend({
  model: App.Model.Unit,
  url: App.url('units')
});

