$fn = 50;

// variables
case_width = 28;
case_depth = 40;
case_height =16;
battery_width = 15;
text_size = 4;
text_height = 1;


module extruded_text(t) {
  linear_extrude(height = text_height) {
    text(t, size = text_size, font = "Liberation Sans", halign = "center", valign = "center", $fn = 30);
  }
}

// base 
union() {
    difference() {
        cube([case_width, case_depth, case_height]);
        translate([5,5,2])
        union() {
            minkowski() {
                cube([case_width-10, case_depth-10, case_height+2]);
                cylinder(r=4, h=1);
            }
            translate([case_width-15,-case_depth+10,1]) cube([2,30,3]);
            translate([case_width-15,-case_depth+10,7]) cube([2,30,3]);
        }
    }
    
    // text
    rotate([90, 0, 90]) translate([20, case_height / 2,case_width])
    extruded_text("open kinetic pwr");

    // battery tongue
    difference() {
        translate([0,-2,0])
        cube([case_width, 2, case_height]);
        translate([-2,-3, 2])
        cube([case_width, 5, case_height-4]);
    }
    translate([0,-2,2]) cube([case_width-2, 1, 2]);
    translate([0,-2,case_height-4]) cube([case_width-2, 1, 2]);

}

difference(){
    union() {
        // battery base 
        translate([0,-28,0])
        difference(){
            cube([case_width, battery_width, case_height]);
            union(){
                translate([1,1,1])
                cube([case_width-2, battery_width-2, case_height+2]);
            }
        }

        // battery groove
        translate([0,-10,0])
        union(){
            translate([0,-2,2])
            cube([case_width-2, 1, case_height-4]);
            translate([0,-3, 4])
            cube([case_width-2, 1, case_height-8]);
        }
    }
    translate([case_width-10,-battery_width,3]) cube([2,6,3]);
    translate([case_width-10,-battery_width,9]) cube([2,6,3]);
}

// lid
translate([-34,-28,0])
        difference(){
            cube([case_width+2, case_depth+battery_width+2, 4]);
            union(){
                translate([1,1,1])
                cube([case_width, case_depth+battery_width, 4]);
            }
        }



