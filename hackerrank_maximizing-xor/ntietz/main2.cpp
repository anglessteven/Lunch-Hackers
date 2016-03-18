#include <iostream>
using namespace std;

int main() {
    unsigned int x, y;
    cin >> x >> y;

    unsigned int solution = 0;
    for (unsigned int mask = (1 << 31); mask > 0; mask >>= 1) {
        if (solution > 0 || ((x & mask) != (y & mask))) {
            solution |= mask;
        }
    }

    cout << solution << endl;
}
