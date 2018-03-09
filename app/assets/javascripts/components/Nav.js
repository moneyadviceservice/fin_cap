define(['jquery', 'DoughBaseComponent', 'utilities', 'mediaQueries'], function($, DoughBaseComponent, utilities, mediaQueries) {
  'use strict';

  var Nav,
      defaultConfig = {};

  Nav = function($el, config) {
    Nav.baseConstructor.call(this, $el, config, defaultConfig);

    this.delay = 250;
    this.$mobileNavButton = $(document).find('[data-mobile-nav-button]');
    this.$mobileNavOverlay = $(document).find('[data-mobile-nav-overlay]');
    this.$nav = $el;
    this.$navLevel_1 = this.$nav.find('[data-nav-level-1]');
    this.$navLevel_1_item = this.$nav.find('[data-nav-level-1-item]');
    this.$navLevel_1_Heading = this.$nav.find('[data-nav-level-1-heading]');
    this.$navLevel_2 = this.$nav.find('[data-nav-level-2]');
    this.$navLevel_2_Heading = this.$nav.find('[data-nav-level-2-heading]');
    this.$navLevel_2_Extended_Heading = this.$nav.find('[data-nav-level-2-extended-heading]');
    this.$navLevel_3 = this.$nav.find('[data-nav-level-3]');
    this.$navLevel_3_Heading = this.$nav.find('[data-nav-level-3-heading]');
    this.$mobileNavClose = this.$nav.find('[data-mobile-nav-close]');
    this.$searchBar = this.$nav.find('[data-nav-search-bar]');
  };

  /**
  * Inherit from base module, for shared methods and interface
  */
  DoughBaseComponent.extend(Nav);

  Nav.componentName = 'Nav';

  /**
  * Initialize the component
  */
  Nav.prototype.init = function(initialised) {
    this._initialisedSuccess(initialised);
    this._setUpComponent();
    this._getViewportSize();
    this._setUpMobileAnimation();
    this._setUpMobileInteraction();
    this._setUpDesktopInteraction();
  };

  /**
   * Set up component
   */
  Nav.prototype._setUpComponent = function() {
    this.$nav.removeClass('uninitialised');

    $(window).on('resize', utilities.debounce(this._setUpMobileAnimation.bind(this), 100));
    $(window).on('resize', utilities.debounce(this._getViewportSize.bind(this), 99));
  };

  Nav.prototype._getViewportSize = function() {
    if (mediaQueries.atSmallViewport()) {
      this.atSmallViewport = true;
    } else {
      this.atSmallViewport = false;
    }
  }

  /**
  * Ensure mobile nav not activated on resize or page load
  */
  Nav.prototype._setUpMobileAnimation = function() {
    if (this.atSmallViewport) {
      this.$nav.removeClass('no-transition');

      if (this.$nav.hasClass('is-active')) {
        this.$mobileNavOverlay.addClass('is-active');
      }
    } else {
      this.$nav.addClass('no-transition');
      this.$mobileNavOverlay.removeClass('is-active');
    }
  };

  /**
  * Set up events for mobile nav
  */
  Nav.prototype._setUpMobileInteraction = function() {
    this._attachBoundHelper(this.$mobileNavButton, this._toggleMobileNav, this);
    this._attachBoundHelper(this.$mobileNavOverlay, this._toggleMobileNav, this);
    this._attachBoundHelper(this.$mobileNavClose, this._toggleMobileNav, this);
    this._attachBoundHelper(this.$navLevel_1_Heading, this._openMobileLevel2, this);
    this._attachBoundHelper(this.$navLevel_2_Heading, this._closeMobileLevel2, this);
    this._attachBoundHelper(this.$navLevel_2_Extended_Heading, this._openMobileLevel3, this);
    this._attachBoundHelper(this.$navLevel_3_Heading, this._closeMobileLevel3, this);
  };

  Nav.prototype._toggleMobileNav = function() {
    if (this.atSmallViewport) {
      this.$nav.toggleClass('is-active');
      this.$mobileNavOverlay.toggleClass('is-active');
      $('body').addClass('no-scroll');

      // If we just closed the nav, reset all subnavs
      if (!this.$nav.hasClass('is-active')) {
        this.$nav.removeClass('is-active');
        this.$mobileNavOverlay.removeClass('is-active');
        this.$navLevel_1.removeClass('is-active');
        this.$navLevel_1_item.removeClass('is-active');
        $('body').removeClass('no-scroll');
      }
    }
  };

  Nav.prototype._openMobileLevel2 = function(index) {
    if (this.atSmallViewport) {
      var siblingsNav = $(index).siblings().get(0);

      $(index)
        .parents('[data-nav-level-1-item]').toggleClass('is-active')
        .parents('[data-nav-level-1]').toggleClass('is-active');

      $(siblingsNav).removeClass('is-hidden');
    }
  };

  Nav.prototype._closeMobileLevel2 = function(index) {
    if (this.atSmallViewport) {
      $(index)
        .parents('[data-nav-level-1-item]').toggleClass('is-active')
        .parents('[data-nav-level-1]').toggleClass('is-active');

        setTimeout(function() {
          $('[data-nav-level-2]').addClass('is-hidden');
        }, 400);
    }
  };

  Nav.prototype._openMobileLevel3 = function(index) {
    if (this.atSmallViewport) {
      this.$navLevel_1.toggleClass('is-open');
      $(index).siblings('[data-nav-level-3]').toggleClass('is-active');
    }
  };

  Nav.prototype._closeMobileLevel3 = function(index) {
    if (this.atSmallViewport) {
      this.$navLevel_1.toggleClass('is-open');
      $(index).parents('[data-nav-level-3]').toggleClass('is-active');
    }
  };

  /**
  * Set up events for desktop nav
  */
  Nav.prototype._setUpDesktopInteraction = function() {
    var self = this;

    this.$nav
      .mouseleave(function() {
        if (!self.atSmallViewport) {
          window.clearTimeout(self.timeout);

          self.closeNavTimeout = window.setTimeout(function() {
            self._closeDesktopLevel2();
          }, self.delay);
        }
      })
      .mouseenter(function() {
        if (!self.atSmallViewport) {
          window.clearTimeout(self.closeNavTimeout);
        }
      });

    this.$navLevel_1_Heading
      .mouseenter(function(e) {
        if (!self.atSmallViewport) {
          window.clearTimeout(self.timeout);

          self.timeout = window.setTimeout(function() {
            self._openDesktopLevel2($(e.target));
          }, self.delay);
        }
      })
      .mousedown(function(e) {
        if (!self.atSmallViewport) {
          e.preventDefault();
        }
      });

    this.$searchBar
      .mouseenter(function(e) {
        if (!self.atSmallViewport) {
          window.clearTimeout(self.timeout);

          self.timeout = window.setTimeout(function() {
            self._closeDesktopLevel2();
          }, self.delay);
        }
      });

    this.$navLevel_2_Extended_Heading
      .mouseenter(function() {
        if (!self.atSmallViewport) {
          self._openDesktopLevel3(this);
        }
      });

    if (Modernizr.touchevents) {
      // touch event outside of global nav triggers close
      $(document).on('touchend', function(e) {
        if (!self.atSmallViewport) {
          if ($(e.target).parents(self.$nav).length == 0) {
            self.$navLevel_1_item.removeClass('is-active');
          }
        }
      });

      this.$navLevel_1_Heading.on('touchend', function(e) {
        if (!self.atSmallViewport) {
          // stops default mouse-emulation handling
          e.preventDefault();

          // touch event on top level heading triggers open/close subnav
          if ($(e.target).parents('[data-nav-level-1-item]').hasClass('is-active')) {
            self._closeDesktopLevel2(e.target);
          } else {
            self._openDesktopLevel2(e.target);
          }
        }
      });

      this.$navLevel_2_Extended_Heading.on('touchend', function(e) {
        if (!self.atSmallViewport) {
          // stops default mouse-emulation handling
          e.preventDefault();

          self._openDesktopLevel3(this);
        }
      });
    }
  };

  /**
   * Opens subnav on desktop
   */
  Nav.prototype._openDesktopLevel2 = function(index) {
    if (!self.atSmallViewport) {
      this.$navLevel_3.removeClass('is-active');
      this.$navLevel_2.removeClass('is-active');
      this.$navLevel_1_item.removeClass('is-active');

      $(index)
        .parent('[data-nav-level-1-item]').addClass('is-active')
        .siblings('[data-nav-level-2]').addClass('is-active');
    }
  };

  /**
   * Closes subnav on desktop
   */
  Nav.prototype._closeDesktopLevel2 = function(index) {
    if (!self.atSmallViewport) {
      this.$navLevel_3.removeClass('is-active');
      this.$navLevel_2.removeClass('is-active');
      this.$navLevel_1_item.removeClass('is-active');

      $(index)
        .siblings('[data-nav-level-1-heading]')
        .parents('[data-nav-level-1-item]')
          .removeClass('is-active');
    }
  };

  /**
   * Opens level 3 on desktop
   */
  Nav.prototype._openDesktopLevel3 = function(index) {
    this.$navLevel_3.removeClass('is-active');
    $(index).siblings('[data-nav-level-3]').addClass('is-active');
  };

  /**
   * Handles bound events for mobile nav
   */
  Nav.prototype._attachBoundHelper = function($el, callback, context) {
    $el.click(function(e) {
      e.preventDefault();
      callback.call(context, this);
    });
  }

  return Nav;
});
