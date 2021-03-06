App.View.Main = Backbone.View.extend({
  events: {
    'edit': 'showEdit'
  },

  el: 'body',

  initialize: function() {
    this.render();
  },

  render: function() {
    var nav = new App.View.Nav();
    var search = new App.View.Search();

    var $div = $('<div class="app-view-main"></div>');
    $div.html(nav.el);
    $div.append('<div class="panel"></div>');

    $(this.el).html($div);
    this.$('.panel').html(search.el);
  },

  showSearch: function(url_question) {
    var search = new App.View.Search({url_question: url_question});
    this.$('.panel').html(search.el);

    if (url_question)
      search.buildList(url_question);
  },

  showEdit: function(type, id) {
    if (type == 'food') {
      var model = new App.Model.Food({id: id});
      var input = new App.View.FoodInput({model: model});
    }

    if (input)
      this.$('.panel').html(input.el);
  }
});
