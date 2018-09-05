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
    this.$navLevel_2_Links = this.$nav.find('[data-nav-level-2-subcategory-heading], [data-nav-level-2-extended-heading], [data-nav-level-2-subcategory-link]');
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
    this._setUpDesktopKeyboardInteraction();
  };

  /**
  * Set up keyboard interaction for nav on desktop
  */
  Nav.prototype._setUpDesktopKeyboardInteraction = function() {
    var self = this;

    this.$nav.keyup(function(e) {
      var index = e.target;

      switch (e.which) {
        // right arrow moves user across links
        case 39:
          // if on Level 1 --
          if ($(index).data('nav-level-1-heading') == '') {
            // -- if on last element wrap to first
            if ($(index).parents('[data-nav-level-1-item]')[0] === self.$navLevel_1_item[self.$navLevel_1_item.length - 1]) {
              $(index)
                .blur()
                .parents('[data-nav-level-1-item]').siblings().first().children('[data-nav-level-1-heading]').focus();
            // -- else move to next
            } else {
              $(index)
                .blur()
                .parents('[data-nav-level-1-item]').next().children('[data-nav-level-1-heading]').focus();
            }
          // if on Level 2 --
          } else {
            //  -- move into level 3 if present
            if ($(index).siblings().data('nav-level-3') === '') {
              var $navLevel3Links = $(index).siblings('[data-nav-level-3]').find('[data-nav-level-3-link]');

              $navLevel3Links.attr('tabindex', 0);
              $navLevel3Links.get(0).focus();
            //  -- move back to level 1
            } else {
              if ($(index).parents('[data-nav-level-1-item]').next().data('nav-level-1-item') === '') {
                $(index).parents('[data-nav-level-1-item]').next().find('[data-nav-level-1-heading]').focus();
              } else {
                $(self.$navLevel_1_item[0]).find('[data-nav-level-1-heading]').get(0).focus();
              }

              self._closeDesktopLevel2();
            }
          }
          break;

        // left arrow moves user across links
        case 37:
          // if on Level 1
          if ($(index).data('nav-level-1-heading') == '') {
            // If on first element wrap to last
            if ($(index).parents('[data-nav-level-1-item]')[0] === self.$navLevel_1_item[0]) {
              $(index)
                .blur()
                .parents('[data-nav-level-1-item]').siblings('[data-nav-level-1-item]').last().children('[data-nav-level-1-heading]').focus();
            // else move to previous
            } else {
              $(index)
                .blur()
                .parents('[data-nav-level-1-item]').prev().children('[data-nav-level-1-heading]').focus();
            }
          // if on Level 2
          } else {
            if ($(index).parents('[data-nav-level-1-item]').prev().data('nav-level-1-item') === '') {
              $(index).parents('[data-nav-level-1-item]').prev().find('[data-nav-level-1-heading]').focus();
            } else {
              $(self.$navLevel_1_item[self.$navLevel_1_item.length - 1]).find('[data-nav-level-1-heading]').get(0).focus();
            }

            self._closeDesktopLevel2();
          }
          break;

        // enter key activates Level 1
        case 13:
          self._openDesktopLevel2(index)
          break;

        // spacebar key activates Level 1
        case 32:
          self._openDesktopLevel2(index)
          break;

        // down arrow key --
        case 40:
          // if on Level 1
          if ($(index).data('nav-level-1-heading') == '') {
            // -- moves focus into Level 2 if Level 1 is open
            if ($(index).parents('[data-nav-level-1-item]').hasClass(self.activeClass)) {
              var heading =
                $(index).siblings('[data-nav-level-2]').find('[data-nav-level-2-subcategory-heading]').get(0) ||
                $(index).siblings('[data-nav-level-2-extended]').find('[data-nav-level-2-extended-heading]').get(0);

                $(heading).focus();

                // -- activates Level 3 if present
                if ($(heading).siblings('[data-nav-level-3]').length > 0) {
                  self._openDesktopLevel3(heading);
                }
            // -- activates Level 1 if Level 1 is not open
            } else {
              self._openDesktopLevel2(index);
            }
          // if on Level 2
          } else if ($(index).data('nav-level-2-subcategory-heading') == '' || $(index).data('nav-level-2-subcategory-link') == '' || $(index).data('nav-level-2-extended-heading') == '') {
            var thisLink = self.$navLevel_2_Links.index(index);
            var thisLinkParent = $(self.$navLevel_2_Links[thisLink]).parents('[data-nav-level-2], [data-nav-level-2-extended]')[0];
            var nextLinkParent = $(self.$navLevel_2_Links[thisLink + 1]).parents('[data-nav-level-2], [data-nav-level-2-extended]')[0];

            // -- moves user through level 2
            if (thisLinkParent === nextLinkParent) {
              $(self.$navLevel_2_Links).get(thisLink + 1).focus();

              if($(thisLinkParent).data('nav-level-2-extended') == '') {
                self._openDesktopLevel3(self.$navLevel_2_Links[thisLink + 1]);
              }
            // -- moves user back to start of level 2
            } else {
              $(thisLinkParent).find('[data-nav-level-2-subcategory-heading], [data-nav-level-2-extended-heading], [data-nav-level-2-subcategory-link]').first().focus();

              if($(thisLinkParent).data('nav-level-2-extended') == '') {
                self._openDesktopLevel3(self.$navLevel_2_Extended_Heading[0]);
              }
            }
          } else {
            var links = $(index).parents('[data-nav-level-3]').find('[data-nav-level-3-link]');
            var thisLinkIndex = $(links).index(index);

            if (thisLinkIndex == links.length - 1) {
              $(links).get(0).focus();
            } else {
              $(links).get(thisLinkIndex + 1).focus();
            }
          }
          break;

        // up arrow key --
        case 38:
          // if on Level 2
          if ($(index).data('nav-level-2-subcategory-heading') == '' || $(index).data('nav-level-2-subcategory-link') == '' || $(index).data('nav-level-2-extended-heading') == '') {
            var thisLink = self.$navLevel_2_Links.index(index);
            var thisLinkParent = $(self.$navLevel_2_Links[thisLink]).parents('[data-nav-level-2], [data-nav-level-2-extended]')[0];
            var prevLinkParent = $(self.$navLevel_2_Links[thisLink - 1]).parents('[data-nav-level-2], [data-nav-level-2-extended]')[0];

            // -- moves user through level 2
            if (thisLinkParent === prevLinkParent) {
              $(self.$navLevel_2_Links).get(thisLink - 1).focus();

              if($(thisLinkParent).data('nav-level-2-extended') == '') {
                self._openDesktopLevel3(self.$navLevel_2_Links[thisLink - 1]);
              }
            // -- moves user back to end of level 2
            } else {
              $(thisLinkParent).find('[data-nav-level-2-subcategory-heading], [data-nav-level-2-extended-heading], [data-nav-level-2-subcategory-link]').last().focus();

              if($(thisLinkParent).data('nav-level-2-extended') == '') {
                self._openDesktopLevel3($(thisLinkParent).find('[data-nav-level-2-extended-heading]').last());
              }
            }
          // if on Level 3
          } else {
            var links = $(index).parents('[data-nav-level-3]').find('[data-nav-level-3-link]');
            var thisLinkIndex = $(links).index(index);

            if (thisLinkIndex == 0) {
              $(links).get(links.length - 1).focus();
            } else {
              $(links).get(thisLinkIndex - 1).focus();
            }
          }
          break;

        // tab key --
        case 9:
          // -- activates level 3 when moving through extended level 2
          if ($(index).data('nav-level-2-extended-heading') === '') {
            self._openDesktopLevel3(index);
          // -- closes level 2 when returning user to level 1
          } else if($(document.activeElement).data('nav-level-1-heading') === '') {
            self._closeDesktopLevel2();
          }

          break;

        // escape key closes active level 2 items
        case 27:
          self.$navLevel_1_item.each(function() {
            if ($(this).hasClass(self.activeClass)) {
              self._closeDesktopLevel2();
              $(this).find('[data-nav-level-1-heading]').focus();
            }
          });
          break;
      }
    });
  }

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
   * Opens Level 2 on desktop
   */
  Nav.prototype._openDesktopLevel2 = function(index) {
    if (!this.atSmallViewport) {
      this.$navLevel_3.removeClass(this.activeClass);
      this.$navLevel_1_item.removeClass(this.activeClass);
      $(index).parent('[data-nav-level-1-item]').addClass(this.activeClass);
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
    this.$navLevel_1_item.removeClass(this.activeClass);
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
    this.$navLevel_3.removeClass(this.activeClass);
    $(index).siblings('[data-nav-level-3]').addClass(this.activeClass);
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
