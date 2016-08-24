'use strict';

String.prototype.render = function(obj) {
    return this.replace(/\{(\w+)\}/g, function(r, e) {
        return obj[e];
    });
};
