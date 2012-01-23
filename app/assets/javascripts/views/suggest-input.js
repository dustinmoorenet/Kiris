App.View.SuggestInput = Backbone.View.extend({
  events: {
    'item-selected .app-view-suggest-item': 'itemSelected',
    'keydown input': 'onKeyDown',
    'keyup input': 'onKeyUp',
    'mouseover .app-view-suggest-item': 'onMouseover',
    'blur input': 'itemSelected',
    'focus input': 'inputFocus',
    'click': 'onClick',
    'click .close': 'destroy'
  },

  tagName: 'div',

  className: 'app-view-suggest-input all',

  type: 'all',

  categories: [],

  initialize: function() {
    this.render();
  },

  render: function() {
    var $el = $(this.el);

    $el.html(JST["templates/views/suggest-input"]());

    $el.addClass(this.className);

    this.categories = $el.data('categories') || this.options.categories;

    var category = $el.data('category') || this.options.category;

    var text = typeof ($el.data('text')) != 'undefined' ? $el.data('text')
             : this.options.text;

    var value = typeof ($el.data('value')) != 'undefined' ? $el.data('value')
              : this.options.value;


    if (category) {
      $el.removeClass('all')
         .addClass(category);
      this.type = category;
    }

    if (text) {
      this.$('input').val(text);
    }

    if (value) {
      this.$('input').data('value', value);
    }
  },

  destroy: function() {
    $(this.el).addClass('destroyed').trigger('searchInitiated').remove();
  },

  onClick: function() {
  },

  itemSelected: function() {

    $(this.el).removeClass('hasFocus all ' + this.categories.join(' '));

    var $item = this.$('.drop-down .selected').removeClass('selected'); 
    var type;
    if ($item.length > 0) {
      type = $item.data('type');
      this.$('input').val($item.text())
                     .data('value', $item.data('value'));
      $(this.el).removeClass('all')
                .addClass(type);
      this.type = type;
    }

    this.$('.drop-down').html('').hide();
    this.stamp = 0;

    var input_value = $.trim(this.$('input').val());
    if (input_value !== '') {
      
      var matches = input_value.match(/^\s*(Company|Food|FoodGroup):\s*(.*)$/i);
      if (matches) {
        type = matches[1].toLowerCase();
        if (type == 'foodgroup')
          type = 'food-group';

        if (_.indexOf(this.categories, type) == -1)
          return;

        this.$('input').val(matches[2]);
        $(this.el).removeClass('all')
                  .addClass(type);
        this.type = type;

      } else {
        $(this.el).addClass(this.type);
      }

      $(this.el).removeClass('hasFocus');

    } else {
      this.destroy();
    }
    $(this.el).trigger('searchInitiated');
  },

  inputFocus: function() {
    $(this.el).addClass('hasFocus');
  },

  onKeyDown: function(event) {

    if (event.keyCode == 40 /* down */ || event.keyCode == 38 /* up */) {
      var direction_down = (event.keyCode == 40);
      var $drop_down = this.$('.drop-down');
      var $item = $drop_down.find('.selected');

      if ($item.length > 0) {

        if (direction_down)
          $item.filter(':not(:last-child)')
               .removeClass('selected')
               .next()
               .addClass('selected');
        else
          $item.removeClass('selected')
               .prev()
               .addClass('selected');

      } else if (direction_down) {
        $drop_down.find('div:first').addClass('selected');
      }

      $item = $drop_down.find('.selected');

      if ($item.length > 0) {
        var selected_index = $drop_down.find('> div').index($item.get(0));

        var item_height = $item.height() + 1;
        var window_height = $drop_down.height();

        var reverse_offset = direction_down ? (window_height - item_height) : 0;
        var offset = (item_height * selected_index);
        var window_offset = offset - $drop_down.scrollTop(); 

        if (window_offset > 0 && window_offset < window_height)
          offset = $drop_down.scrollTop();
        else
          offset -= reverse_offset;

      } else {
        var offset = 0;
      }

      $drop_down.scrollTop(offset);
    } else if (event.keyCode == 13) {
      this.itemSelected();
    }
  },

  onKeyUp: function(event) {
    var key = event.keyCode;
    if (!(key == 40 || key == 38 || key == 13)) {
      if (this.type != 'all') {
        this.type = 'all';
        $(this.el).removeClass(this.categories.join(' ')).addClass('all');
      }

      var value = $.trim(this.$('input').val());

      var $dd = this.$('.drop-down');
      var stamp = new Date().getTime();
      this.stamp = stamp;

      var self = this;
      $.getJSON(App.url('search/unifiedSearch'),
        {value: value, types: this.categories},
        function(data) {
          if (stamp == self.stamp) {
            $dd.html('');

            if (data.length > 0)
              $dd.show();
            else
              $dd.hide();

            _.each(data, function(item) {
              var item_view = new App.View.SuggestItem(item.type, item.text, item.value);
              $dd.append(item_view.el);
            });
          }
        }
      );
    }
  },

  onMouseover: function(event) {
    this.$('.selected').removeClass('selected');
    $(event.currentTarget).addClass('selected');
  }

});
