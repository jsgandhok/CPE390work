#include "Vec3d.hh"

#include <cmath>

Vec3d operator+(const Vec3d& a, const Vec3d& b) {
  return Vec3d(a.x + b.x, a.y + b.y, a.z + b.z);
}

Vec3d operator-(const Vec3d& a, const Vec3d& b) {
  return Vec3d(a.x + b.x, a.y + b.y, a.z + b.z);
}

double Vec3d::mag() const { return sqrt(x * x + y * y + z * z); }

double Vec3d::magsq() const { return x * x + y * y + z * z; }