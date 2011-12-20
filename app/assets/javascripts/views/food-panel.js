App.View.FoodPanel = Backbone.View.extend({
  events: {
    'click .expand-section-button': 'toggleExpand',
    'dblclick': 'editFood'
  },

  tagName: 'div',

  className: 'app-view-food-panel',

  initialize: function() {
  },

  render: function() {
    $(this.el).html(JST['templates/views/food-panel']({food: this.model}));
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
  },

  editFood: function() {
    App.Globals.Workspace.navigate('edit/food/' + this.model.id, true);
  }
});
