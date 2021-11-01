#include <iostream>
using namespace std;
extern void subtract_min(int a[], int len);
int main() {
  int a[] = {5, 4, 3, 1, 9};
  subtract_min(a, 5); // a is now 4 3 2 0 8
  for (int i = 0; i < sizeof(a)/sizeof(int); i++)
    cout << a[i] << ' ';
  cout << '\n';
}
