define(['jquery', 'DoughBaseComponent'], function($, DoughBaseComponent) {
   'use strict';
   var Cookie;

    Cookie = function($el, config) {
        this.$el = $el;
        Cookie.baseConstructor.call(this, $el, config);
    };

    /**
     * Inherit from base module, for shared methods and interface
     */
    DoughBaseComponent.extend(Cookie);

    Cookie.componentName = 'Cookie';

    /**
     * assuming that we don't have the cookie as the
     * dough component has loaded if not there then we should be
     */
    Cookie.prototype.init = function() {
        this.form = this.$el.find('.cookie-form');
        this.addEvents();
    };

    Cookie.prototype.addEvents = function() {
        var self = this;
        this.form.submit(function(evt) {
            evt.preventDefault();
            self.addCookie();
            self.removeDom();
        });
    };

    Cookie.prototype.addCookie = function() {
        var COOKIE_POLICY_MESSAGE_NAME = '_cookie_policy_acceptance';
        var secondsInYear = 1000 * 60 * 60 * 24 * 365;
        var years = 20;
        document.cookie = COOKIE_POLICY_MESSAGE_NAME + '=y, expires=' + new Date(Date.now() + secondsInYear * years);
    };

    Cookie.prototype.removeDom = function() {
        this.$el.remove();
    };

    return Cookie;
});