// Knob for CW key.
// Use M4 screw to mount

$fn=64;
cylinder(h=3.0, r1=13.5, r2=13.5, center=true);
difference() {
  cylinder(h=9.75, r1=4.5, r2=4.5, center=false);
  cylinder(h=9.75, r2=1.5, r2=1.5);
}