// Knob for CW key.
// Use M4 screw to mount

$fn=64;
cylinder(h=3.5, r1=13.5, r2=13.5, center=true);
difference() {
  cylinder(h=8.75, r1=4, r2=4, center=false);
  cylinder(h=8.75, r2=1.5, r2=1.5);
}