App.Model.Unit = Backbone.Model.extend({
  urlRoot: 'units'
});

App.Collection.Units = Backbone.Collection.extend({
  model: App.Model.Unit,
  url: 'units'
});

