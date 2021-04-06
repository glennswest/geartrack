

module halfcylinder(r,h)
{
    difference(){
       cylinder(r=r,h=h);
       translate([0,0-r,0-.5]) cube([r*2+1,r*2+1,h+1]);
    } 
}

module thirdcylinder(r,h)
{
    difference(){
       cylinder(r=r*2,h=h);
       translate([0-r/1.5,0-2*r,0-.5]) cube([r*4+1,r*4+1,h+1]);
    } 
}
module gearmount(thewidth)
{
    translate([-2,0,0])   cube([14,thewidth,4.25]);
    translate([8-1.5,0,0])  cube([6,thewidth,19.6]);
    
    translate([72,0,0])  cube([15,thewidth,4.25]);
    translate([13-1.5,0,20]) rotate([-90,0,0]) cylinder(r=5,h=thewidth); 
   
    translate([82,0,20]) rotate([-90,0,0]) cylinder(r=5,h=thewidth); 
     
    translate([82,0,4.3])  cube([5,thewidth,15.6]);
   
    translate([14,0,15]) cube([69,thewidth,4.25]);
    
}


module batterysupport(xwidth)
{
       
         rotate([0,90,0]) translate([-128,-32+xwidth/2,15]) cube([64,64,5]);
         rotate([0,90,0]) translate([-68,xwidth/2,15]) cylinder(r=32,h=5);
       
    
}

module battery_plate(xwidth)
{
    difference(){
        batterysupport(xwidth);
        rotate([0,0,0]) translate([0,0,90]) scale([1.02,1.02,1.02]) battery_stud(xwidth);
        //rotate([0,90,-90]) translate([40,10,-8]) cube([xwidth,xwidth,10]);
    }
        
}

module saw_battery_plate(xwidth)
{
    difference(){
        batterysupport(xwidth);
        rotate([180,0,0]) translate([0,0-25,-42]) scale([1.02,1.02,1.02]) battery_stud(xwidth);
        //rotate([0,90,-90]) translate([40,10,-8]) cube([xwidth,xwidth,10]);
    }
        
}

module battery_stud_body(thewidth)
{
   offset = (thewidth / 2 ) - 7.75;
  // %rotate([0,90,0]) translate([0,0,10]) cube([35.85,thewidth,50]);
   rotate([0,90,0]) translate([4,0,10]) cube([thewidth-7,thewidth,50]);
   rotate([0,90,0]) translate([-14,0,9]) cube([85,thewidth,5]);
   rotate([0,90,0]) translate([22,thewidth/2,10]) cylinder(r=thewidth/2,h=50);    
}

module battery_stud(thewidth)
{
   difference(){
     battery_stud_body(thewidth);
     rotate([0,90,0]) translate([-9,4,16]) rotate([0,0,-45]) cube([thewidth-4,10,51]);
     rotate([0,90,0]) translate([-9+thewidth-8,thewidth+15,16]) rotate([0,0, 180+45]) cube([thewidth-6,10,51]);
    rotate([0,90,0]) translate([17.25,thewidth/2,40]) scale([2.0,4.0,4.0]) sphere(r=5.0);   
   }
}   
   
module brace(thewidth)
{   hull(){
      translate([-50,0,-10]) cube([thewidth/2,thewidth,2]);
      rotate([0,90,0]) translate([-90,0,10]) cube([thewidth,thewidth,2]);
       }
      hull(){
       translate([-18,0,25]) cube([thewidth/2,thewidth,2]);   
       rotate([0,90,0]) translate([-32,0,10]) cube([thewidth/2,thewidth,2]);
      }
}


module Ushape(ur1, ur2 ,uh) {

    // Circle resolution
    cRes = 30;
    // Extrusion resolution
    eRes = 50;

    union(){
        // The rounded part
        rotate_extrude(angle=180, convexity=10, $fn=eRes)
               translate([ur2, 0]) circle(ur1, $fn=cRes);

        // U extensions
        rotate([90,0,0]) linear_extrude(height=uh,$fn=eRes)
               translate([ur2, 0]) circle(ur1, $fn=cRes);
        rotate([90,0,0]) linear_extrude(height=uh,$fn=eRes)
               translate([-ur2, 0]) circle(ur1, $fn=cRes);
    }

}


module dewalt_you(xwidth)
{
    rotate([0,90,0]) translate([0-xwidth+25/2,-45,50]) Ushape(5,(xwidth+10+2)/2,40);
    hull(){
       translate([55,-20,-5]) cylinder(r=5,h=xwidth+20);
       translate([45,-20,-5]) cylinder(r=5,h=xwidth+20);     
       translate([50,-20,-5]) cylinder(r=5,h=xwidth+20);  
       translate([50,-30,-5]) cylinder(r=5,h=xwidth+20);  
      }    
    
}

module dewalt_upper(xwidth)
{
        translate([-23.5,0,0]) dewalt_you(xwidth);
        translate([ 23+.6,0,0]) dewalt_you(xwidth);
        rotate([180,0,0]) translate([xwidth+15,125-1,-48+1.8]) Ushape(5,(xwidth+10+2)/2,40);
        rotate([180,0,0]) translate([xwidth+15,125-1,1]) Ushape(5,(xwidth+10+2)/2,40);
}

module dewalt_base(xwidth)
{
    rotate([90,0,0]) translate([0,-5,0])gearmount(xwidth+20);
    rotate([90,0,0]) translate([15-5,-5,15+4.5]) cube([90,xwidth+20,18]);
}

module dewalt_lower(xwidth)
{
    difference(){
          dewalt_base(xwidth);
          translate([2,-5-1,0]) scale([1.02,1.02,1.02]) dewalt_upper(xwidth);
      }
}

module dewalt_holder(xwidth)
{   
      dewalt_lower(xwidth);
      %translate([2,-5-1,0]) dewalt_upper(xwidth);
      rotate([-90,0,0]) translate([120,20,-50]) dewalt_upper(xwidth);
      
}
module sander_holder()
{
    xwidth = 27.5;
    rotate([90,0,0]) gearmount(xwidth);
    rotate([90,0,0]) translate([0,0,90]) battery_stud(xwidth);
    rotate([90,0,0]) translate([0,0,0]) brace(xwidth);
    %rotate([90,0,0]) translate([-1,0,0]) battery_plate(xwidth);
    rotate([0,90,0]) translate([-20,40,-50]) battery_plate(xwidth);
}

module saw_holder()
{
    xwidth = 27.5;
    rotate([90,180,0]) translate([-100,0-xwidth,0]) gearmount(xwidth);
    difference(){
       rotate([90,0,-90]) translate([10+30,0,-50]) battery_stud(xwidth);
       rotate([90,0,0]) translate([12+75,-1,18.25+30]) cube([35,xwidth+2,6.5]);
       }
    rotate([90,0,0]) translate([12,0,19.25]) cube([75,xwidth,6+30]);
    //rotate([90,0,0]) translate([0,0,0]) brace(xwidth);
    %rotate([90,0,-90]) translate([10+30,0-(xwidth/2)+16,-140]) battery_plate(xwidth);
    rotate([0,90,0]) translate([-20,40,-50]) battery_plate(xwidth);
}

module dewalt_charger_holder()
{
    xwidth = 27.4;
    rotate([90,0,0]) gearmount(xwidth);
    difference(){
      rotate([90,0,4]) translate([7-50,0,23]) cube([125,xwidth,20]);
      rotate([90,0,4]) translate([60,xwidth/2,41]) cylinder(r=12,h=3);
      rotate([90,0,4]) translate([60,xwidth/2,19]) cylinder(r=1.65,h=30);
      }
}

module milwaukee_charger_holder()
{
    xwidth = 27.4;
    rotate([90,0,0]) gearmount(xwidth);
    difference(){
      rotate([90,0,4]) translate([7-75,0,23]) cube([150,xwidth,20]);
      rotate([90,0,4]) translate([60,xwidth/2,41]) cylinder(r=12,h=3);
      rotate([90,0,4]) translate([60,xwidth/2,19]) cylinder(r=1.65,h=30);
      rotate([90,0,4]) translate([60-103.5,xwidth/2,41]) cylinder(r=12,h=3);  
      rotate([90,0,4]) translate([60-103.5,xwidth/2,19]) cylinder(r=1.65,h=60);
      rotate([0,0,0])  translate([72,-30+3,-5]) cylinder(r=6*1.02,h=50);  
      rotate([0,0,0])  translate([8,-34.5+3,-5]) cylinder(r=6*1.02,h=50);  
      rotate([0,0,0])  translate([-54,-38.5+3,-5]) cylinder(r=6*1.02,h=50);   
      }
}

module milwaukee_charger_rod()
{
    
    cylinder(r=6,h=150);
}

module kobalt_charger_holder()
{
    xwidth = 27.4;
    rotate([90,0,0]) gearmount(xwidth);
    difference(){
      rotate([90,0,4]) translate([7-85,0,23]) cube([160,xwidth,20]);
      rotate([90,0,4]) translate([60,xwidth/2,41]) cylinder(r=12,h=3);
      rotate([90,0,4]) translate([60,xwidth/2,19]) cylinder(r=1.65,h=30);
      rotate([90,0,4]) translate([60-113.5,xwidth/2,41]) cylinder(r=12,h=3);  
      rotate([90,0,4]) translate([60-113.5,xwidth/2,19]) cylinder(r=1.65,h=60);
      rotate([0,0,0])  translate([72,-30+3,-5]) cylinder(r=6*1.02,h=50);  
      rotate([0,0,0])  translate([8-8,-34.5+3,-5]) cylinder(r=6*1.02,h=50);  
      rotate([0,0,0])  translate([-62,-38.5+3,-5]) cylinder(r=6*1.02,h=50);   
      }
}

//battery_stud(27.4);
//saw_holder();
//sander_holder();
//dewalt_holder(35);
//dewalt_lower(35);
//gearmount(15.7);
//dewalt_charger_holder();
//milwaukee_charger_holder();
//milwaukee_charger_rod();
//kobalt_charger_holder();
