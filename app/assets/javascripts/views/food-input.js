App.View.FoodInput = Backbone.View.extend({
  events: {
    'click .commit': 'commit',
    'change input,select': 'onChange',
    'focus input': 'onFocus'
  },

  tagName: 'div',

  className: 'app-view-food-input',

  initialize: function() {
    this.model.bind('error', this.onError, this);

    if (this.model.isNew()) {
      this.render();
    } else {
      var self = this;
      this.model.fetch({success: function() { self.render(); }});
    }
  },

  render: function() {
    $(this.el).html(JST['templates/views/food-input']({food:this.model}));

    this.checkComplete();
  },

  commit: function() {
    var self = this;

    if (this.checkComplete()) {
      this.model.save(null, {success: function() {
        self.render();
        new App.View.MessagePopup({
          type: 'notice',
          title: 'Success',
          message: 'Food saved successfully.'
        });
      }});
    }
  },

  onFocus: function(event) {
    $(event.target).removeClass('error');
  },

  onChange: function(event) {

    var $element = $(event.target);
    var attrs = {};
    attrs[$element.attr('id')] = $element.val();

    if (this.model.set(attrs)) {
      $element.removeClass('error');
      this.$('.msg.' + $element.attr('id')).html('');
    }

    this.checkComplete();
  },

  onError: function(model, errors) {
    var self = this;
    _.each(errors, function(error) {

      self.$('#' + error.attr).addClass('error');
      self.$('.msg.' + error.attr).html(error.msg);
    });
  },

  checkComplete: function() {
    var attrs = {
      name: this.$('#name').val(),
      company: this.$('#company').val(),
      amount: this.$('#amount').val(),
      unit_id: this.$('#unit_id').val(),
      calories: this.$('#calories').val(),
      fat_calories: this.$('#fat_calories').val(),
      food_group_id: this.$('#food_group_id').val(),
    }

    var outcome = this.model.set(attrs);

    if (this.$('.error').length == 0)
      this.$('.commit').removeClass('disabled').prop('disabled', false);
    else
      this.$('.commit').addClass('disabled').prop('disabled', true);

    return outcome;
  }
});
