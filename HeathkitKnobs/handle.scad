
HandlePoints = [
  [100, 15,  0 ],  // 0
  [110, 15,  0 ],  // 1
  [100,  0,  0 ],  // 2
  [110,  0,  0 ],  // 3
  [  0, 15,  0 ],  // 4
  [ 10, 15,  0 ],  // 5
  [  0,  0,  0 ],  // 6
  [ 10,  0,  0 ],  // 7
  [  0, 15, 25 ],  // 8
  [110, 15, 25 ],  // 9
  [  0,  0, 25 ],  // 10
  [110,  0, 25 ],  // 11
  [ 10, 15, 19 ],  // 12
  [100, 15, 19 ],  // 13
  [ 10,  0, 19 ],  // 14
  [100,  0, 19 ],  // 15
];

// Vector of faces which collectively enclose the solid. Each face is
// a vector containing the indices (0 based) of 3 or more points from
// the points vector. Faces may be defined in any order. Define enough
// faces to fully enclose the solid, with no overlap. Points which //
// describe a single face must all be on the sa

// All faces must have points ordered in the same direction . OpenSCAD
// prefers clockwise when looking at each face from outside inwards.
// The back is viewed from the back, the bottom from the bottom, etc..

HandleFaces = [
  [6,10,11,3,2,15,14,7], // Front
  [8,10,6,4],            // Left
  [11,9,1,3],            // Right
  [9,8,4,5,12,13,0,1],             // Back
  [8,9,11,10],           // Top
  [14,15,13,12],         // Bottom of top
  [6,7,5,4],             // Bottom left
  [2,3,1,0],             // Bottom Right
  [14,12,5,7],           // Inside left
  [13,15,2,0],           // Inside right
];

polyhedron(HandlePoints, HandleFaces);
