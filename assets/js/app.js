'use strict';
let _APP;

// Import app.scss to kick off compilation
import '../sass/app.scss';

import Test from './app/components/Test.js';

_APP = (function() {
    new Test();
})();
