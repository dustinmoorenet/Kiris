App.View.SuggestInput = Backbone.View.extend({
  events: {
    'item-selected .app-view-suggest-item': 'itemSelected',
    'keydown input': 'onKeyDown',
    'keyup input': 'onKeyUp',
    'mouseover .app-view-suggest-item': 'onMouseover',
    'blur input': 'itemSelected',
    'focus input': 'inputFocus',
    'click': 'onClick'
  },

  tagName: 'div',

  className: 'app-view-suggest-input add',

  initialize: function() {
    this.render();
  },

  render: function() {

    $(this.el).html(JST["templates/views/suggest-input"]());

  },

  onClick: function() {
    if ($(this.el).hasClass('add')) {
      $(this.el).removeClass('add').find('label').html('');
      this.$('input').focus();
    }
  },

  itemSelected: function() {
    if ($(this.el).hasClass('compact'))
      return;

    $(this.el).removeClass('hasFocus');

    var $item = this.$('.drop-down .selected').removeClass('selected'); 
    if ($item.length > 0) {
      this.$('input').val($item.text())
                     .data('value', $item.data('value'));
      $(this.el).addClass($item.data('type'));
    }
    this.$('.drop-down').html('').hide();

    if (this.$('input').val() != '') {
      this.$('label').text(this.$('input').val());

      $(this.el).trigger('searchInitiated');

      $(this.el).addClass('compact')
                .removeClass('hasFocus')


      $(this.el).bind('click', function() {
        $(this).unbind('click', arguments.callee)
               .removeClass('compact')
               .find('input').focus();

        this.$('label').html('');
      });
    }
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
      var self = this;
      var value = this.$('input').val();
      var $dd = this.$('.drop-down');
      var stamp = new Date().getTime();
      this.stamp = stamp;

      $.getJSON('search/unifiedSearch',
        {value: value, types: ['food', 'food-group', 'company']},
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
