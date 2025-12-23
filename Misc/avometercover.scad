// Battery cover for AVOMeter Model 8 Mark III Multimeter.

// Parameters
length = 108;      // mm
width  = 43.5;     // mm
thickness = 5.2;   // mm
corner_radius = 6; // mm

$fn = 64; // smoothness of rounded corners

// Rounded rectangle module
module rounded_plate(l, w, h, r) {
    linear_extrude(height = h)
        offset(r = r)
            square([l - 2*r, w - 2*r], center = true);
}

// Create the plate
rounded_plate(length, width, thickness, corner_radius);
