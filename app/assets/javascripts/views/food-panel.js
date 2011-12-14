App.View.FoodPanel = Backbone.View.extend({
  events: {
    'click .expand-section-button': 'toggleExpand'
  },

  tagName: 'div',

  className: 'app-view-food-panel',

  initialize: function() {
  },

  render: function(food) {
    $(this.el).html(JST['templates/views/food-panel']({food: food}));
    var _this = this;

    $(function() {
      if ($(_this.el).height() > 135) {
        _this.toggleExpand();
        $(_this.el).find('.expand-section-button').show();
      }
    });
  },

  toggleExpand: function() {
    $(this.el).find('.expand-section').toggleClass('collapsed');
  }
});
