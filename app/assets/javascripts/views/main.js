App.View.Main = Backbone.View.extend({
  routes: {
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
    $div.append(search.el);

    $(this.el).html($div);
  }
});
