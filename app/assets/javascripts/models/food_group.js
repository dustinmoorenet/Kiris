App.Model.FoodGroup = Backbone.Model.extend({
  urlRoot: App.url('food_groups')
});

App.Collection.FoodGroups = Backbone.Collection.extend({
  model: App.Model.FoodGroup,
  url: App.url('food_groups')
});
