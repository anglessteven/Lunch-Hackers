#include <iostream>
using namespace std;

int maxXor(int l, int r) {
    int max = 0;

    for ( int left = l; left <= r; ++left){
        for ( int right = r; right >= l; --right){
            if ( (left ^ right) > max) max = left ^ right;
        }
    }

    return max;
}

int main() {
    int _l, _r;
    cin >> _l >> _r;
    cout << maxXor(_l, _r);
    return 0;
}