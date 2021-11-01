#include<iostream>
using namespace std;
int fact(int n) {
    if (n <= 0)
        return 1;
    return n * fact(n-1);
}
int main() {
    int res = fact(4); // 4*3*2*1 = 24
    cout << res << endl;
    
}
