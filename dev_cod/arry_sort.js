
var homes = [
    {"h_id":"3", "city":"Dallas", "state":"TX","zip":"75201","price":"162500"},
    {"h_id":"4","city":"Bevery Hills", "state":"CA", "zip":"90210", "price":"319250"},
    {"h_id":"6", "city":"Dallas", "state":"TX", "zip":"75000", "price":"556699"},
    {"h_id":"5", "city":"New York", "state":"NY", "zip":"00010", "price":"962500"}
    ];

homes.sort(fieldSorter(['city', '-price']));
// homes.sort(fieldSorter(['zip', '-state', 'price'])); // alternative

function fieldSorter(fields) {
    return function (a, b) {
        return fields
            .map(function (o) {
                var dir = 1;
                if (o[0] === '-') {
                   dir = -1;
                   o=o.substring(1);
                }
                if (a[o] > b[o]) return dir;
                if (a[o] < b[o]) return -(dir);
                return 0;
            })
            .reduce(function firstNonZeroValue (p,n) {
                return p ? p : n;
            }, 0);
    };
}
