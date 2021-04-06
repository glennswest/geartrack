include <gearmount.scad>;


module san_shelf(thewidth)
{
   offset = (thewidth / 2 ) - 7.75;
 
   rotate([0,90,0]) translate([-49,0,9]) cube([100.2,thewidth,5]);
   
   
  
}

module san_brace(thewidth)
{   hull(){
      translate([-80,0,-10]) cube([thewidth/2,thewidth,2]);
      rotate([0,90,0]) translate([-149,0,10]) cube([thewidth,thewidth,2]);
       }
      hull(){
       translate([-18,0,25]) cube([thewidth/2,thewidth,2]);   
       rotate([0,90,0]) translate([-32,0,10]) cube([thewidth/2,thewidth,2]);
      }
}



module nas_holder()
{
    xwidth = 29;
    rotate([90,0,0]) gearmount(xwidth);
    
    rotate([90,0,0]) translate([0,0,90]) san_shelf(xwidth);
    
    rotate([90,0,0]) translate([-51.8,0,19]) cube([138.5,xwidth,20]);
    difference(){
       rotate([90,0,0]) translate([0,0,0]) san_brace(xwidth);
       for ( i = [0 : 8] ){
         translate([5, (i*13) - 150, xwidth/2]) rotate([-90,0,90])  cylinder(r=5,h=70); 
         }  
       }
    rotate([90,0,0]) translate([11,0,139]) cube([20,xwidth,10]);

}

//nas_holder();