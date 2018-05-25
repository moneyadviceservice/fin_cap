describe('Header', function() {
  'use strict';

  beforeEach(function(done) {
    var self = this;

    fixture.setBase('spec/javascripts/fixtures');

    requirejs(
      ['jquery', 'Header'],
      function($, Header) {
        fixture.load('Header.html');

        self.$header = $(fixture.el).find('[data-dough-component="Header"]');
        self.obj = new Header(self.$header);

        self.activeClass = 'mobile-header__search-active';
        self.$mobileSearchButton = self.$header.find('[data-mobile-search-button]');

        var $openText = $(fixture.el).find('[data-mobile-search-text]');
        self.expected = {
          openText: "Open Search",
          closeText: "Close Search",
          openTextFromDiv: $openText.html(),
          closeTextFromDiv: JSON.parse(self.$header.attr("data-dough-header-config")).textClose
        }

        done();
      }, done);
  });

  afterEach(function() {
    fixture.cleanup();
  });

  describe('Search Bar Initialise', function() {
    it('Checks the open search text is correct', function() {
      this.obj.init();
      // Does component variable match static value
      expect(this.obj.openText).to.be.equal(this.expected.openText);
      // Does component variable match markup value
      expect(this.obj.openText).to.be.equal(this.expected.openTextFromDiv);
    });
    it('Checks the close search text is correct', function() {
      this.obj.init();
      // Does markup value match static value (can't test anything else as config doesn't work in tests)
      expect(this.expected.closeText).to.be.equal(this.expected.closeTextFromDiv);
    });
  });

  describe('Search Bar Toggle', function() {
    it('Checks the header gets its class set on click', function() {
      this.obj.init();    
      this.$mobileSearchButton.trigger('click');
      expect(this.$header.hasClass(this.activeClass)).to.be.true;
    });
    it('Checks the header gets its class removed on second click', function() {
      this.obj.init();    
      this.$mobileSearchButton.trigger('click');
      this.$mobileSearchButton.trigger('click');
      expect(this.$header.hasClass(this.activeClass)).to.be.false;
    });
  });

});
