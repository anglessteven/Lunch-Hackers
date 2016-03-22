#include <iostream>
using namespace std;

int main() {
    unsigned int x = 0, y = 0, solution = 1;
    cin >> x >> y;

    for (unsigned int mask = x ^ y; mask != 0; mask >>= 1) solution <<= 1;

    cout << (solution - 1) << endl;
}
