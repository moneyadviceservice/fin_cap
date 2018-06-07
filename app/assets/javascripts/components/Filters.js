define(['jquery', 'DoughBaseComponent'], function($, DoughBaseComponent) {
  'use strict';

  var Filter,
      defaultConfig = {};

  Filter = function($el, config) {
    Filter.baseConstructor.call(this, $el, config, defaultConfig);

    this.$filters = $el.find('[data-form-filter-radio], [data-form-filter-checkbox]');
    this.$form = $el;
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
  }

  /**
  * Submit the Form
  */
  Filter.prototype._submitForm = function() {
    this.$form.submit();
  }

  return Filter;
});
