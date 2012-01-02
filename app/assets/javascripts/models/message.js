App.Model.Message = Backbone.Model.extend({
  defaults : {
    summary: '',
    text: '',
    severity: 'info'
  }
});

App.Collection.Messages = Backbone.Collection.extend({
  model: App.Model.Message,
});
