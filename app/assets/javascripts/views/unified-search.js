App.View.UnifiedSearch = Backbone.View.extend({
  events: {
    'searchInitiated': 'appendAddButton'
  },

  tagName: 'div',

  className: 'app-view-unified-search',

  MAX_INPUTS: 4,

  initialize: function() {
    this.render();
  },

  render: function() {
    $(this.el).html(JST['templates/views/unified-search']({food_groups: App.Data.FoodGroups}));   

    if (this.options.url_question) {
      this.parseUrlQuestion();
    }

    // Add a blank input and focus on it 
    var count = this.$('.filter-plate .app-view-suggest-input').length;
    if (count < this.MAX_INPUTS) {
      var input = new App.View.SuggestInput();
      this.$('.filter-plate').append(input.el);

      // Single input gets expanded
      if (count == 0)
        input.onClick();
    }

    this.trigger('searchInitiated');
  },

  appendAddButton: function() {

    var $inputs = this.$('.app-view-suggest-input:not(.destroyed)');

    if ($inputs.filter('.add').length == 0
        && $inputs.find('input:visible').length == 0
        && $inputs.length < this.MAX_INPUTS) {
      var input = new App.View.SuggestInput();
      this.$('.filter-plate').append(input.el);
      $inputs = this.$('.app-view-suggest-input:not(.destroyed)');
    }

    if ($inputs.length == 1 && $inputs.filter('.add').length == 1) {
      $inputs.removeClass('add').find('input').focus();
    }
  },

  parseUrlQuestion: function() {
    var self = this;

    var params = this.options.url_question.split('&');
    _.each(params, function(param, index) {

      if (index >= self.MAX_INPUTS)
        return;

      var items = param.split('=');
      if (items.length == 2) {
        var key = items[0];
        var value = items[1];

        var category = '';
        var data_value;

        if (key == 'name') {
          category = 'food';

        } else if (key == 'company_name') {
          category = 'company';

        } else if (key == 'food_group_id[]') {
          category = 'food-group';
          data_value = value;
          value = App.Data.FoodGroups.get(value).get('name');

        } else if (key == 'food_group_name') {
          category = 'food-group';
        }

        input = new App.View.SuggestInput({
          category: category,
          value: value,
          data_value: data_value
        });

        self.$('.filter-plate').append(input.el);
      }
    });

  },

  urlQuestion: function() {
    var params = [];

    var $suggest_inputs = this.$('.app-view-suggest-input:not(.add,.destroyed)');

    $suggest_inputs.each(function() {
      var $suggest_input = $(this);
      var $input = $suggest_input.find('input');

      if ($suggest_input.hasClass('food'))
        params.push('name=' + escape($input.val()));
  
      if ($suggest_input.hasClass('company'))
        params.push('company_name=' + escape($input.val()));
  
      if ($suggest_input.hasClass('food-group')) {
        if ($input.data('value'))
          params.push('food_group_id[]=' + escape($input.data('value')));
        else
          params.push('food_group_name=' + escape($input.val()));
      }

      if ($suggest_input.hasClass('all') && $input.val().trim() != '')
        params.push('all=' + escape($input.val()));
  
    });
    return params.length > 0 ? params.join('&') : ''
  },

  addFilter: function(type, value) {
    var $div = $(this.el).find('.filter-plate').append('<div>').find(':last-child');

    $div.addClass(type);
    $div.html(type + ': ' + value);
  }

});
