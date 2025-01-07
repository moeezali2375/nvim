local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
print("hehe")
ls.add_snippets('cpp', {
  s('lib', {
    t {
      '#include <iostream>',
      '#include <vector>',
      '#include <algorithm>',
      '#include <queue>',
      '#include <stack>',
      '#include <set>',
      '#include <map>',
      '#include <unordered_map>',
      '#include <unordered_set>',
      '#include <cmath>',
      '#include <limits>',
      '#include <numeric>',
      '#include <functional>',
      '#include <cstring>',
      '#include <iomanip>',
      '#include <cassert>',
      'using namespace std;',
      '',
      'typedef long long ll;',
      'typedef vector<int> vi;',
      'typedef pair<int, int> pii;',
      '',
      'int main() {',
      '    return 0;',
      '}',
    },
  }),
})
