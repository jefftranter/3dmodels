// Holder for FT 243 quartz crystal - top cover
//
// Dimensions are in mm.

$fn=64;

// Width
width = 20.6;

// Depth
depth = 28.5;

// Height
height = 1.5;

// Outside
cube([width, depth, height], false);

// Text on top of cover. Comment out if not desired.
//translate([width/2, depth*2/3, height]) linear_extrude(1) {
//    text(text="7.055", size=3, halign="center", valign="center");
//}

