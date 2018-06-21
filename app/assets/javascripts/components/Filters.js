define(['jquery', 'DoughBaseComponent'], function($, DoughBaseComponent) {
  'use strict';

  var Filter,
      defaultConfig = {};

  Filter = function($el, config) {
    Filter.baseConstructor.call(this, $el, config, defaultConfig);

    this.$filters = $el.find('[data-form-filter-radio], [data-form-filter-checkbox]');
    this.$toggle = $el.find('[data-form-filter-toggle]');
    this.$wrap = $el.find('[data-form-filter-wrap]');
    this.$form = $el;

    this.activeClass = "is-open";
    this.breakpoint = 720;

    this.windowSize = $(window).width();
  };

  /**
  * Inherit from base module, for shared methods and interface
  */
  DoughBaseComponent.extend(Filter);

  Filter.componentName = 'Filter';

  /**
  * Initialize the component
  */
  Filter.prototype.init = function(initialised) {
    this._initialisedSuccess(initialised);
    this._setUpComponent();
  };

  Filter.prototype._setUpComponent = function() {
    var self = this;

    this.$filters.each(function() {
      $(this).on('change', function() {
        self._submitForm();
      });
    });

    self._toggleFilters(self, true);
    $(window).resize(function() {
      self._toggleFilters(self)
    });
  }

  /**
  * Submit the Form
  */
  Filter.prototype._submitForm = function() {
    this.$form.submit();
  }

  /**
  * Assign/Remove listner on toggle
  */
  Filter.prototype._toggleFilters = function(self, isLoad) {  
    if ($(window).width() < this.breakpoint) {
      self._toggleMobile(self, isLoad);
    } else {
      self._toggleDesktop(self, isLoad);
    }
    self.windowSize = $(window).width();
  } 

  /**
  * Is Mobile
  *   was previously desktop, or page just loaded, so rest for mobile
  */
  Filter.prototype._toggleMobile = function(self, isLoad) {
    if (self.windowSize > this.breakpoint || isLoad) {
      self.$form.removeClass(this.activeClass);
      self.$wrap.slideUp(0);

      self.$toggle.on('click', function(e) {
        e.preventDefault();
        self._toggleAnimate();
      })
    }
  }
  /**
  * Is Desktop
  *   was previously mobile, or page just loaded, so rest for desktop
  */
  Filter.prototype._toggleDesktop = function(self, isLoad) {
    if (self.windowSize < this.breakpoint || isLoad) {
      self.$toggle.off();
      self.$wrap.slideDown(0);
    }
  }

  /**
  * Filter toggle
  */
  Filter.prototype._toggleAnimate = function() {
    var self = this;

    self.$form.toggleClass(this.activeClass);
    self.$wrap.slideToggle(300);
  }

  return Filter;
});
