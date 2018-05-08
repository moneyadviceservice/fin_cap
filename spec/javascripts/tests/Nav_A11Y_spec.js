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
        self.$navLevel1Heading = $(fixture.el).find('[data-nav-level-1-heading]');
        self.$navLevel2ExtendedHeading = $(fixture.el).find('[data-nav-level-2-extended-heading]');
        self.obj = new Nav(self.$nav);
        self.delay = self.obj.delay;

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
        self.$navLevel1Heading.each(function() {
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
        self.$navLevel1Heading.each(function() {
          $(this).attr('aria-expanded', 'true');
          self.$nav.trigger('mouseleave');

          if (self.obj.atSmallViewport) {
            expect(self.$navLevel1Heading.attr('aria-expanded')).to.equal('true');
          } else {
            expect(self.$navLevel1Heading.attr('aria-expanded')).to.equal('false');
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
        self.$navLevel2ExtendedHeading.each(function() {
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
        self.$navLevel2ExtendedHeading.each(function() {
          $(this).attr('aria-expanded', 'true');
          self.$nav.trigger('mouseleave');

          if (self.obj.atSmallViewport) {
            expect(self.$navLevel2ExtendedHeading.attr('aria-expanded')).to.equal('true');
          } else {
            expect(self.$navLevel2ExtendedHeading.attr('aria-expanded')).to.equal('false');
          }
        });
      }

      this.obj.atSmallViewport = true;
      navLeave();
      this.obj.atSmallViewport = false;
      navLeave();
    });
  });
});
