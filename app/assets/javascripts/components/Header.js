define(['jquery', 'DoughBaseComponent'], function($, DoughBaseComponent) {
  'use strict';

  var Header,
      defaultConfig = {};

  Header = function($el, config) {
    Header.baseConstructor.call(this, $el, config, defaultConfig);

    this.activeClass = 'mobile-header__search-active';
    this.$mobileSearchButton = this.$el.find('[data-mobile-search-button]');
    this.$mobileSearchText = this.$mobileSearchButton.find('[data-mobile-search-text]');
    this.openText = this.$mobileSearchText.html(); 
    this.closeText = this.config.textClose;
  };

  /**
  * Inherit from base module, for shared methods and interface
  */
  DoughBaseComponent.extend(Header);

  Header.componentName = 'Header';

  /**
  * Initialize the component
  */
  Header.prototype.init = function(initialised) {
    this._initialisedSuccess(initialised);
    this._setUpMobileInteraction();
  };

  /**
  * Set up events for nav on mobile
  */
  Header.prototype._setUpMobileInteraction = function() {
    this._attachBoundHelper(this.$mobileSearchButton, this._toggleMobileHeader, this);
  };

  /**
  * Opens/closes nav on  mobile
  */
  Header.prototype._toggleMobileHeader = function() {
    this.$el.toggleClass(this.activeClass);
    if (this.$el.hasClass(this.activeClass)) {
      this.$mobileSearchText.html(this.closeText);
    } else {
      this.$mobileSearchText.html(this.openText)
    }
  };

  /**
   * Handles bound events for mobile nav
   */
  Header.prototype._attachBoundHelper = function($el, callback, context) {
    $el.click(function(e) {
      e.preventDefault();
      callback.call(context, this);
    });
  }

  return Header;
});
