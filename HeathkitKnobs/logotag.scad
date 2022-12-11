// Heathkit logo nameplate
//
// As used on FM-3, FM-3A, XR-1, RX-1, etc.
//
// Jeff Tranter <tranter@pobox.com>  

// Function count - increase to improve object resolution
$fn=64;

// Text to use
txt1 = "_";
txt2 = "H e a t h k i t";
txt3 = "_____________";

tsz = 9.3;

linear_extrude(3) {
    translate([-3, 10.3]) text(txt1, size=tsz, halign = "left", font="C059:style=Bold Italic");
    translate([0, 0]) text(txt2, size=tsz, halign = "left", font="C059:style=Bold Italic");
    translate([5.5, 1.8]) text(txt3, size=tsz, halign = "left", font="C059:style=Bold Italic");
    //translate([15, 5]) circle(1.2);
}

// Mounting pegs
translate([7.5, 2, -9]) cylinder(9, 1.2, 1.2);
translate([72.5+7.5, 2, -9]) cylinder(9, 1.2, 1.2);

// Piece to join the dot above the i
translate([71.9, 6, 0]) cube(size=1.6);
