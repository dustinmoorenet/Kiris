App.Model.Food = Backbone.Model.extend({
  urlRoot: App.url('foods'),

  validate: function(attrs) {
    if (!attrs.name) {
      return 'Food is incomplete';
    }
  }
});

App.Collection.Foods = Backbone.Collection.extend({
  model: App.Model.Food,
  url: App.url('foods')
});
