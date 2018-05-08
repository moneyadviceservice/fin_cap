define(['jquery', 'DoughBaseComponent', 'utilities', 'mediaQueries'], function($, DoughBaseComponent, utilities, mediaQueries) {
  'use strict';

  var Nav,
      defaultConfig = {};

  Nav = function($el, config) {
    Nav.baseConstructor.call(this, $el, config, defaultConfig);

    this.delay = 250;
    this.activeClass = 'is-active';
    this.openClass = 'is-open';
    this.transitionClass = 'no-transition';
    this.scrollClass = 'no-scroll';
    this.hiddenClass = 'is-hidden';
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
    this._setUpDesktopMouseInteraction();
    this._setUpDesktopTouchInteraction();
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

      if (this.$nav.hasClass(this.activeClass)) {
        this.$mobileNavOverlay.addClass(this.activeClass);
      }
    } else {
      this.$nav.addClass('no-transition');
      this.$mobileNavOverlay.removeClass(this.activeClass);
    }
  };

  /**
  * Set up events for nav on mobile
  */
  Nav.prototype._setUpMobileInteraction = function() {
    this._attachBoundHelper(this.$mobileNavButton, this._toggleMobileNav, this);
    this._attachBoundHelper(this.$mobileNavOverlay, this._toggleMobileNav, this);
    this._attachBoundHelper(this.$mobileNavClose, this._toggleMobileNav, this);
    this._attachBoundHelper(this.$navLevel_1_Heading, this._openMobileLevel2, this);
    this._attachBoundHelper(this.$navLevel_2_Heading, this._closeMobileLevel2, this);
    this._attachBoundHelper(this.$navLevel_2_Extended_Heading, this._toggleMobileLevel3, this);
    this._attachBoundHelper(this.$navLevel_3_Heading, this._toggleMobileLevel3, this);
  };

  /**
  * Set up mouse events for nav on desktop
  */
  Nav.prototype._setUpDesktopMouseInteraction = function() {
    var self = this;

    this.$nav.mouseleave(function(e) {
      if (!self.atSmallViewport) {
        self._closeDesktopLevel2(e.target);
      }
    }).mouseenter(function() {
      if (!self.atSmallViewport) {window.clearTimeout(self.timeout);}
    });

    this.$navLevel_1_Heading.mouseenter(function(e) {
      if (!self.atSmallViewport) {
        self._openDesktopLevel2(e.target);
      }
    }).mousedown(function(e) {
      if (!self.atSmallViewport) {e.preventDefault();}
    });

    this.$navLevel_2_Extended_Heading.mouseenter(function() {
      if (!self.atSmallViewport) {self._openDesktopLevel3(this);}
    });

    this.$searchBar.mouseenter(function() {
      self._closeDesktopLevel2();
    });
  };

  /**
  * Set up touch events for nav on desktop
  */
  Nav.prototype._setUpDesktopTouchInteraction = function() {
    var self = this;

    if (Modernizr.touchevents) {
      $(document).on('touchend', function(e) {
        if (!self.atSmallViewport) {
          var parentEl = $(e.target).parentsUntil(self.$nav);

          if (parentEl.parent().get(0) !== self.$nav.get(0)) {self._closeDesktopLevel2();}
        }
      });

      this.$navLevel_1_Heading.on('touchend', function(e) {
        if (!self.atSmallViewport) {
          e.preventDefault();

          if ($(e.target).parents('[data-nav-level-1-item]').hasClass(self.activeClass)) {
            self._closeDesktopLevel2(e.target);
          } else {
            self._openDesktopLevel2(e.target);
          }
        }
      });

      this.$navLevel_2_Extended_Heading.on('touchend', function(e) {
        if (!self.atSmallViewport) {
          e.preventDefault();

          self._openDesktopLevel3(this);
        }
      });
    }
  };

  /**
  * Opens/closes nav on  mobile
  */
  Nav.prototype._toggleMobileNav = function() {
    if (this.atSmallViewport) {
      this.$nav.toggleClass(this.activeClass);
      this.$mobileNavOverlay.toggleClass(this.activeClass);
      $('body').addClass(this.scrollClass);

      if (!this.$nav.hasClass(this.activeClass)) {
        this.$nav.removeClass(this.activeClass);
        this.$mobileNavOverlay.removeClass(this.activeClass);
        this.$navLevel_1.removeClass(this.activeClass);
        this.$navLevel_1_item.removeClass(this.activeClass);
        $('body').removeClass(this.scrollClass);
      }
    }
  };

  /**
  * Opens nav level 2 on mobile
  */
  Nav.prototype._openMobileLevel2 = function(index) {
    if (this.atSmallViewport) {
      var siblingsNav = $(index).siblings().get(0);
      this._toggleLevel2(index);
      $(siblingsNav).removeClass(this.hiddenClass);
    }
  };

  /**
  * Closes nav level 2 on mobile
  */
  Nav.prototype._closeMobileLevel2 = function(index) {
    if (this.atSmallViewport) {
      this._toggleLevel2(index);
    }
  };

  /**
  * Opens/closes nav level 2
  */
  Nav.prototype._toggleLevel2 = function(index) {
    $(index)
      .parents('[data-nav-level-1-item]').toggleClass(this.activeClass)
      .parents('[data-nav-level-1]').toggleClass(this.activeClass);
  }

  /**
  * Toggles nav level 3 on mobile
  */
  Nav.prototype._toggleMobileLevel3 = function(index) {
    if (this.atSmallViewport) {
      this.$navLevel_1.toggleClass(this.openClass);
      this.$navLevel_3.removeClass(this.activeClass);
      $(index).siblings('[data-nav-level-3]').toggleClass(this.activeClass)
    }
  };

  /**
   * Opens Level 2 on desktop
   */
  Nav.prototype._openDesktopLevel2 = function(index) {
    if (!this.atSmallViewport) {
      this.$navLevel_3.removeClass(this.activeClass);
      this.$navLevel_1_item.removeClass(this.activeClass);
      $(index).parent('[data-nav-level-1-item]')
        .addClass(this.activeClass)
        .find('[data-nav-level-2-subcategory-heading], [data-nav-level-2-subcategory-link], [data-nav-level-2-extended-heading]').attr('tabindex', 0);
      $(index).attr('aria-expanded', 'true');
      $(index).parent().siblings().find('[data-nav-level-1-heading]').attr('aria-expanded', 'false');
    }
  };

  /**
   * Closes Level 2 on desktop
   */
  Nav.prototype._closeDesktopLevel2 = function() {
    this.$navLevel_3.removeClass(this.activeClass);
    this.$navLevel_1_item
      .removeClass(this.activeClass)
      .find('[data-nav-level-2-subcategory-heading], [data-nav-level-2-subcategory-link], [data-nav-level-2-extended-heading]').attr('tabindex', -1);
    this.$navLevel_1_Heading.attr('aria-expanded', 'false');
    this.$navLevel_2_Extended_Heading.attr('aria-expanded', 'false');
  };

  /**
   * Opens level 3 on desktop and sets active class on triggering item
   */
  Nav.prototype._openDesktopLevel3 = function(index) {
    $(index)
      .addClass(this.activeClass)
      .attr('aria-expanded', true);
    $(index).parent().siblings().find('[data-nav-level-2-extended-heading]')
      .removeClass(this.activeClass)
      .attr('aria-expanded', false);
    this.$navLevel_3
      .removeClass(this.activeClass)
      .find('[data-nav-level-3-link]').attr('tabindex', -1);
    $(index).siblings('[data-nav-level-3]')
      .addClass(this.activeClass)
      .find('[data-nav-level-3-link]').attr('tabindex', 0);
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
