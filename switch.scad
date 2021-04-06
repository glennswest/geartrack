include <gearmount.scad>;


module switch_holder()
{
    xwidth = 27.4;
    rotate([90,0,0]) gearmount(xwidth);
    difference(){
      rotate([90,0,4]) translate([7-50,0,23]) cube([128.5,xwidth,20]);
      rotate([90,0,4]) translate([20,xwidth/2,41]) cylinder(r=12,h=3);
      rotate([90,0,4]) translate([20,xwidth/2,19]) cylinder(r=1.65,h=30);
      }
}
switch_holder();