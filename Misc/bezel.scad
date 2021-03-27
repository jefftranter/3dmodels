// Bezel for TFT touchscreen

$fn=64;

difference() {
  cube([100,60,2], center=true);
  cube([81,53,3.0], center=true);
  {
    translate([-46,-24.5,0]) {
      cylinder(h=3.0, r1=1.5,r2=1.5,center =   true);
    }
  }
    {
    translate([46,-24.5,0]) {
      cylinder(h=3.2, r1=1.5,r2=1.5,center =   true);
    }
  }
    {
    translate([-46,24.5,0]) {
      cylinder(h=3.2, r1=1.5,r2=1.5,center =   true);
    }
  }
    {
    translate([46,24.5,0]) {
      cylinder(h=3.2, r1=1.5,r2=1.5,center =   true);
    }
  }
}
