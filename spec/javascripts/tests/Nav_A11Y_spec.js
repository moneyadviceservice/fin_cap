describe('Nav_A11Y', function() {
  'use strict';

  beforeEach(function(done) {
    var self = this;

    fixture.setBase('spec/javascripts/fixtures');

    requirejs(
      ['jquery', 'Nav'],
      function($, Nav) {
        fixture.load('Nav.html');

        self.$nav = $(fixture.el).find('[data-dough-component="Nav"]');
        self.$navLevel1Items = $(fixture.el).find('[data-nav-level-1-item]');
        self.$navLevel1Headings = $(fixture.el).find('[data-nav-level-1-heading]');
        self.$navLevel2ExtendedHeadings = $(fixture.el).find('[data-nav-level-2-extended-heading]');
        self.obj = new Nav(self.$nav);
        self.activeClass = self.obj.activeClass;

        done();
      }, done);
  });

  afterEach(function() {
    fixture.cleanup();
  });

  describe('Dynamic ARIA states', function() {
    beforeEach(function(){
      this.obj.init();
    });

    it('Changes aria-expanded state of level 1 links on hover', function() {
      var self = this;
      var hoverLevel1 = function() {
        self.$navLevel1Headings.each(function() {
          $(this).trigger('mouseenter');

          if (self.obj.atSmallViewport) {
            expect($(this).attr('aria-expanded')).to.equal('false');
          } else {
            expect($(this).attr('aria-expanded')).to.equal('true');
          }

          expect($(this).parent().siblings().find('[data-nav-level-1-heading]').attr('aria-expanded')).to.equal('false');
        });
      };

      this.obj.atSmallViewport = true;
      hoverLevel1();
      this.obj.atSmallViewport = false;
      hoverLevel1();
    });

    it('Changes aria-expanded state of level 1 links on leaving nav', function() {
      var self = this;
      var navLeave = function() {
        self.$navLevel1Headings.each(function() {
          $(this).attr('aria-expanded', 'true');
          self.$nav.trigger('mouseleave');

          if (self.obj.atSmallViewport) {
            expect(self.$navLevel1Headings.attr('aria-expanded')).to.equal('true');
          } else {
            expect(self.$navLevel1Headings.attr('aria-expanded')).to.equal('false');
          }
        });
      }

      this.obj.atSmallViewport = true;
      navLeave();
      this.obj.atSmallViewport = false;
      navLeave();
    });

    it('Changes aria-expanded state of level 2 extended links on hover', function() {
      var self = this;
      var hoverLevel2Extended = function() {
        self.$navLevel2ExtendedHeadings.each(function() {
          $(this).trigger('mouseenter');

          if (self.obj.atSmallViewport) {
            expect($(this).attr('aria-expanded')).to.equal('false');
          } else {
            expect($(this).attr('aria-expanded')).to.equal('true');
          }

          expect($(this).parent().siblings().find('[data-nav-level-2-extended-heading]').attr('aria-expanded')).to.equal('false');
        });
      };

      this.obj.atSmallViewport = true;
      hoverLevel2Extended();
      this.obj.atSmallViewport = false;
      hoverLevel2Extended();
    });

    it('Changes aria-expanded state of level 2 extended links on leaving nav', function() {
      var self = this;
      var navLeave = function() {
        self.$navLevel2ExtendedHeadings.each(function() {
          $(this).attr('aria-expanded', 'true');
          self.$nav.trigger('mouseleave');

          if (self.obj.atSmallViewport) {
            expect(self.$navLevel2ExtendedHeadings.attr('aria-expanded')).to.equal('true');
          } else {
            expect(self.$navLevel2ExtendedHeadings.attr('aria-expanded')).to.equal('false');
          }
        });
      }

      this.obj.atSmallViewport = true;
      navLeave();
      this.obj.atSmallViewport = false;
      navLeave();
    });
  });

  describe('Keyboard interaction', function() {
    var triggerKeyUp = function(element, keyCode) {
      var e = $.Event('keyup');
      e.which = keyCode;
      $(element).trigger(e);
    };

    var moveFocus = function(index, target, keyCode) {
      index.focus();
      triggerKeyUp(index, keyCode);
      expect(index === document.activeElement).to.be.false;
      expect(target === document.activeElement).to.be.true;
    }

    beforeEach(function(){
      this.obj.init();
    });

    it('Moves user through Level 1 items by use of the right arrow key', function() {
      // arrow from first to second
      moveFocus(this.$navLevel1Headings.first().get(0), this.$navLevel1Headings.get(1), 39);
      // arrow from last to first
      moveFocus(this.$navLevel1Headings.last().get(0), this.$navLevel1Headings.first().get(0), 39);
    });

    it('Moves user through Level 1 items by use of the left arrow key', function() {
      // arrow from second to first
      moveFocus(this.$navLevel1Headings.get(1), this.$navLevel1Headings.get(0), 37);
      // arrow from first to last
      moveFocus(this.$navLevel1Headings.first().get(0), this.$navLevel1Headings.last().get(0), 37);
    });

    it('Activates Level 1 items by use of enter, spacebar and down arrow keys', function() {
      var self = this;
      var activateLevel1 = function(index, keyCode) {
        $(index).attr('aria-expanded', 'false');
        $(index).parents('[data-nav-level-1-item]').removeClass(self.activeClass);

        triggerKeyUp(index, keyCode);

        expect($(index).parents('[data-nav-level-1-item]').hasClass(self.activeClass)).to.be.true;
        expect($(index).attr('aria-expanded')).to.equal('true');
        expect($(index).parents('[data-nav-level-1-item]').siblings('[data-nav-level-1-item]').hasClass(self.activeClass)).to.be.false;
        expect($(index).parents('[data-nav-level-1-item]').siblings('[data-nav-level-1-item]').children('[data-nav-level-1-heading]').attr('aria-expanded')).to.equal('false');
      };

      this.$navLevel1Headings.each(function() {
        // Enter key
        activateLevel1(this, 13);
        // Spacebar key
        activateLevel1(this, 32);
        // Down arrow key
        activateLevel1(this, 40);
      });
    });

    it('Closes active Level 1 items by use of escape key', function() {
      var self = this;

      this.$navLevel1Items.each(function() {
        $(this).addClass(self.activeClass);
        $(this).find('[data-nav-level-1-heading]').attr('aria-expanded', 'true');
        triggerKeyUp(this, 27);
        expect($(this).hasClass(self.activeClass)).to.be.false;
        expect($(this).find('[data-nav-level-1-heading]').attr('aria-expanded')).to.equal('false');
        expect($(this).find('[data-nav-level-1-heading]').get(0) === document.activeElement).to.be.true;
      });
    });

    it('Moves user into Level 2 by use of the down arrow key', function() {
      var self = this;

      this.$navLevel1Headings.each(function() {
        var heading =
          $(this).siblings('[data-nav-level-2]').find('[data-nav-level-2-subcategory-heading]').get(0) ||
          $(this).siblings('[data-nav-level-2-extended]').find('[data-nav-level-2-extended-heading]').get(0);

        $(this)
          .focus()
          .parents('[data-nav-level-1-item]').addClass(self.activeClass);
        triggerKeyUp(this, 40);
        expect(heading === document.activeElement).to.be.true;
      });
    });

    it('Moves user through Level 2 items by use of the down arrow key', function() {
      var categories = this.$nav.find('[data-nav-level-2-categories], [data-nav-level-2-extended-items]');

      $(categories).each(function() {
        var $links = $(this).find('[data-nav-level-2-subcategory-heading], [data-nav-level-2-extended-heading], [data-nav-level-2-subcategory-link]');
        var $firstLink = $links.get(0);
        var $secondLink = $links.get(1);
        var $lastLink = $links.get($links.length - 1);

        // move from first to second
        moveFocus($firstLink, $secondLink, 40);
        // move from last to first
        moveFocus($lastLink, $firstLink, 40);
      });
    });

    it('Moves user through Level 2 items by use of the up arrow key', function() {
      var categories = this.$nav.find('[data-nav-level-2-categories], [data-nav-level-2-extended-items]');

      $(categories).each(function() {
        var $links = $(this).find('[data-nav-level-2-subcategory-heading], [data-nav-level-2-extended-heading], [data-nav-level-2-subcategory-link]');
        var $firstLink = $links.get(0);
        var $secondLink = $links.get(1);
        var $lastLink = $links.get($links.length - 1);

        // move from second to first
        moveFocus($secondLink, $firstLink, 38);
        // move from first to last
        moveFocus($firstLink, $lastLink, 38);
      });
    });

    it('Moves user out of Level 2 and Level 3 by use of the right arrow key', function() {
      var self = this;

      this.$navLevel1Items.each(function(navLevel1Item) {
        var $links = $(this).find('[data-nav-level-2-subcategory-heading], [data-nav-level-2-subcategory-link], [data-nav-level-3-link]');

        $links.each(function() {
          var $level1Item = $(this).parents('[data-nav-level-1-item]');

          $(this).focus();
          $level1Item.addClass(self.activeClass);
          triggerKeyUp(this, 39);

          if (navLevel1Item == self.$navLevel1Items.length - 1) {
            expect($(self.$navLevel1Items[0]).find('[data-nav-level-1-heading]').get(0) === document.activeElement).to.be.true;
          } else {
            expect($(self.$navLevel1Items[navLevel1Item + 1]).find('[data-nav-level-1-heading]').get(0) === document.activeElement).to.be.true;
          }

          expect($level1Item.hasClass(self.activeClass)).to.be.false;
        });
      });
    });

    it('Moves user out of Level 2 and Level 3 by use of the left arrow key', function() {
      var self = this;

      this.$navLevel1Items.each(function(navLevel1Item) {
        var $links = $(this).find('[data-nav-level-2-subcategory-heading], [data-nav-level-2-extended-heading], [data-nav-level-2-subcategory-link], [data-nav-level-3-link]');

        $links.each(function() {
          var $level1Item = $(this).parents('[data-nav-level-1-item]');

          $(this).focus();
          $level1Item.addClass(self.activeClass);
          triggerKeyUp(this, 37);

          if (navLevel1Item == 0) {
            expect($(self.$navLevel1Items[self.$navLevel1Items.length - 1]).find('[data-nav-level-1-heading]').get(0) === document.activeElement).to.be.true;
          } else {
            expect($(self.$navLevel1Items[navLevel1Item - 1]).find('[data-nav-level-1-heading]').get(0) === document.activeElement).to.be.true;
          }

          expect($level1Item.hasClass(self.activeClass)).to.be.false;
        });
      });
    });

    it('Activates Level 3 items by use of the tab and up/down arrow keys', function() {
      // move into Level 2 extended links via tab key
      var target = this.$navLevel2ExtendedHeadings.get(0);
      triggerKeyUp(target, 9);
      expect($(target).siblings('[data-nav-level-3]').hasClass(this.activeClass)).to.be.true;

      // move from first to second via tab key
      var target = this.$navLevel2ExtendedHeadings.get(1);
      triggerKeyUp(target, 9);
      expect($(target).siblings('[data-nav-level-3]').hasClass(this.activeClass)).to.be.true;

      // move into Level 2 extended links via down arrow
      var index = this.$navLevel2ExtendedHeadings.parents('[data-nav-level-1-item]').find('[data-nav-level-1-heading]').get(0);
      $(index).parents('[data-nav-level-1-item]').addClass(this.activeClass);
      triggerKeyUp(index, 40);
      expect($(this.$navLevel2ExtendedHeadings[0]).siblings('[data-nav-level-3]').hasClass(this.activeClass)).to.be.true;

      // move from first to second via down arrow
      var index = this.$navLevel2ExtendedHeadings.get(0);
      $(index).siblings('[data-nav-level-3]').addClass(this.activeClass);
      triggerKeyUp(index, 40);
      expect($(index).siblings('[data-nav-level-3]').hasClass(this.activeClass)).to.be.false;
      expect($(this.$navLevel2ExtendedHeadings[1]).siblings('[data-nav-level-3]').hasClass(this.activeClass)).to.be.true;

      // move from last to first via down arrow
      var index = this.$navLevel2ExtendedHeadings.get(this.$navLevel2ExtendedHeadings.length - 1);
      $(index).siblings('[data-nav-level-3]').addClass(this.activeClass);
      triggerKeyUp(index, 40);
      expect($(index).siblings('[data-nav-level-3]').hasClass(this.activeClass)).to.be.false;
      expect($(this.$navLevel2ExtendedHeadings[0]).siblings('[data-nav-level-3]').hasClass(this.activeClass)).to.be.true;

      // move from second to first via up arrow
      var index = this.$navLevel2ExtendedHeadings.get(1);
      $(index).siblings('[data-nav-level-3]').addClass(this.activeClass);
      triggerKeyUp(index, 38);
      expect($(index).siblings('[data-nav-level-3]').hasClass(this.activeClass)).to.be.false;
      expect($(this.$navLevel2ExtendedHeadings[0]).siblings('[data-nav-level-3]').hasClass(this.activeClass)).to.be.true;

      // move from first to last via up arrow
      var index = this.$navLevel2ExtendedHeadings.get(0);
      $(index).siblings('[data-nav-level-3]').addClass(this.activeClass);
      triggerKeyUp(index, 38);
      expect($(index).siblings('[data-nav-level-3]').hasClass(this.activeClass)).to.be.false;
      expect($(this.$navLevel2ExtendedHeadings[this.$navLevel2ExtendedHeadings.length - 1]).siblings('[data-nav-level-3]').hasClass(this.activeClass)).to.be.true;
    });

    it('Moves user into Level 3 by use of the right arrow key', function() {
      // move from first level 2 extended to first level 3 link via right arrow
      var index = this.$navLevel2ExtendedHeadings.get(0);
      var target = $(index).siblings('[data-nav-level-3]').find('[data-nav-level-3-link]').get(0);
      triggerKeyUp(index, 39);
      expect(target === document.activeElement).to.be.true;
    });

    it('Moves user through Level 3 items by use of the down arrow key', function() {
      var categories = this.$nav.find('[data-nav-level-3]');

      $(categories).each(function() {
        var $links = $(this).find('[data-nav-level-3-link]');
        var $firstLink = $links.get(0);
        var $secondLink = $links.get(1);
        var $lastLink = $links.get($links.length - 1);

        // move from first to second
        moveFocus($firstLink, $secondLink, 40);
        // move from last to first
        moveFocus($lastLink, $firstLink, 40);
      });
    });

    it('Moves user through Level 3 items by use of the up arrow key', function() {
      var categories = this.$nav.find('[data-nav-level-3]');

      $(categories).each(function() {
        var $links = $(this).find('[data-nav-level-3-link]');
        var $firstLink = $links.get(0);
        var $secondLink = $links.get(1);
        var $lastLink = $links.get($links.length - 1);

        // move from second to first
        moveFocus($secondLink, $firstLink, 38);
        // move from first to last
        moveFocus($firstLink, $lastLink, 38);
      });
    });
  });
});
