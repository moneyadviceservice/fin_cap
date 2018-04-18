describe('Nav', function() {
  'use strict';

  beforeEach(function(done) {
    var self = this;

    fixture.setBase('spec/javascripts/fixtures');

    requirejs(
      ['jquery', 'Nav'],
      function($, Nav) {
        fixture.load('Nav.html');

        self.$nav = $(fixture.el).find('[data-dough-component="Nav"]');
        self.$mobileNavOverlay = $(fixture.el).find('[data-mobile-nav-overlay]');
        self.mobileNavButton = $(fixture.el).find('[data-mobile-nav-button]');
        self.mobileNavClose = $(fixture.el).find('[data-mobile-nav-close]');
        self.navSearchBar = $(fixture.el).find('[data-nav-search-bar]');
        self.$navLevel1 = $(fixture.el).find('[data-nav-level-1]');
        self.$navLevel1Items = self.$navLevel1.find('[data-nav-level-1-item]');
        self.$navLevel2 = $(fixture.el).find('[data-nav-level-2]');
        self.$navLevel3 = $(fixture.el).find('[data-nav-level-3]');
        self.$navLevel2ExtendedItems = $(fixture.el).find('[data-nav-level-2-extended-items]');
        self.obj = new Nav(self.$nav);
        self.activeClass = self.obj.activeClass;
        self.openClass = self.obj.openClass;
        self.transitionClass = self.obj.transitionClass;
        self.scrollClass = self.obj.scrollClass;
        self.delay = self.obj.delay;

        done();
      }, done);
  });

  afterEach(function() {
    fixture.cleanup();
  });

  describe('Initialise component', function() {
    it('Calls the right methods when initialising', function() {
      var setUpComponentStub = sinon.stub(this.obj, "_setUpComponent"),
          getViewportSizeStub = sinon.stub(this.obj, "_getViewportSize"),
          setUpMobileAnimationStub = sinon.stub(this.obj, "_setUpMobileAnimation"),
          setUpMobileInteractionStub = sinon.stub(this.obj, "_setUpMobileInteraction"),
          setUpDesktopMouseInteractionStub = sinon.stub(this.obj, "_setUpDesktopMouseInteraction"),
          setUpDesktopTouchInteractionStub = sinon.stub(this.obj, "_setUpDesktopTouchInteraction");

      this.obj.init();

      expect(setUpComponentStub.callCount).to.be.equal(1);
      expect(getViewportSizeStub.callCount).to.be.equal(1);
      expect(setUpMobileAnimationStub.callCount).to.be.equal(1);
      expect(setUpMobileInteractionStub.callCount).to.be.equal(1);
      expect(setUpDesktopMouseInteractionStub.callCount).to.be.equal(1);
      expect(setUpDesktopTouchInteractionStub.callCount).to.be.equal(1);
    });
  });

  describe('Set up component', function() {
    it('Removes the uninitialised class from the component', function() {
      this.obj.init();
      expect(this.$nav.hasClass('uninitialised')).to.be.false;
    });

    it('Calls the right methods when resizing', function() {
      var setUpMobileAnimationStub = sinon.stub(this.obj, "_setUpMobileAnimation"),
          getViewportSizeStub = sinon.stub(this.obj, "_getViewportSize");

      this.obj.init();
      $(window).trigger('resize');
      expect(setUpMobileAnimationStub.callCount).to.be.equal(1);
      expect(getViewportSizeStub.callCount).to.be.equal(1);
    });
  });

  describe('Set up mobile interaction', function() {
    var countCalls = function(element, trigger) {
      var count = 0;

      element.each(function() {
        var $trigger = $(this).find('[' + trigger + ']') || null;

        $trigger.each(function() {
          $(this).trigger('click');
          count++;
        });
      });

      return count;
    }

    beforeEach(function(){
      this.toggleMobileNavStub = sinon.stub(this.obj, "_toggleMobileNav");
      this.openMobileLevel2Stub = sinon.stub(this.obj, "_openMobileLevel2");
      this.closeMobileLevel2Stub = sinon.stub(this.obj, "_closeMobileLevel2");
      this.toggleMobileLevel3Stub = sinon.stub(this.obj, "_toggleMobileLevel3");
      this.obj.init();
    });

    it('Calls the _toggleMobileNav method when the mobile nav button is clicked', function() {
      this.mobileNavButton.trigger('click');
      expect(this.toggleMobileNavStub.callCount).to.be.equal(1);
    });

    it('Calls the _toggleMobileNav method when the mobile nav overlay is clicked', function() {
      this.$mobileNavOverlay.trigger('click');
      expect(this.toggleMobileNavStub.callCount).to.be.equal(1);
    });

    it('Calls the _toggleMobileNav method when the mobile nav close button is clicked', function() {
      this.mobileNavClose.trigger('click');
      expect(this.toggleMobileNavStub.callCount).to.be.equal(1);
    });

    it('Calls the _openMobileLevel2 method when each Level 1 heading is clicked', function() {
      var count = countCalls(this.$navLevel1Items, 'data-nav-level-1-heading');
      expect(this.openMobileLevel2Stub.callCount).to.be.equal(count);
    });

    it('Calls the _closeMobileLevel2 method when each Level 2 Heading is clicked', function() {
      var count = countCalls(this.$navLevel2, 'data-nav-level-2-heading');
      expect(this.closeMobileLevel2Stub.callCount).to.be.equal(count);
    });

    it('Calls the _toggleMobileLevel3 method when each Level 2 Extended Heading is clicked', function() {
      var count = countCalls(this.$navLevel2ExtendedItems, 'data-nav-level-2-extended-heading');
      expect(this.toggleMobileLevel3Stub.callCount).to.be.equal(count);
    });

    it('Calls the _toggleMobileLevel3 method when each Level 3 Heading is clicked', function() {
      var count = countCalls(this.$navLevel3, 'data-nav-level-3-heading');
      expect(this.toggleMobileLevel3Stub.callCount).to.be.equal(count);
    });
  });

  describe('Set up desktop mouse interaction', function() {
    var clock;

    beforeEach(function(){
      clock = sinon.useFakeTimers();

      this.closeDesktopLevel2Stub = sinon.stub(this.obj, "_closeDesktopLevel2");
      this.openDesktopLevel2Stub = sinon.stub(this.obj, "_openDesktopLevel2");
      this.openDesktopLevel3Stub = sinon.stub(this.obj, '_openDesktopLevel3');
      this.obj.init();
    });

    afterEach(function() {
      clock.restore();
    });

    it('Calls the _closeDesktopLevel2 method when the user mouses away from the nav on desktop view', function() {
      var self = this;
      var triggerMouseLeave = function() {
        self.$nav.trigger('mouseleave');
        clock.tick(self.delay);
        if (self.obj.atSmallViewport === true) {
          expect(self.closeDesktopLevel2Stub.callCount).to.be.equal(0);
        } else {
          expect(self.closeDesktopLevel2Stub.callCount).to.be.equal(1);
        }
      }

      this.obj.atSmallViewport = true;
      triggerMouseLeave();
      this.obj.atSmallViewport = false;
      triggerMouseLeave();
    });

    it('Calls the _openDesktopLevel2 method when the user mouses into each Level 1 heading on desktop view', function() {
      var count = 0;
      var self = this;
      var triggerMouseEnter = function() {
        self.$navLevel1Items.each(function() {
          var $navLevel1Headings = $(this).find('[data-nav-level-1-heading]') || null;

          if ($navLevel1Headings) {
            $navLevel1Headings.each(function() {
              $(this).trigger('mouseenter');
              if (!self.obj.atSmallViewport) {
                clock.tick(self.delay);
                count++;
              }
            });
          }
        });
        expect(self.openDesktopLevel2Stub.callCount).to.be.equal(count);
      }

      this.obj.atSmallViewport = true;
      triggerMouseEnter();
      this.obj.atSmallViewport = false;
      triggerMouseEnter();
    });

    it('Calls the _closeDesktopLevel2 method when the user mouses into the search bar', function() {
      this.navSearchBar.trigger('mouseenter');
      clock.tick(this.delay);
      expect(this.closeDesktopLevel2Stub.callCount).to.be.equal(1);
    });

    it('Calls the _openDesktopLevel3 method when the user mouses into each Level 2 Extended Heading on desktop view', function() {
      var count = 0;
      var self = this;
      var triggerMouseEnter = function() {
        self.$navLevel2ExtendedItems.each(function() {
          $(this).find('[data-nav-level-2-extended-heading]').each(function() {
            $(this).trigger('mouseenter');
            if (self.obj.atSmallViewport === false) {
              count++;
            }
          });
        });
        expect(self.openDesktopLevel3Stub.callCount).to.be.equal(count);
      }

      this.obj.atSmallViewport = true;
      triggerMouseEnter();
      this.obj.atSmallViewport = false;
      triggerMouseEnter();
    });
  });

  describe('Set up desktop touch interaction', function() {
    beforeEach(function() {
      this.openDesktopLevel2Stub = sinon.stub(this.obj, '_openDesktopLevel2');
      this.closeDesktopLevel2Stub = sinon.stub(this.obj, '_closeDesktopLevel2');
      this.openDesktopLevel3Stub = sinon.stub(this.obj, '_openDesktopLevel3');
      this.obj.init();
    });

    it('Calls the _closeDesktopLevel2 method when the user touches an area outside the nav on desktop view', function() {
      var self = this;
      var triggerTouchEnd = function() {
        self.$navLevel1Items.trigger('touchend');
        expect(self.closeDesktopLevel2Stub.callCount).to.be.equal(0);
        $('footer').trigger('touchend');
        if (self.obj.atSmallViewport === true) {
          expect(self.closeDesktopLevel2Stub.callCount).to.be.equal(0);
        } else {
          expect(self.closeDesktopLevel2Stub.callCount).to.be.equal(1);
        }
      }

      this.obj.atSmallViewport = true;
      triggerTouchEnd();
      this.obj.atSmallViewport = false;
      triggerTouchEnd();
    });

    it('Calls the _openDesktopLevel2 method when the user touches the header of an inactive Level 1 nav element on desktop view', function() {
      var self = this;
      var count = 0;
      var triggerTouchEnd = function() {
        self.$navLevel1Items.removeClass(self.activeClass);
        self.$navLevel1Items.each(function() {
          var $navLevel1Heading = $(this).find('[data-nav-level-1-heading]') || null;
          if ($navLevel1Heading.length > 0) {
            $navLevel1Heading.trigger('touchend');
            if (self.obj.atSmallViewport === false) {
              count++;
            }
          }
        });
        expect(self.openDesktopLevel2Stub.callCount).to.be.equal(count);
      }

      this.obj.atSmallViewport = true;
      triggerTouchEnd();
      this.obj.atSmallViewport = false;
      triggerTouchEnd();
    });

    it('Calls the _closeDesktopLevel2 method when the user touches the header of an active Level 1 nav element on desktop view', function() {
      var self = this;
      var count = 0;
      var triggerTouchEnd = function() {
        self.$navLevel1Items.removeClass(self.activeClass);
        self.$navLevel1Items.each(function() {
          var $navLevel1Heading = $(this).find('[data-nav-level-1-heading]') || null;
          if ($navLevel1Heading.length > 0) {
            $(this).addClass(self.activeClass);
            $navLevel1Heading.trigger('touchend');
            if (self.obj.atSmallViewport === false) {
              count++;
            }
          }
        });
        expect(self.closeDesktopLevel2Stub.callCount).to.be.equal(count);
      }

      this.obj.atSmallViewport = true;
      triggerTouchEnd();
      this.obj.atSmallViewport = false;
      triggerTouchEnd();
    });

    it('Calls the _openDesktopLevel3 method when the user touches any Level 2 Extended Heading on desktop view', function() {
      var self = this;
      var count = 0;
      var triggerTouchEnd = function() {
        self.$navLevel2ExtendedItems.each(function() {
          $(this).find('[data-nav-level-2-extended-heading]').each(function() {
            $(this).trigger('touchend');
            if (self.obj.atSmallViewport === false) {
              count++;
            }
          });
        });
        expect(self.openDesktopLevel3Stub.callCount).to.be.equal(count);
      }

      this.obj.atSmallViewport = true;
      triggerTouchEnd();
      this.obj.atSmallViewport = false;
      triggerTouchEnd();
    });
  });

  describe('Calls the _setUpMobileAnimation method', function() {
    beforeEach(function() {
      this.$nav.addClass(this.activeClass);
    });

    it('Removes the transition class from the component when called on mobile viewport', function() {
      this.obj.atSmallViewport = true;
      this.obj._setUpMobileAnimation();
      expect(this.$nav.hasClass(this.transitionClass)).to.be.false;
    });

    it('Adds the transition class to the component when called on desktop viewport', function() {
      this.obj.atSmallViewport = false;
      this.obj._setUpMobileAnimation();
      expect(this.$nav.hasClass(this.transitionClass)).to.be.true;
    });

    it('Adds the active class to the mobile nav overlay when called on mobile viewport', function() {
      this.obj.atSmallViewport = true;
      this.obj._setUpMobileAnimation();
      expect(this.$mobileNavOverlay.hasClass(this.activeClass)).to.be.true;
    });

    it('Removes the active class from the mobile nav overlay when called on desktop viewport', function() {
      this.obj.atSmallViewport = false;
      this.obj._setUpMobileAnimation();
      expect(this.$mobileNavOverlay.hasClass(this.activeClass)).to.be.false;
    });
  });

  describe('Calls _toggleMobileNav method', function() {
    it('Opens/closes nav at mobile view', function() {
      var self = this;
      var callToggleMobileNav = function() {
        self.obj._toggleMobileNav();
        if (self.obj.atSmallViewport == false) {
          expect(self.$nav.hasClass(self.activeClass)).to.be.false;
          expect(self.$mobileNavOverlay.hasClass(self.activeClass)).to.be.false;
          expect($('body').hasClass(self.scrollClass)).to.be.false;
        } else {
          expect(self.$nav.hasClass(self.activeClass)).to.be.true;
          expect(self.$mobileNavOverlay.hasClass(self.activeClass)).to.be.true;
          expect($('body').hasClass(self.scrollClass)).to.be.true;
        }

        self.obj._toggleMobileNav();
        expect(self.$nav.hasClass(self.activeClass)).to.be.false;
        expect(self.$mobileNavOverlay.hasClass(self.activeClass)).to.be.false;
        expect($('body').hasClass(self.scrollClass)).to.be.false;
      }

      this.obj.atSmallViewport = false;
      callToggleMobileNav();
      this.obj.atSmallViewport = true;
      callToggleMobileNav();
    });
  });

  describe('Calls _openMobileLevel2 method', function() {
    it('Opens/closes level 2 at mobile view', function() {
      var self = this;
      var callOpenMobileLevel2 = function() {
        self.$navLevel1Items.each(function() {
          var $index = $(this).find('[data-nav-level-1-heading]') || null;

          if ($index.length > 0) {
            $index.parents('[data-nav-level-1-item]').removeClass(self.activeClass);
            self.$navLevel1.removeClass(self.activeClass);

            self.obj._openMobileLevel2($index);
            if (self.obj.atSmallViewport) {
              expect($index.parents('[data-nav-level-1-item]').hasClass(self.activeClass)).to.be.true;
              expect(self.$navLevel1.hasClass(self.activeClass)).to.be.true;
            } else {
              expect($index.parents('[data-nav-level-1-item]').hasClass(self.activeClass)).to.be.false;
              expect(self.$navLevel1.hasClass(self.activeClass)).to.be.false;
            }

            self.obj._openMobileLevel2($index);
            expect($index.parents('[data-nav-level-1-item]').hasClass(self.activeClass)).to.be.false;
            expect(self.$navLevel1.hasClass(self.activeClass)).to.be.false;
          }
        });
      }

      this.obj.atSmallViewport = true;
      callOpenMobileLevel2();
      this.obj.atSmallViewport = false;
      callOpenMobileLevel2();
    });
  });

  describe('Calls _closeMobileLevel2', function() {
    it('Closes the currently active level 2 menu and displays the level 1 menu at mobile view', function() {
      var self = this;
      var callCloseMobileLevel2 = function() {
        self.$navLevel2.each(function() {
          $(this).parents('[data-nav-level-1-item]').addClass(self.activeClass);
          self.$navLevel1.addClass(self.activeClass);

          self.obj._closeMobileLevel2(this);

          if (self.obj.atSmallViewport) {
            expect($(this).parents('[data-nav-level-1-item]').hasClass(self.activeClass)).to.be.false;
            expect(self.$navLevel1.hasClass(self.activeClass)).to.be.false;
          } else {
            expect($(this).parents('[data-nav-level-1-item]').hasClass(self.activeClass)).to.be.true;
            expect(self.$navLevel1.hasClass(self.activeClass)).to.be.true;
          }
        });
      }

      this.obj.atSmallViewport = true;
      callCloseMobileLevel2();
      this.obj.atSmallViewport = false;
      callCloseMobileLevel2();
    });
  });

  describe('Calls _toggleMobileLevel3 to open level', function() {
    it('Displays the level 3 menu associated with the level 2 target element at mobile view', function() {
      var self = this;
      var callOpenMobileLevel3 = function() {
        self.$navLevel2ExtendedItems.each(function() {
          $(this).find('[data-nav-level-2-extended-heading]').each(function() {
            self.$navLevel1.removeClass(self.openClass);
            self.$navLevel3.removeClass(self.activeClass);

            self.obj._toggleMobileLevel3(this);

            if (self.obj.atSmallViewport) {
              expect($(this).siblings('[data-nav-level-3]').hasClass(self.activeClass)).to.be.true;
              expect($(this).parents('[data-nav-level-1]').hasClass(self.openClass)).to.be.true;
            } else {
              expect($(this).siblings('[data-nav-level-3]').hasClass(self.activeClass)).to.be.false;
              expect($(this).parents('[data-nav-level-1]').hasClass(self.openClass)).to.be.false;
            }
          });
        });
      }

      this.obj.atSmallViewport = true;
      callOpenMobileLevel3();
      this.obj.atSmallViewport = false;
      callOpenMobileLevel3();
    });
  });

  describe('Calls _toggleMobileLevel3 to close level', function() {
    it('Closes the live level 3 menu and displays the parent level 2 menu at mobile view', function() {
      var self = this;
      var callCloseMobileLevel3 = function() {
        self.$navLevel3.each(function() {
          var index = $(this).find('[data-nav-level-3-heading]');

          self.$navLevel1.addClass(self.openClass);
          $(this).addClass(self.activeClass);

          self.obj._toggleMobileLevel3($(index).parents('[data-nav-level-3]'));

          if (self.obj.atSmallViewport == true) {
            expect(self.$navLevel1.hasClass(self.openClass)).to.be.false;
            expect($(this).hasClass(self.activeClass)).to.be.false;
          } else {
            expect(self.$navLevel1.hasClass(self.openClass)).to.be.true;
            expect($(this).hasClass(self.activeClass)).to.be.true;
          }
        });
      }

      this.obj.atSmallViewport = true;
      callCloseMobileLevel3();
      this.obj.atSmallViewport = false;
      callCloseMobileLevel3();
    });
  });

  describe('Calls _openDesktopLevel2', function() {
    it('Closes any active level 3 item and displays the level 2 item associated with the trigger', function() {
      var self = this;
      this.$navLevel1Items.each(function() {
        var $level3 = $(this).find('[data-nav-level-3]') || null;
        if ($level3.length > 0) {
          $level3.addClass(self.activeClass);
        }

        var $trigger = $(this).find('[data-nav-level-1-heading]') || null;
        if ($trigger.length > 0) {
          self.obj._openDesktopLevel2($trigger);
          expect(self.$navLevel3.hasClass(this.activeClass)).to.be.false;
          expect($trigger.parents('[data-nav-level-1-item]').hasClass(self.activeClass)).to.be.true;
          expect($trigger.parents('[data-nav-level-1-item]').siblings().hasClass(self.activeClass)).to.be.false;
        }
      });
    });
  });

  describe('Calls _closeDesktopLevel2', function() {
    it('Closes any active level 1 or level 3 items', function() {
      var self = this;
      this.$navLevel1Items.each(function() {
        if ($(this).find('[data-nav-level-1-heading]').length > 0) {
          $(this).addClass(self.activeClass);

          var $level3 = $(this).find('[data-nav-level-3]') || null;
          if ($level3.length > 0) {
            $level3.addClass(self.activeClass);
          }

          self.obj._closeDesktopLevel2();
          expect($(this).hasClass(this.activeClass)).to.be.false;
          expect ($(this).find('[data-nav-level-3]').hasClass(this.activeClass)).to.be.false;
        }
      });
    });
  });

  describe('Calls _openDesktopLevel3', function() {
    it('Opens the level 3 item associated with the trigger and sets active class on triggering element', function() {
      var self = this;
      this.$navLevel3.removeClass(this.activeClass);
      this.$navLevel2ExtendedItems.each(function() {
        $(this).find('[data-nav-level-2-extended-heading]').each(function() {
          self.obj._openDesktopLevel3(this);
          expect($(this).hasClass(self.activeClass)).to.be.true;
          expect($(this).parents().siblings().find('[data-nav-level-2-extended-heading]').hasClass(self.activeClass)).to.be.false;
          expect($(this).siblings('[data-nav-level-3]').hasClass(self.activeClass)).to.be.true;
        });
      });
    });
  });
});
