define(['jquery', 'DoughBaseComponent', 'mediaQueries'], function($, DoughBaseComponent, mediaQueries) {
  'use strict';

  var Teaser,
      defaultConfig = {};

  Teaser = function($el, config) {
    Teaser.baseConstructor.call(this, $el, config, defaultConfig);

    this.$teaser = $el;
    this.$content = $el.find('[data-teaser-content]');
    this.$image = $el.find('[data-teaser-image]');

    this.atLargerViewport;
  };

  /**
  * Inherit from base module, for shared methods and interface
  */
  DoughBaseComponent.extend(Teaser);

  Teaser.componentName = 'Teaser';

  /**
  * Initialize the component
  */
  Teaser.prototype.init = function(initialised) {
    this._initialisedSuccess(initialised);
    this._setUpComponent();
  };

  Teaser.prototype._setUpComponent = function() {
    var self = this;

    self._getViewportSize();

    self._checkHeight();
    $(window).resize(function() {
      self._checkHeight();
    });

  }

  Teaser.prototype._checkHeight = function() {
    var self = this;

    // If it was larger, but now isn't, lets strip once
    if ( !self._isLarger() && self.atLargerViewport ) {
      self._stripJs();
      self._getViewportSize();
    }
    // If it's larger we need to strip and check the heights 
    else if (self._isLarger()) {
      self._stripJs();
      if ( self.$content.outerHeight() > self.$image.outerHeight() ){
        self._setMaxHeight();
        self._getViewportSize();
      }
    } 
  }

  Teaser.prototype._setMaxHeight = function() {
    var self = this;   
    self.$image.css({maxHeight: self.$content.outerHeight()});
  }

  Teaser.prototype._stripJs = function() {
    var self = this;   
    self.$image.attr("style", "");
  }

  Teaser.prototype._getViewportSize = function() {
    var self = this;
    self.atLargerViewport = self._isLarger();
  }

  Teaser.prototype._isLarger = function() {
    return (mediaQueries.atMediumViewport() || mediaQueries.atLargeViewport());
  }


  return Teaser;
});
