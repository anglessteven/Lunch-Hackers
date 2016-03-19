const _ = require('lodash')
const cases = require('fs')
  .readFileSync('../cases.txt')
  .toString()

const
  splitBySpace = str => _.compact(str.split(' ')),
  splitByLine = str => str.split(/\n/),
  parseInts = arr => arr.map(_.parseInt),
  hasOneElement = arr => _.isEqual(_.size(arr), 1),
  emptyArrays = count => _.times(count, () => []),
  inside = arr => _.without(arr, _.head(arr), _.last(arr)),
  partition = (arr, init) => {
    return _.reduce(arr, (result, item) => {
      const index = result.endOfCase ? result.index + 1 : result.index
      result.cases[index].push(item)

      return _.extend({}, result, {
        index,
        cases: result.cases,
        endOfCase: hasOneElement(item),
      });
    }, init).cases
  },
  splitCases = arr => {
    const
      caseCount = arr[0][0],
      cases = _.drop(arr)

    return partition(cases, {
      cases: emptyArrays(caseCount),
      index: 0,
      endOfCase: false
    })
  },
  parseCase = arr => ({
    nodeCount: _.head(arr)[0],
    edgeCount: _.head(arr)[1],
    start: _.last(arr)[0],
    edges: inside(arr)
  }),
  parseCases = arr => arr.map(parseCase),
  parseTests = str => {
    return _.chain(str)
      .thru(splitByLine)
      .compact()
      .map(splitBySpace)
      .map(parseInts)
      .thru(splitCases)
      .thru(parseCases)
      .value()
  }

console.log(JSON.stringify(
  parseTests(cases)
))
