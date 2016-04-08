from collections import OrderedDict
import string

def decode(keyword, message):
  # Read in the keyword and remove duplicate characters
  keyword = "".join(OrderedDict.fromkeys(keyword))
  remaining_letters = [[k] for k in string.uppercase if k not in keyword]

  def combine(acc, kv):
    if kv[0] not in acc:
      return acc + [kv[0]] + kv[1]
    else:
      return acc + kv[1]

  d = string.maketrans("".join(reduce(combine, sorted(zip(keyword*(len(remaining_letters)/len(keyword)+1), remaining_letters)), [])), string.uppercase)
  print string.translate(message, d)

num_cases = int(raw_input())

for _ in range(0, num_cases):
  keyword, message = raw_input(), raw_input()
  decode(keyword, message)

