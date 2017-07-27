// Function count - increase to improve object resolution
$fn=64;

b1_height = 1.2;
b1_width = 28.7;

b2_width_lower = 28.7;
b2_width_upper = 20.9;
b2_height = 1.0;

main_width_lower = 20.9;
main_width_upper = 19.7;
main_height = 16.0;

ring_height = 0.5;
ring_width_outer = 17.3;
ring_width_inner = 13.8;

arrow_height = 0.9;

knurl_width = 1.5;
knurl_count = 25;
knurl_depth = 0.5;
unknurled_height = 1.3;

screw_hole_width=4.2;
screw_hole_height=7.9;

bottom_hole_height=4.2;
bottom_hole_width=16.9;

inner_hole_height=15;
inner_hole_width=6.5;

module arrow() {
    
    intersection() {
    
        bottom();
        translate([(b2_width_lower+b2_width_upper)/4-(b2_width_lower-b2_width_upper)/4,0,0])
        cylinder(h=b1_height+b2_height,r=(b2_width_lower-b2_width_upper)/2,$fn=3);
    }
}

module ring() {
    
    difference() {
        
        cylinder(h=ring_height, r=ring_width_outer/2);
        //
        cylinder(h=ring_height, r=ring_width_inner/2);
        }
}

module bottom() {
    
    // Bottom 1
    cylinder(h=b1_height,r=b1_width/2); 

    // Bottom 2
    translate([0,0,b1_height])
    cylinder(h=b2_height,r1=b2_width_lower/2,r2=b2_width_upper/2); 
    
}

module main() {
    
    translate([0,0,b1_height+b2_height])
    cylinder(h=main_height, r1=main_width_lower/2, r2=main_width_upper/2);

}

module main_outer() {
    
    translate([0,0,b1_height+b2_height])
    cylinder(h=main_height, r1=(main_width_lower+knurl_depth)/2, r2=(main_width_upper+knurl_depth)/2);

}

module main_outer_unknurled_area() {

intersection() {
    
    main_outer();
    translate([0,0,b1_height+b2_height])
    cylinder(h=unknurled_height, r=20);
    
    }

}

module knurls() {
    translate([0,0,b1_height+b2_height])
    for (knurl = [0 : knurl_count-1]) {
        rotate([0,0,knurl*360/knurl_count])
        cube([knurl_width,main_width_lower,main_height]);
    }
    }

module knurls2() {
    
    intersection() {
    
    main_outer();
   
    knurls();
    
    
        
    }
   
    main_outer_unknurled_area();

}

module knob() {
    bottom();
main();

translate([0,0,b1_height+b2_height+main_height])
ring();

// Arrow
translate([0,0,arrow_height])
arrow();    
knurls2();
    }

/*********** START ************/

difference() {
    
knob();
    
    
    // Holes
 translate([0,0,screw_hole_height]) rotate([0,-90,0]) cylinder(h=100, r=screw_hole_width/2);
   
   //bottom_hole 
 cylinder(h=bottom_hole_height, r=bottom_hole_width/2);

//inner_hole
 cylinder(h=inner_hole_height, r=inner_hole_width/2);
    }
    

