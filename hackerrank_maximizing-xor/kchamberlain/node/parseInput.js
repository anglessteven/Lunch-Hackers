/**
 * This code is JUST to parse the input.txt file, I went ahead and
 * added a `-` character inbetween cases for readability, not
 * that it really needs to be read by humans
 *
 * I felt at liberty to do this in a different file since the
 * hackerank parses the input for you on this one
 */

const
  r = require('ramda'),
  useless = r.anyPass([r.isEmpty, r.isNil]),
  compact = r.reject(useless),
  splitByLine = r.compose(compact, r.split('\n')),
  parseInts = r.map(parseInt),
  removeDashes = r.filter(x => !x.includes('-')),
  groupByTwo = r.splitEvery(2)

// Parser
module.exports = r.compose(
  groupByTwo,
  parseInts,
  removeDashes,
  splitByLine
)
