/*

Part 1: 1390
Part 2: 1458
*/

var fs = require('fs');
var array = fs.readFileSync('/Users/doug/GitHub/AdventOfCode/2021/day01/day01/input.txt').toString().split("\n");
var i = 0;
var A = [];

var increase = 0;

for (i=0; i<=array.length; i++) {
    A[i] = Number(array[i]);
}

for (i=0; i < A.length-1; i++) {
    if (A[i+1] > A[i]) {
      increase++;
    }
}

console.log("Part 1: ", increase);

increase = 0;

var B = [];

for (i=0; i<A.length-2; i++) {
    B[i] = A[i] + A[i+1] + A[i+2];
}

for (i=0; i<B.length; i++) {
    if (B[i+1] > B[i]) {
        increase++;
    }
}
    
console.log ("Part 2: ", increase);