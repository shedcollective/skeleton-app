'use strict';
var _APP;

import jquery from 'jquery';
window.$ = window.jQuery = jquery;

var Bootstrap = require('bootstrap-sass');
Bootstrap.$ = $;

import Test from './app/components/Test.js';

_APP = (function() {
    const test = new Test();
})();
