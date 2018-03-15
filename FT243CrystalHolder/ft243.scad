// Holder for FT 243 quartz crystal
//
// Dimensions are in mm.

$fn=64;

// Thickness of walls
thickness = 3.0;

// Width
width = 20.6;

// Depth
depth = 28.5;

// Height
height = 9.3;

difference() {
    
difference() { 
  // Outside
  cube([width, depth, height], false);
  // Inside
  translate([thickness / 2, thickness / 2, thickness]) {
    cube([width-thickness, depth-thickness, height-thickness], false);
  }
}

// Holes for pins
diameter = 2.4; // Pin diameter
spacing = 12.0; // Spacing between pins

translate([(width - spacing)/2, 5.0, height/2])
  rotate([90, 0, 0])
    cylinder(10.0, diameter/2, diameter/2, false);

translate([20.6 - (20.6 - spacing)/2, 5.0, 9.3 / 2])
  rotate([90, 0, 0])
    cylinder(10.0, diameter / 2, diameter / 2, false);

}