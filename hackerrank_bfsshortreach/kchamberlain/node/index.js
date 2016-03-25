const r = require('ramda');
const cases = require('fs')
  .readFileSync('../cases.txt')
  .toString()

const
  useless = r.anyPass([r.isEmpty, r.isNil]),
  compact = r.reject(useless),
  splitBySpace = r.compose(compact, r.split(' ')),
  splitByLine = r.compose(compact, r.split('\n')),
  splitLinesBySpaces = r.map(splitBySpace),
  parseInts = r.wrap(r.map(parseInt), r.map),
  hasOneElement = r.compose(r.equals(1), r.length),
  emptyArrays = r.times(() => []),
  fst = r.compose(r.head, r.head),
  snd = r.compose(r.nth(1), r.head),
  startNode = r.compose(r.head, r.last),
  inside = arr => r.without([r.head(arr), r.last(arr)], arr),
  splitCases = arr => {
    const
      caseCount = fst(arr),
      cases = r.tail(arr),
      init = {
        cases: emptyArrays(caseCount),
        index: 0,
        endOfCase: false
      }

    const reduction = r.reduce((result, item) => {
      const index = result.endOfCase ? result.index + 1 : result.index
      result.cases[index].push(item)

      return r.merge(result, {
        index,
        cases: result.cases,
        endOfCase: hasOneElement(item)
      })
    }, init, cases)

    return reduction.cases
  },
  parseTestCases = r.map(arr => ({
    nodeCount: fst(arr),
    edgeCount: snd(arr),
    start: startNode(arr),
    edges: inside(arr)
  })),

  parseInput = r.compose(
    parseTestCases,
    splitCases,
    parseInts,
    splitLinesBySpaces,
    splitByLine
  )

console.log(JSON.stringify(parseInput(cases)))
