App.Model.FoodGroup = Backbone.Model.extend({
  urlRoot: 'food_groups'
});

App.Collection.FoodGroups = Backbone.Collection.extend({
  model: App.Model.FoodGroup,
  url: 'food_groups'
});
