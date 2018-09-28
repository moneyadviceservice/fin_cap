describe('Cookies', function() {
    'use strict';

    function init(self) {
        self.obj.init();
    }

    beforeEach(function(done) {
        var self = this;

        fixture.setBase('spec/javascripts/fixtures');

        requirejs(
            ['jquery', 'Cookie'],
            function($, Cookie) {
                fixture.load('Cookie.html');

                self.$component = $(fixture.el).find('[data-dough-component="Cookie"]');
                self.obj = new Cookie(self.$component);
                self.classPrototype = Cookie.prototype;

                done();
            }, done);
    });

    afterEach(function() {
        fixture.cleanup();
    });

    describe('Init', function() {
        it('should add a link property', function() {
            init(this);
            expect(this.obj.form).not.to.be.undefined;
            expect(this.obj.form[0].nodeName.toLocaleLowerCase()).to.equal('form');
        });

        it('should call addEvents method', function() {
            var addEventsSpy = sinon.spy(this.classPrototype, 'addEvents');
            init(this);
            expect(addEventsSpy.callCount).to.equal(1);
            addEventsSpy.restore();
        });
    });

    describe('Events', function() {
        it('should call correct methods on form submit', function() {
            var addCookieSpy = sinon.spy(this.classPrototype, 'addCookie');
            var removeDomSpy = sinon.spy(this.classPrototype, 'removeDom');
            init(this);
            this.obj.form.submit();

            expect(addCookieSpy.callCount).to.equal(1);
            expect(removeDomSpy.callCount).to.equal(1);

            addCookieSpy.restore();
            removeDomSpy.restore();
        });
    });

    describe('removeDom', function() {
        it('should remove the dom element', function() {
            expect(document.querySelector('.cookie-policy')).not.to.be.null;
            this.obj.removeDom();
            expect(document.querySelector('.cookie-policy')).to.be.null;
        });
    });
});