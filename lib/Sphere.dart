class Sphere {
    final double pi = 3.1415926535897932;
    double? radius;

    Sphere(double this.radius);

    void setRadius(double r) {
        this.radius = r;
    }

    double getRadius() {
        return (radius ?? 0);
    }

    double getVolume() {
        double? r = this.radius;

        if (r == null) return 0;

        return (4 / 3 * this.pi * r * r * r);
    }

    double getSA() {
        double? r = this.radius;

        if (r == null) return 0;

        return (4 * this.pi * r * r);
    }
}
