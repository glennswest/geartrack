include <gearmount.scad>;


module psu()
{
    cube([31.9,53,117]);
}

module cord_holder()
{
    difference(){
      translate([87,-76,0]) rotate([90,-90,94]) cube([18,18,10]);
      translate([80,-85,17]) rotate([90,-90,94]) cylinder(r=7,h=20);
      translate([92.5,-75,6]) rotate([0,-90,94]) cylinder(r=2,h=20);  
      
      }
    
}

module psu_holder()
{
    xwidth = 34;
    rotate([90,0,0]) gearmount(xwidth);
    cord_holder();
    difference(){
      translate([-38,-45,0]) rotate([90,-90,94]) cube([34,60,123]);
      translate([-35,-50,3]) rotate([90,-90,94]) psu();
      translate([-20,-55,-1])  rotate([90,-90,94]) cube([15,35,90]);
      translate([-40,-60,4])  rotate([90,-90,94]) cube([25,30,20]);
      translate([80,-85,17]) rotate([90,-90,94]) cylinder(r=7,h=10);
      }
    difference(){
      rotate([90,0,4]) translate([7-50,0,23]) cube([128.5,xwidth,20]);
      rotate([90,0,4]) translate([20,xwidth/2,41]) cylinder(r=12,h=3);
      rotate([90,0,4]) translate([20,xwidth/2,19]) cylinder(r=1.65,h=30);
      }
}
psu_holder();