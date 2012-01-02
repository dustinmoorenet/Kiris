App.View.MessagePopup = Backbone.View.extend({
  events: {
    'click .close': '_onClose',
    'click .confirm': '_onConfirm',
    'click .cancel': '_onCancel'
  },

  className: 'app-view-message-popup',

  tagName: 'div',

  initialize: function() {
    var options = this.options;
    this.model = this.model || new App.Model.Message();
    options.title = options.title || this.model.get('summary') || 'Message';
    options.message = options.message || this.model.get('text') || 'Attention!';
    options.type = options.type || 'alert';
    options.duration = typeof(options.duration) != 'undefined' ? options.duration
                     : options.type == 'notice' ? 3000
                     : 0;

    this.render();

    var self = this;
    if (options.duration)
      setTimeout(function() { self.destroy(); }, options.duration);
  },

  render: function() {

    this.barrier = new App.View.Barrier();

    $this = $(this.el);
    $this.html(JST['templates/views/message-popup']({obj: this.options}));

    $body = $(App.Globals.Workspace.main.el);
    $body.append(this.el);
    
    var left = ($(window).width() / 2) - ($this.width() / 2);
    var top = ($(window).height() / 2) - ($this.height() / 2);
    $this.css('top', top);
    $this.css('left', left);
  },

  destroy: function() {

    this.barrier.destroy();
    $(this.el).remove();
  },

  _onClose: function() {

    this.destroy();

    if (this.options.onClose)
      this.options.onClose();
  },

  _onConfirm: function() {

    this.destroy();

    if (this.options.onConfirm)
      this.options.onConfirm();
  },

  _onCancel: function() {

    this.destroy();

    if (this.options.onCancel)
      this.options.onCancel();
  }
});
