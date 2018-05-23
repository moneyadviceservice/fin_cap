describe('Tooltip', function() {
  'use strict';

  beforeEach(function(done) {
    var self = this;

    fixture.setBase('spec/javascripts/fixtures');

    requirejs(
      ['jquery', 'Tooltip'],
      function($, Tooltip) {
        fixture.load('Tooltip.html');

        self.$tooltip = $(fixture.el).find('[data-dough-component="Tooltip"]');
        self.obj = new Tooltip(self.$tooltip);
        self.$content = self.$tooltip.find('[data-tooltip-content]');
        self.hiddenClass = self.obj.hiddenClass;

        done();
      }, done);
  });

  afterEach(function() {
    fixture.cleanup();
  });

  describe('Set up component', function() {
    it('Calls the corret methods on init', function() {
      var setUpComponentStub = sinon.stub(this.obj, '_setUpComponent');

      this.obj.init();

      expect(setUpComponentStub.callCount).to.be.equal(1);
    });
  });

  describe('Touch enabled devices', function() {
    it('Displays/hides tooltip on touch', function() {
      this.obj.init();

      // clicking tooltip button shows/hides content
      this.$tooltip.trigger('click');
      expect(this.$content.hasClass(this.hiddenClass)).to.be.false;
      this.$tooltip.trigger('click');
      expect(this.$content.hasClass(this.hiddenClass)).to.be.true;

      // touch outside tooltip button hides content
      this.$tooltip.trigger('click');
      this.$tooltip.trigger('blur');
      expect(this.$content.hasClass(this.hiddenClass)).to.be.true;
    });
  });

  describe('Non-touch enabled devices', function() {
    it('Displays/hides tooltip on hover', function() {
      this.obj.init();

      // mouse over tooltip button
      this.$tooltip.trigger('mouseover');
      expect(this.$content.hasClass(this.hiddenClass)).to.be.false;

      // mouse away from tooltip button
      this.$tooltip.trigger('mouseout');
      expect(this.$content.hasClass(this.hiddenClass)).to.be.true;
    });
  });
});
