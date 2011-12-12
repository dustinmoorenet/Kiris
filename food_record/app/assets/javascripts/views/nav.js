App.View.Nav = Backbone.View.extend({
  events: {
    'click .inline-nav li:contains("Search")': 'showSearch',
    'click .inline-nav li:contains("Add")': 'showAdd',
    'click .dropdown-nav label': 'toggleDropdownNav',
    'click .dropdown-nav li': 'hideDropdownNav',
    'click .dropdown-nav li:contains("Settings")': 'showSettings',
    'click .dropdown-nav li:contains("Logout")': 'logout',
  },

  tagName: 'div',

  className: 'app-view-nav',

  initialize: function() {
    this.render();
  },

  render: function() {
    $(this.el).html(JST['templates/views/nav']()); 
    $(this.el).find('.dropdown-nav ul').hide();
  },

  showSearch: function() {
    console.log('need to create a search view');
  },

  showAdd: function() {
    console.log('need to create an add view');
  },

  toggleDropdownNav: function() {
    $(this.el).find('.dropdown-nav ul').toggle();
  },

  hideDropdownNav: function() {
    $(this.el).find('.dropdown-nav ul').hide();
  },

  showSettings: function() {
    console.log('need to create a settings view');
  },

  logout: function() {
    console.log('need to create a logout function');
  }
});
