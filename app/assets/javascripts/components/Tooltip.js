define(['jquery', 'DoughBaseComponent'], function($, DoughBaseComponent) {
  'use strict';

  var Tooltip,
      defaultConfig = {};

  Tooltip = function($el, config) {
    Tooltip.baseConstructor.call(this, $el, config, defaultConfig);

    this.$button = $el.find('[data-tooltip-button]');
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

    // Touch devices
    $(document).on('touchend', function(e) {
      if (e.target === self.$button[0]) {
        if (self.$content.hasClass(self.hiddenClass)) {
          self.$content.removeClass(self.hiddenClass);
        } else {
          self.$content.addClass(self.hiddenClass);
        }
      } else {
        self.$content.addClass(self.hiddenClass);
      }
    });

    // Non-touch devices
    this.$button.on('mouseover', function() {
      self.$content.removeClass(self.hiddenClass);
    });

    this.$button.on('mouseout', function() {
      self.$content.addClass(self.hiddenClass);
    });
  };

  return Tooltip;
});
