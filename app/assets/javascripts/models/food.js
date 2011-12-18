App.Model.Food = Backbone.Model.extend({
  urlRoot: App.url('foods')
});

App.Collection.Foods = Backbone.Collection.extend({
  model: App.Model.Food,
  url: App.url('foods')
});
