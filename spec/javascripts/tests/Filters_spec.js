describe('Filters', function() {
  'use strict';

  beforeEach(function(done) {
    var self = this;

    fixture.setBase('spec/javascripts/fixtures');

    requirejs(
      ['jquery', 'Filters'],
      function($, Filters) {
        fixture.load('Filters.html');

        self.$component = $(fixture.el).find('[data-dough-component="Filters"]');
        self.obj = new Filters(self.$component);
        self.$filters_radio = self.$component.find('[data-form-filter-radio]');
        self.$filters_checkbox = self.$component.find('[data-form-filter-checkbox]');

        done();
      }, done);
  });

  afterEach(function() {
    fixture.cleanup();
  });

  describe('Filter change', function() {
    it('Calls the submits method on the form when the filter state is changed', function() {
      var submitStub = sinon.stub(this.obj, '_submitForm');
      var callCount = 0;

      this.obj.init();

      this.$filters_radio.each(function() {
        $(this).trigger('click');
        callCount++;
        expect(submitStub.callCount).to.be.equal(callCount);
        $(this).trigger('click');
        expect(submitStub.callCount).to.be.equal(callCount);
      });

      this.$filters_checkbox.each(function() {
        $(this).trigger('click');
        callCount++;
        expect(submitStub.callCount).to.be.equal(callCount);
        $(this).trigger('click');
        callCount++;
        expect(submitStub.callCount).to.be.equal(callCount);
      });
    });
  });
});
