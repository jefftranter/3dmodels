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

// Screw hole diameter.
hole_dia=4.0;

// Screw hole depth.
hold_depth=20.0;

// Below won't make much sense without the sketch I made on a piece of
// paper.
HandlePoints = [
  [100, 15+5,  0 ],  // 0
  [110, 15+5,  0 ],  // 1
  [100,  0-5,  0 ],  // 2
  [110,  0-5,  0 ],  // 3
  [  0, 15+5,  0 ],  // 4
  [ 10, 15+5,  0 ],  // 5
  [  0,  0-5,  0 ],  // 6
  [ 10,  0-5,  0 ],  // 7
  [  0+5, 15, 25 ],  // 8
  [110-5, 15, 25 ],  // 9
  [  0+5,  0, 25 ],  // 10
  [110-5,  0, 25 ],  // 11
  [ 10+4, 15+1, 19 ],  // 12
  [100-4, 15+1, 19 ],  // 13
  [ 10+4,  0-1, 19 ],  // 14
  [100-4,  0-1, 19 ],  // 15
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

polyhedron(HandlePoints, HandleFaces);

// Text on top of handle. Comment out if not desired.
translate([35, 5, 25]) linear_extrude(1) {
 text("H E A T H K I T", 4);
}
