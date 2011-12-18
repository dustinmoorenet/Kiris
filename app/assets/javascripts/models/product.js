App.Model.Product = Backbone.Model.extend({
  urlRoot: App.url('products')
});

App.Collection.Products = Backbone.Collection.extend({
  model: App.Model.Product,
  url: App.url('products')
});
