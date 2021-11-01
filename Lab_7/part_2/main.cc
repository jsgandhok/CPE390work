#include<iostream>
using namespace std;
extern int fac(int k);
extern int choose(int n, int r);
int main() {
    int res = choose(5,2);
    cout << res << endl;
    return 0;
}
