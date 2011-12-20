App.View.Search = Backbone.View.extend({
  events: {
    'searchInitiated .app-view-unified-search': 'buildList'
  },

  tagName: 'div',

  className: 'app-view-search',

  initialize: function() {
    this.render();
  },

  render: function() {
    this.unified_search = new App.View.UnifiedSearch();

    $(this.el).html(this.unified_search.el)
              .append(JST['templates/views/search']());   

    this.$results = $(this.el).find('.results');
  },

  buildList: function() {
    this.$results.html('');

    var foods = new App.Collection.Foods();

    foods.url = foods.url + this.unified_search.urlQuestion();

    var _this = this;
    foods.fetch({
      success: function(_foods, _data) {

        _.each(_data, function(food) {
          var food_panel = new App.View.FoodPanel({model: new App.Model.Food(food)});
          food_panel.render();
          _this.$results.append(food_panel.el);
        });
      }
    });
  }
});
