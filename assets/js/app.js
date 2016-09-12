var _APP;
_APP = function() {
    /**
     * Avoid scope issues in callbacks and anonymous functions by referring to `this` as `base`
     * @type {Object}
     */
    var base = this;

    // --------------------------------------------------------------------------

    /**
     * Construct the class
     * @return {Object}
     */
    base.__construct = function() {
        return base;
    };

    // --------------------------------------------------------------------------

    return base.__construct();
}();
