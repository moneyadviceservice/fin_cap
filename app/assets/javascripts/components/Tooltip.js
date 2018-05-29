define(['jquery', 'DoughBaseComponent'], function($, DoughBaseComponent) {
  'use strict';

  var Tooltip,
      defaultConfig = {};

  Tooltip = function($el, config) {
    Tooltip.baseConstructor.call(this, $el, config, defaultConfig);

    this.$content = $el.find('[data-tooltip-content]');
    this.hiddenClass = 'js-is-hidden';
  };

  /**
  * Inherit from base module, for shared methods and interface
  */
  DoughBaseComponent.extend(Tooltip);

  Tooltip.componentName = 'Tooltip';

  /**
  * Initialize the component
  */
  Tooltip.prototype.init = function(initialised) {
    this._initialisedSuccess(initialised);
    this._setUpComponent();
  };

  Tooltip.prototype._setUpComponent = function() {
    var self = this;
    var pause = false;

    // Default - show on click, hide on blur/second click
    /* If mouse events aren't supported or if the user clicks while still "hovering" then we use click.
    The pause variable makes sure if the mouseover event is triggered then click is not. */
    this.$el.on('click', function() {
      if (!pause){
        self.$content.toggleClass(self.hiddenClass);
      }
      pause = false;
    });
    /* In case the user clicks elsewhere on the page and mouseout hasn't fired */
    this.$el.on('blur', function() {
      self.$content.addClass(self.hiddenClass);
    });

    // Hover supported - show on hover
    this.$el.on('mouseenter', function() {
      pause = true;
      self.$content.removeClass(self.hiddenClass);
    });

    this.$el.on('mouseleave', function() {
      self.$content.addClass(self.hiddenClass);
    });
  };

  return Tooltip;
});
