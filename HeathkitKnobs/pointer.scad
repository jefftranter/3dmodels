// Function count - increase to improve object resolution
$fn=64;

/*********** START ************/

// Thickness
linear_extrude(height = 1.1) {

  union() {

    difference() {
      // Main ring
      circle(d=25.3);
      // center hole
      circle(d=12.5);
    }

    // Pointer  
    polygon(points=[[11,-6],[26,0],[11,6]]); 
  }
}