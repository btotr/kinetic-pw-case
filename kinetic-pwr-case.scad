$fn = 50;

// variables
case_width = 28;
case_depth = 45;
case_height = 10;
lid_height = 2;
border = 3;


module base(w,d,h) {
    minkowski() {
        cube([w,d,h]);
        cylinder(r=3, h=3);
    }
}

// case
difference() {
    union(){
        difference() {
            base(case_width,case_depth,case_height-lid_height/2);
            translate([border,border,border])
            base(case_width-(border*2),case_depth-(border*2),case_height-lid_height/2);
        }
        difference() {
            translate([0,0,case_height-lid_height/2])
            base(case_width,case_depth,2);
            translate([border-(border/2),border-(border/2),case_height-(lid_height/2)-2])
            base(case_width-(border*2)+border,case_depth-(border*2)+border, lid_height+4);
        }
    }
    union(){
        // usb-c
        translate([case_width/2-4.2,-5,border+2])
        cube([8.4,120,2.4]);
        /* todo loadcell
        translate([case_width/2-3,-5,border+2])
        cylinder(6,3,3);*/
    }
}

// lid
translate([-case_width-10,0,0])
difference() {
    difference() {
        base(case_width,case_depth,lid_height/2);
        translate([border,border,border])
        base(case_width-(border*2),case_depth-(border*2),lid_height+4);
    }
    difference() {
     
        translate([-1,-1,lid_height])
        base(case_width+2,case_depth+2,lid_height/2+4);
        translate([border/2,border/2,0])
        base(case_width-(border*2)+border,case_depth-(border*2)+border, lid_height+4);
  }
}

