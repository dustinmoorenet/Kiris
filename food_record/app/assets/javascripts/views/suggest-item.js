App.View.SuggestItem = Backbone.View.extend({
  events: {
  },

  tagName: 'div',

  className: 'app-view-suggest-item',

  initialize: function(type_class, text, value) {
    $(this.el).html('<div class="icon"></div><div class="text"></div>')
              .addClass(type_class)
              .data('type', type_class)
              .data('value', value);

    this.$('.text').html(text);
  }
});
