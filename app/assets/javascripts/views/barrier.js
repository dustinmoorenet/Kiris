App.View.Barrier = Backbone.View.extend({
  events: {
    'click': '_onClick'
  },

  className: 'app-view-barrier',

  tagName: 'div',

  initialize: function() {
    this.render();

  },

  render: function() {
    $(App.Globals.Workspace.main.el).append(this.el);
    $this = $(this.el);

    $this.width($(document).width());
    $this.height($(document).height());

    var opacity = this.options.opacity;
    if (opacity > 0)
      $this.fadeTo('fast', opacity);
  },

  _onClick: function() {
    if (this.options.destroy_on_click)
      this.destroy();

    if (this.options.onClick)
      this.options.onClick();
  },

  destroy: function() {
    $(this.el).remove();
  }
});
