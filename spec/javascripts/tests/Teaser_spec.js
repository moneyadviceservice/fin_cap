describe('Teaser', function() {
  'use strict';

  beforeEach(function(done) {
    var self = this;

    fixture.setBase('spec/javascripts/fixtures');

    requirejs(
      ['jquery', 'Teaser'],
      function($, Teaser) {
        fixture.load('Teaser.html');

        self.$component = $(fixture.el).find('[data-dough-component="Teaser"]');
        self.obj = new Teaser(self.$component);
        self.$content = self.$component.find('[data-teaser-content]');
        self.$image = self.$component.find('[data-teaser-image]');

        done();
      }, done);
  });

  afterEach(function() {
    fixture.cleanup();
  });

  describe('Change Height', function() {
    it('Checks the style attribute is stripped', function() {
      this.obj.init();
      this.$image.css({maxHeight: 100});
      this.obj._stripJs();
      expect(this.$image.attr("style")).to.equal("")
    });


    it('Checks the max-width attribute is set', function() {
      this.obj.init();
      this.obj._setMaxHeight();
      expect(this.$image.attr("style")).to.not.equal("")
    });
  });
});
