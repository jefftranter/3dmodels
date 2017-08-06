/*

Carrying handle for a number of Heathkit test equipment products.
Typically grey or black. Some units have the word Heathkit on top, so
this can optionally be included. Attaches with two #10 self-tapping
screws approximately 0.5" long. For strength, you probably want to use
100% infill.
 
    FRONT
                             V
    +-------------------------------+ ^
    |  +-------------------------+  | |
   >|w3|<                    ^   |  | h1
    |  |                    h2   |  | |
    +--+                         +--+ V
    <w2>
      <---------- w1 ------------->
      ^
      +- origin

    TOP

    +--------------------------------+ ^
    |                                | d1
    +--------------------------------+ V

    SIDE

     <d1>
     +--+
     |  |
    |    |
    +----+
    <-d2->

*/

// Function count - increase to improve object resolution
$fn=64;

// Dimensions: in mm, can be adjusted to create different handles.

w1=98.0; // Distance between screw holes.
w2=11.2;
w3=9.7;

h1=27.7;
h2=6.6;

d1=14.1;
d2=27.1;

// Slope of handle.
slope=4.0;


// Radius of upper curved corner.
r1=7.0;

// Radius of inner curved corner.
r1=7.0;

// Adjustment to make sides planar.
fudge=1.5;

// Screw hole diameter.
hole_dia=4.0;

// Screw hole depth.
hole_depth=20.0;

// Below won't make much sense without the sketch I made on a piece of
// paper.
HandlePoints = [
  [w1-w2/2, d2/2, 0], // 0
  [w1+w2/2, d2/2, 0], // 1
  [w1-w2/2, -d2/2, 0], // 2
  [w1+w2/2, -d2/2, 0], // 3
  [-w2/2, d2/2, 0], // 4
  [w2/2, d2/2, 0], // 5
  [-w2/2, -d2/2, 0], // 6
  [w2/2, -d2/2, 0], // 7
  [-w2/2+slope, d1/2, h1], // 8
  [w1+w2/2-slope, d1/2, h1], // 9
  [-w2/2+slope, -d1/2, h1], // 10
  [w1+w2/2-slope, -d1/2, h1], // 11
  [w3/2+slope, d1/2+fudge, h1-h2], // 12
  [w1-w3/2-slope, d1/2+fudge, h1-h2], // 13
  [w3/2+slope, -d1/2-fudge, h1-h2], // 14
  [w1-w3/2-slope, -d1/2-fudge, h1-h2], // 15
];

HandleFaces = [
  [6,10,11,3,2,15,14,7], // Front
  [8,10,6,4],            // Left
  [11,9,1,3],            // Right
  [9,8,4,5,12,13,0,1],   // Back
  [8,9,11,10],           // Top
  [14,15,13,12],         // Bottom of top
  [6,7,5,4],             // Bottom left
  [2,3,1,0],             // Bottom Right
  [14,12,5,7],           // Inside left
  [13,15,2,0],           // Inside right
];

// From  http://forum.openscad.org/rounded-corners-td3843.html
// I use this module:
// I either union it to an inside corner or difference it from an
// outside one.

module fillet(r, h) {

    translate([r/2, r/2, 0])
    difference() {
        cube([r + 0.01, r + 0.01, h], center = true);
        translate([r/2, r/2, 0])
            cylinder(r = r, h = h + 1, center = true);
    }
}

difference() {

    polyhedron(HandlePoints, HandleFaces);

    // Remove screw holes.
    {
        translate([0,0,0]) cylinder(d=hole_dia, h=hole_depth);
        translate([w1,0,0]) cylinder(d=hole_dia, h=hole_depth);
    }

    // Round corners at top.
    translate([-2.5, 0, h1]) rotate([270, 0, 0]) fillet(r1, d2);
    translate([w1+2.5, 0, h1]) rotate([90, 180, 0]) fillet(r1, d2);
}

// Round inside corners.
translate([w3-2, 0, h1-h2]) rotate([270, 0, 0]) fillet(r1, d1+3);
translate([w1-w2+4, 0, h1-h2]) rotate([90, 180, 0]) fillet(r1, d1+3);


// Text on top of handle. Comment out if not desired.
translate([w1/2, 0, h1]) linear_extrude(1) {
    text(text="H E A T H K I T", size=4, halign="center", valign="center");
}
