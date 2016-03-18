const
  _ = require('lodash'),
  fs = require('fs')

const cases = fs
  .readFileSync('../cases.txt')
  .toString()

const
  splitBySpace = str => _.compact(str.split(' ')),
  splitByLine = str => str.split(/\n/),
  parseInts = arr => _.map(arr, _.parseInt),
  hasOneElement = arr => arr.length === 1,
  hasTwoElements = arr => arr.length === 2,
  parseTests = str => {
    return _.chain(str)
      .thru(splitByLine)
      .compact()
      .map(splitBySpace)
      .map(parseInts)
      .value()
  }

console.log(parseTests(cases))
