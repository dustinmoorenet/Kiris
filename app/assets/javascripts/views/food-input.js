App.View.FoodInput = Backbone.View.extend({
  events: {

  },

  tagName: 'div',

  className: 'app-view-food-input',

  initialize: function() {
    this.render(this.id);
  },

  render: function(id) {
    // get food model from id if id exists

    var food = {};
    $(this.el).html(JST['templates/views/food-input']({food:food}));
  }
});
