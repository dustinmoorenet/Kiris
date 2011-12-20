App.View.FoodInput = Backbone.View.extend({
  events: {
    'click .commit': 'commit'
  },

  tagName: 'div',

  className: 'app-view-food-input',

  initialize: function() {
    if (this.model.isNew()) {
      this.render();
    } else {
      var self = this;
      this.model.fetch({success: function() { self.render(); }});
    }
  },

  render: function() {
    var model = this.model;
    $(this.el).html(JST['templates/views/food-input']({food:model}));
    this.$('#name'        ).bind('change', function() { model.set({name:          this.value}); });
    this.$('#amount'      ).bind('change', function() { model.set({amount:        this.value}); });
    this.$('#unit'        ).bind('change', function() { model.set({unit_id:       $(this).val()}); });
    this.$('#calories'    ).bind('change', function() { model.set({calories:      this.value}); });
    this.$('#fat_calories').bind('change', function() { model.set({fat_calories:  this.value}); });
    this.$('#food_group'  ).bind('change', function() { model.set({food_group_id: $(this).val()}); });
  },

  commit: function() {
    var self = this;
    this.model.save({success: function() { self.render(); }});
  }
});
