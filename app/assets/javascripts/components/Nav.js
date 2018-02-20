var Nav = function($el) {
  this.viewportWidth = 0;
  this.smallViewport = 720;
  this.delay = 250; // ms
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
};

/**
* Initialize the component
*/
Nav.prototype.init = function() {
  console.log('init!');

  this._bindEvents();
  this._setUpMobileAnimation();
  this._setUpMobileInteraction();
  this._setUpDesktopInteraction();
  // this._setUpKeyboardEvents();
};

/**
 * Set up component
 */
Nav.prototype._bindEvents = function() {
  console.log('_bindEvents!');

  this.$nav.removeClass('uninitialised');
  $(window).on('resize', this._debounce($.proxy(this._setUpMobileAnimation, this), 100));
};

/**
* Ensure mobile nav not activated on resize or page load
*/
Nav.prototype._setUpMobileAnimation = function() {
  console.log('_setUpMobileAnimation!');

  this.viewportWidth = $(window).width();

  // if (mediaQueries.atSmallViewport()) {
  if (this.viewportWidth < this.smallViewport) {
    this.$nav.removeClass('no-transition');
  } else {
    this.$nav.addClass('no-transition');
  }
};

/**
* Set up events for mobile nav
*/
Nav.prototype._setUpMobileInteraction = function() {
  console.log('_setUpMobileInteraction!');

  var self = this;

  this.$mobileNavButton.click(function(e) {
    e.preventDefault();
    self._toggleMobileNav();
  });

  this.$navLevel_1_Heading.click(function(e) {
    // if (mediaQueries.atSmallViewport()) {
    if (self.viewportWidth < self.smallViewport) {
      e.preventDefault();
      self._toggleMobileLevel2(this);
    }
  });

  this.$navLevel_2_Heading.click(function(e) {
    e.preventDefault();
    self._returnMobileNav(this);
  });

  this.$mobileNavClose.click(function(e){
    e.preventDefault();
    self._toggleMobileNav();
  });

  this.$mobileNavOverlay.click(function(e){
    e.preventDefault();
    self._toggleMobileNav();
  });

  this.$navLevel_2_Extended_Heading.click(function(e) {
    e.preventDefault();
    self._openMobileLevel3(this);
  });

  this.$navLevel_3_Heading.click(function(e) {
    e.preventDefault();
    self._closeMobileLevel3(this);
  })
};

Nav.prototype._toggleMobileNav = function() {
  console.log('_toggleMobileNav!');

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
};

Nav.prototype._toggleMobileLevel2 = function(index) {
  console.log('_toggleMobileLevel2!');

  var siblingsNav = $(index).siblings().get(0);

  $(index)
    .parents('[data-nav-level-1-item]').toggleClass('is-active')
    .parents('[data-nav-level-1]').toggleClass('is-active');

  $(siblingsNav).removeClass('is-hidden');
};

Nav.prototype._openMobileLevel3 = function(index) {
  console.log('_openMobileLevel3!');

  this.$navLevel_1.toggleClass('is-open');
  $(index).siblings('[data-nav-level-3]').toggleClass('is-active');
};

Nav.prototype._closeMobileLevel3 = function(index) {
  console.log('_closeMobileLevel3!');

  this.$navLevel_1.toggleClass('is-open');
  $(index).parents('[data-nav-level-3]').toggleClass('is-active');
};

Nav.prototype._returnMobileNav = function(index) {
  $(index)
    .parents('[data-nav-level-1-item]').toggleClass('is-active')
    .parents('[data-nav-level-1]').toggleClass('is-active');
    // set time as variable - same as transition delay in CSS?
    setTimeout(function(){
      $('[data-nav-level-2]').addClass('is-hidden');
    }, 400);
};

/**
* Set up events for desktop nav
*/
Nav.prototype._setUpDesktopInteraction = function() {
  if (this.viewportWidth >= this.smallViewport) {
    console.log('_setUpDesktopInteraction!');

    var self = this;

    // touch event outside of global nav triggers close subnav
    // if (!mediaQueries.atSmallViewport()) {
    if (!self.viewportWidth < self.smallViewport) {
      $(document).on('touchstart', function(e) {
        if ($(e.target).parents(self.$nav).length == 0) {
          self.$navLevel_1_item.removeClass('is-active');
        }
      })
    }

    this.$navLevel_1_Heading
      .mouseenter(function(e) {
        window.clearTimeout(self.timeout);

        self.timeout = window.setTimeout(function() {
          // self._sendHoverAnalytics($(e.target).text());
          self._openDesktopSubNav($(e.target));
        }, self.delay);
      })
      .mousedown(function(e) {
        e.preventDefault();
      }).on('touchstart', function(e) {
        // remove hover event handler if touch event detected
        $(e.target).parents('[data-nav-level-1-heading]').off('mouseenter')
      }).on('touchend', function(e) {
        // if (!mediaQueries.atSmallViewport()) {
        // if (!self.viewportWidth < self.smallViewport) {
          var index = $(e.target).parents('[data-nav-level-1-heading]');
          // touch event on clump heading triggers open/close subnav
          if ($(e.target).parents('[data-nav-level-1]').hasClass('is-active')) {
            self._closeDesktopSubNav(index);
          } else {
            self._openDesktopSubNav(index);
          }
        // }
      });

    this.$nav
      .mouseleave(function() {
        window.clearTimeout(self.timeout);

        self.closeNavTimeout = window.setTimeout(function() {
          self._closeDesktopSubNav();
        }, self.delay);
      })
      .mouseenter(function() {
        window.clearTimeout(self.closeNavTimeout);
      });
  };
};

/**
 * Opens subnav on desktop
 */
Nav.prototype._openDesktopSubNav = function(index) {
  console.log('_openDesktopSubNav!');

  if (!this.$nav.hasClass('is-active')) {
    this.$navLevel_2.removeClass('is-active');
    this.$navLevel_1_item.removeClass('is-active');
    // this.$navLevel_1_Heading.attr('aria-expanded', 'false');

    $(index)
      // .attr('aria-expanded', 'true')
      .parent('[data-nav-level-1-item]').addClass('is-active')
      .siblings('[data-nav-level-2]').addClass('is-active');
  }
};

/**
 * Closes subnav on desktop
 */
Nav.prototype._closeDesktopSubNav = function(index) {
  console.log('_closeDesktopSubNav!');

  if (!this.$nav.hasClass('is-active')) {
    this.$navLevel_2.removeClass('is-active');
    this.$navLevel_1_item.removeClass('is-active');

    $(index)
      .siblings('[data-nav-level-1-heading]')
      .parents('[data-nav-level-1-item]')
        .removeClass('is-active');
  }
};

/**
 * Rate limit the amount of times a method is called
 * @param  {function} func Function to be called
 * @param  {Number} wait How long to wait until func is called in milliseconds
 * @return {function}
 */
Nav.prototype._debounce = function(func, wait) {
  var timeout;

  return function() {
    var context = this,
        args = arguments,
        later = function() {
          timeout = null;
          func.apply(context, args);
        };
    clearTimeout(timeout);
    timeout = setTimeout(later, wait);
  };
}

// /**
//  * Set up keyboard events
//  * Adds enhanced keyboard interation to nav
//  */
// GlobalNav.prototype._setUpKeyboardEvents = function() {
//   var self = this;

//   this.$globalNav.keydown(function(e) {
//     if (e.which === 32 || e.which === 40) {
//       e.preventDefault();
//     }
//   });

//   this.$globalNav.keyup(function(e) {
//     var level;

//     if ($(e.target).parents('[data-dough-subnav]').length > 0) {
//       level = 'subnav';
//     } else {
//       level = 'top';
//     }

//     switch (e.which) {
//       // tab
//       case 9:
//         if (level === 'top') {
//           self._closeBlurredClumps(e.target);
//         }
//         break;
//       // enter
//       case 13:
//         if (level === 'top') {
//           e.preventDefault();
//           self._openDesktopSubNav(e.target);
//           self._moveFocusToSubNav(e.target);
//         }
//         break;
//       // escape
//       case 27:
//         if (level === 'subnav') {
//           self._closeDesktopSubNav($(e.target).parents('[data-dough-subnav]'));
//           self._moveTopLevelFocus(e.target);
//         }
//         break;
//       // spacebar
//       case 32:
//         e.preventDefault();

//         if (level === 'top') {
//           self._openDesktopSubNav(e.target);
//         }
//         break;
//       // left arrow
//       case 37:
//         self._moveTopLevelFocus(e.target, 'left');

//         if (level === 'subnav') {
//           self._closeDesktopSubNav($(e.target).parents('[data-dough-subnav]'));
//         }
//         break;
//       // up arrow
//       case 38:
//         if (level === 'subnav') {
//           self._moveSubNavFocus(e.target, 'up');
//         }
//         break;
//       // right arrow
//       case 39:
//         self._moveTopLevelFocus(e.target, 'right');

//         if (level === 'subnav') {
//           self._closeDesktopSubNav($(e.target).parents('[data-dough-subnav]'));
//         }
//         break;
//       // down arrow
//       case 40:
//         if (level === 'top') {
//           if ($(e.target).parents('[data-dough-nav-clump]').hasClass('is-active')) {
//             self._moveFocusToSubNav(e.target);
//           } else {
//             self._openDesktopSubNav(e.target);
//           }
//         } else {
//           self._moveSubNavFocus(e.target, 'down');
//         }
//         break;
//     }
//   });
// };

// /**
// * Moves focus to first link of subnav
// */
// GlobalNav.prototype._moveFocusToSubNav = function(el) {
//   var firstLink = $(el).siblings('[data-dough-subnav]').find('[data-dough-subcategories]').find('a')[0];

//   $(firstLink).focus();
// };

// /**
// * Moves focus of subnav up or down
// */
// GlobalNav.prototype._moveSubNavFocus = function(el, dir) {
//   var subCatArray = $(el).parents('[data-dough-subcategories]').find('a');
//   var index = $(subCatArray).index(el);

//   if (dir === 'up') {
//     if (index > 0) {
//       subCatArray[index - 1].focus();
//     } else {
//       subCatArray[subCatArray.length - 1].focus();
//     }
//   } else {
//     if (index < subCatArray.length - 1) {
//       subCatArray[index + 1].focus();
//     } else {
//       subCatArray[0].focus();
//     }
//   }
// };

// /**
// * Moves focus of top level nav to left or right
// */
// GlobalNav.prototype._moveTopLevelFocus = function(el, dir) {
//   var thisClump = $(el).parents('[data-dough-nav-clump]');
//   var clumps = $(thisClump).siblings('[data-dough-nav-clump]');
//   var firstClump = $(clumps).first();
//   var lastClump = $(clumps).last();

//   if (dir === 'left') {
//     if ($(thisClump).prev('[data-dough-nav-clump]').length > 0) {
//       $(thisClump).blur()
//         .prev().children('[data-dough-nav-clump-heading]').focus();
//     } else {
//       $(lastClump).children('[data-dough-nav-clump-heading]').focus();
//     }
//   } else if (dir === 'right') {
//     if ($(thisClump).next('[data-dough-nav-clump]').length > 0) {
//       $(thisClump).blur()
//         .next().children('[data-dough-nav-clump-heading]').focus();
//     } else {
//       $(firstClump).children('[data-dough-nav-clump-heading]').focus();
//     }
//   } else {
//     $(thisClump).children('[data-dough-nav-clump-heading]').focus();
//   }
// };

// /**
// * Closes all subnavs when top level focus shifts
// */
// GlobalNav.prototype._closeBlurredClumps = function(el) {
//   this.$globalNavClump.not($(el).parents('[data-dough-nav-clump]')).removeClass('is-active');
// };

// GlobalNav.prototype._sendHoverAnalytics = function(label) {
//   window.dataLayer.push({
//     'event': 'gaEvent',
//     'gaEventCat': 'Global Navigation',
//     'gaEventAct': 'Hover',
//     'gaEventLab': label
//   });
// };

// return GlobalNav;
