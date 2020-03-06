
scale([1.5,1.5,1.5]) bowl();

sc = .1;
base_thick = 1.5;
gear_thick = 2;
thread_thick = 2.5;
inner_thick = 2;

*scale([1.5,1.5,1.5]) tall_logo();

module tall_logo(h = 5){
    translate([0,0,h]) logo();
    scale([1,1,h+.1]) base();
}

module bowl(){
    scale([3,3,8]) difference(){
        union(){
            base(sphere_scale = [3,3,1]);
            translate([-.1,2.1,0]) cylinder(r=5, h=2);
        }
        translate([0,0,10+1]) cube([20,20,20], center=true);
    }
}

module logo(){
    union(){
        base();
        
        inner();
        threads();
        gear();
    }
}

module base(sphere_scale = scale([2,2,1])){
    sphere_rad = 1;
    minkowski(){
        linear_extrude(height=base_thick-sphere_rad){
            scale([sc,sc,sc]) import("nova-labs_icon.dxf");
        }
        //cylinder(r1=1, r2=.5, h=base_thick/2, $fn=12);
        scale(sphere_scale) sphere(r=sphere_rad/2, $fn=6);
    }
}

module gear(){
    minkowski(){
        linear_extrude(height=gear_thick*8/9){
            scale([sc,sc,sc]) import("nova-labs_icon.dxf", layer="gear");
        }
        cylinder(r1=.25, r2=.125, h=gear_thick*1/9, $fn=12);
    }
}

module threads(){
    intersection(){
        linear_extrude(height=thread_thick){
            scale([sc,sc,sc]) import("nova-labs_icon.dxf", layer="threads");
        }
        
        translate([-1,0,0]) rotate([0,0,-27]) scale([.9,.9,.75]) rotate([90,0,0]) cylinder(r=3, h=31, center=true, $fn=60);
    }
}

module inner(){
    minkowski(){
        linear_extrude(height=inner_thick*9/10){
            scale([sc,sc,sc]) import("nova-labs_icon.dxf", layer="inner");
        }
        cylinder(r1=.125, r2=.125/2, h=inner_thick*1/10, $fn=12);
    }
}


