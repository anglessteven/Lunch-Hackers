const
  r = require('ramda'),
  input = require('fs').readFileSync('input.txt').toString(),
  cases = require('./parseInput.js')(input),

  // Solution functions
  twins = x => r.times(_ => r.clone(x), 2),
  makeRange = (L, R) => r.range(L, R + 1),
  firstIsLessOrEqual = r.apply(r.lte),
  validPairs = r.filter(firstIsLessOrEqual),
  maxInList = r.apply(Math.max),
  allCombos = r.apply(r.xprod),
  xor = r.apply((a, b) => a ^ b),
  mapXor = r.map(xor),

  // Solver (values are passed to last function, and piped to first) 
  maxXor = r.compose(
    maxInList,  // find max value in list
    mapXor,     // map each pair to xor value
    validPairs, // filter list to satisfy `L ≤ A ≤ B ≤ R`
    allCombos,  // find all combos each range's values
    twins,      // return two copies of the range
    makeRange   // make a range like (L, ...R)
  ),

  solvePair = r.apply(maxXor),  // get solution from a tuple rather than ordered args
  solveCases = r.map(solvePair) // map solutions for a list of test case tuples

/**
 * The following will construct an array of solutions from the test cases
 * the `maxXor` function can also be invoked one-off like ( ex: maxXor(10, 15) )
 */
const solutions = solveCases(cases)

console.log('Test cases', cases)
console.log('Solutions', solutions)
