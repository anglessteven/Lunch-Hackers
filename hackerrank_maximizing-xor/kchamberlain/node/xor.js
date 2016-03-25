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

  // Solver
  maxXor = r.compose(
    maxInList,
    mapXor,
    validPairs,
    allCombos,
    twins,
    makeRange
  ),

  solvePair = r.apply(maxXor),
  solveCases = r.map(solvePair)

/**
 * The following will construct an array of solutions from the test cases
 * the `maxXor` function can also be invoked one-off like ( ex: maxXor(10, 15) )
 */
const solutions = solveCases(cases)

console.log('Test cases', cases)
console.log('Solutions', solutions)
