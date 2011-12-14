App.Model.Food = Backbone.Model.extend({
  urlRoot: 'foods'
});

App.Collection.Foods = Backbone.Collection.extend({
  model: App.Model.Food,
  url: 'foods'
});
