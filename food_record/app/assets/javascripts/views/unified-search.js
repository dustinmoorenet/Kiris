App.View.UnifiedSearch = Backbone.View.extend({
  events: {
    'searchInitiated': 'appendAddButton'
  },

  tagName: 'div',

  className: 'app-view-unified-search',

  initialize: function() {
    this.render();
  },

  render: function() {
    $(this.el).html(JST['templates/views/unified-search']({food_groups: App.Data.FoodGroups}));   

    var input = new App.View.SuggestInput();
    this.$('.filter-plate').append(input.el);
    input.onClick();
  },

  appendAddButton: function() {

    if (this.$('.app-view-suggest-input.add').length == 0) {
      var input = new App.View.SuggestInput();
      this.$('.filter-plate').append(input.el);
    }

    var $inputs = this.$('.app-view-suggest-input:not(.destroyed)');
    if ($inputs.length == 1 && $inputs.filter('.add').length == 1) {
      $inputs.removeClass('add').find('input').focus();
    }
  },

  urlQuestion: function() {
    var params = [];

    var $suggest_inputs = this.$('.app-view-suggest-input');

    $suggest_inputs.each(function() {
      var $suggest_input = $(this);

      if ($suggest_input.hasClass('food'))
        params.push('name=' + escape($suggest_input.find('input').val()));
  
      if ($suggest_input.hasClass('company'))
        params.push('company_name=' + escape($suggest_input.find('input').val()));
  
      if ($suggest_input.hasClass('food-group'))
        params.push('food_group_id[]=' + escape($suggest_input.find('input').data('value')));
  
    });
    return params.length > 0 ? '?' + params.join('&') : ''
  },

  addFilter: function(type, value) {
    var $div = $(this.el).find('.filter-plate').append('<div>').find(':last-child');

    $div.addClass(type);
    $div.html(type + ': ' + value);
  }

});
