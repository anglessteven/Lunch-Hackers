#include <iostream>
using namespace std;

int main() {
    unsigned int x, y;
    cin >> x >> y;

    unsigned int masks[32];
    for (int idx = 0; idx < 32; ++idx) {
        masks[idx] = 1 << idx;
    }

    bool started = false;
    unsigned int solution = 0;
    for (int idx = 31; idx >= 0; --idx) {
        if (((x & masks[idx]) != (y & masks[idx]))) {
            started = true;
        }
        if (started) {
            solution |= masks[idx];
        }
    }
    cout << solution << endl;
}
