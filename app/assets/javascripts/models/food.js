App.Model.Food = Backbone.Model.extend({
  urlRoot: App.url('foods'),

  defaults: {
    amount: 1,
    calories: 0,
    fat_calories: 0
  },

  validate: function(attrs) {
    var errors = [];

    _.each(attrs, function(value, key) {
      if (key == 'name' && value == '') {
        errors.push({ attr: key, msg: 'Field is required' });

      } else if (key == 'amount' && (!$.isNumeric(value) || value <= 0)) {
        errors.push({ attr: key, msg: 'Must be greater than zero ' });

      } else if (_.include(['calories', 'fat_calories'], key)
          && (!$.isNumeric(value) || value < 0)) {
        errors.push({ attr: key, msg: 'Must be greater than or equal to zero' });
      }
    });

    if (errors.length > 0)
      return errors;
  }
});

App.Collection.Foods = Backbone.Collection.extend({
  model: App.Model.Food,
  url: App.url('foods')
});
