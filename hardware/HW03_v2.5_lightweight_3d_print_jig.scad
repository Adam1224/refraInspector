// RefraInspector HW-03 v2.5 LIGHTWEIGHT PROTOTYPE — rotated top labels — underside relief pockets with ribs; bottom opening, numbered scales, two M6 side holes
// Prototype in mm. Inner PL opening: no corner-pod overhangs. Bottom OPEN.
// Four ArUco DICT_4X4_50 marker CENTRES in displayed XY:
// ID0=(0,300), ID1=(300,300), ID2=(0,0), ID3=(300,0). Print/apply real markers separately.
// Reference surface plane: z=face_z, marker paper surface and PL unworn
// top face must be COPLANAR. Measure shim heights for each PL model.
// Ruler origin convention based on HW-02: lower-right BLACK corner of ID0
// at (15,15). No '0' label, 1 mm ticks and numbered 10 mm ticks.
// Parts: assembly, pod, top_rail, left_rail, right_rail, shim, splice.
part="assembly";
spacing=300;
marker=30;
pod_size=60;
rail_width=34; // flat top scale surface (width includes wall body)
face_z=32; // adjustable side-contact height; not PL universal thickness
engrave_depth=0.45;
scale_inset=2.5;
short_tick=2.2;
medium_tick=4;
long_tick=6.2;
show_scale=true;
show_labels=true;
label_font_size=4.2;
top_label_font_size=3.8; // top rail labels rotated 90 degrees to avoid horizontal overlaps // embossed/engraved numerals every 10 mm
lock_hole_d=6.6; // M6 clearance, verify after printing
lock_hole_positions=[90,210]; // measured from top marker-center line
lock_hole_z=16; // centre height from base plane, adjust to PL side
show_lock_holes=true;
show_reference_markers=true; // preview only: black squares, not ArUco codes
segment_length=(spacing-pod_size)/2; // two 120 mm segments per side
// Weight relief, underside ONLY. Keeps full 10 mm upper skin for scales,
// 7 mm side walls, 8 mm minimum end blocks and a 36 mm central solid web.
lightweight=true;
pocket_width=20;       // across 34 mm rail (7 mm walls)
pocket_length=34;      // axial pocket length
pocket_offset=35;      // pockets at +/-35 mm from rail segment centre
pocket_depth=22;       // recess from z=0; 10 mm roof stays
// Each lock bore is on the CENTER of a right segment's solid web.

$fn=32;

// Internal axes: x right, y increases toward the open end. The final display
// mirrors the internal y axis so the opening is at the BOTTOM in OpenSCAD.
// common top face z=face_z; all prints stand on z=0.
module marker_patch(){
  // marker region is only an outline groove: apply printed actual code on top.
  translate([0,0,face_z-0.22]) difference(){
    cube([marker+0.7,marker+0.7,0.44],center=true);
    cube([marker-0.7,marker-0.7,0.52],center=true);
  }
}
module corner_pod(side="left", row="top"){
 // Clip each marker pod to the PL-contact outline.
 // Top: remove inside quadrant; bottom: remove all inward extension.
 difference(){
   translate([0,0,face_z/2])cube([pod_size,pod_size,face_z],center=true);
   marker_patch();
   // Inner opening: left x >= +rail_width/2, right x <= -rail_width/2.
   // For TOP pods, clip only beneath top contact edge (local y > +17).
   // For BOTTOM pods, open edge starts at y=300; remove full inner overhang.
   inner_sign=(side=="left")?1:-1;
   if(row=="top"){
      translate([inner_sign*(rail_width/2+pod_size/2),rail_width/2+pod_size/2,face_z/2])
        cube([pod_size,pod_size,face_z+1],center=true);
   }else{
      translate([inner_sign*(rail_width/2+pod_size/2),0,face_z/2])
        cube([pod_size,pod_size+2,face_z+1],center=true);
   }
   // Retain only screw bores that remain in the clipped material.
   for(x=[-24,24],y=[-24,24])
     if((row=="top" && !((side=="left" && x>0 || side=="right" && x<0) && y>0)) ||
        (row=="bottom" && (side=="left" ? x<0 : x>0)))
       translate([x,y,face_z/2])cylinder(d=3.4,h=face_z+1,center=true);
 }
}
module straight_rail(){
 difference(){
  translate([0,0,face_z/2]) cube([segment_length,rail_width,face_z],center=true);
  if(lightweight) for(dx=[-pocket_offset,pocket_offset])
    translate([dx,0,pocket_depth/2-0.01])
      cube([pocket_length,pocket_width,pocket_depth+0.02],center=true);
 }
}
// 1 mm tick marks, 5 mm intermediate, 10 mm numeric labels.
// Coordinates measured from ID0 marker lower-right black corner (15,15).
// Top side is y=0: marks positioned just inside upper rail at y=+rail_width/2.
// Left side is x=0, marks positioned near inner (right) edge x=+rail_width/2.
// Right side x=300: marks positioned near inner (left) edge x=300-rail_width/2.
// keep labels within the 60 mm pods' non-marker space and span the central rails.
module top_ruler(){
 for(mm=[15:1:255]){
  x=15+mm;
  len=(mm%10==0)?long_tick:((mm%5==0)?medium_tick:short_tick);
  translate([x,rail_width/2-scale_inset-len/2,face_z-engrave_depth/2])
    cube([0.65,len,engrave_depth+0.02],center=true);
  if(show_labels && mm%10==0)
   translate([x,rail_width/2-scale_inset-long_tick-4.0,face_z-engrave_depth])
     linear_extrude(engrave_depth+0.02) rotate([0,0,90]) text(str(mm),size=top_label_font_size,halign="center",valign="center",font="Liberation Sans:style=Bold");
 }
}
module vertical_ruler(side="left"){
 x=(side=="left")?rail_width/2-scale_inset:spacing-rail_width/2+scale_inset;
 sign=(side=="left")?-1:1;
 for(mm=[15:1:255]){
  y=15+mm;
  len=(mm%10==0)?long_tick:((mm%5==0)?medium_tick:short_tick);
  translate([x+sign*len/2,y,face_z-engrave_depth/2])
    cube([len,0.65,engrave_depth+0.02],center=true);
  if(show_labels && mm%10==0)
    translate([x+sign*(long_tick+1),y,face_z-engrave_depth])
      linear_extrude(engrave_depth+0.02)
       mirror([0,1,0]) text(str(mm),size=label_font_size,halign=(side=="left"?"right":"left"),valign="center",font="Liberation Sans:style=Bold");
 }
}
// Incise scale only on respective flat surfaces (no additive features in camera plane).
// Per-segment engraving avoids a huge full-frame CSG difference.
module segmented_top(cx){
 difference(){translate([cx,0])straight_rail();
  if(show_scale)for(mm=[15:255]){
   x=15+mm;
   if(abs(x-cx)<segment_length/2-0.6){
    len=(mm%10==0)?long_tick:((mm%5==0)?medium_tick:short_tick);
    translate([x,rail_width/2-scale_inset-len/2,face_z-engrave_depth/2])
      cube([0.65,len,engrave_depth+0.03],center=true);
    if(show_labels && mm%10==0)
      translate([x,rail_width/2-scale_inset-long_tick-4.0,face_z-engrave_depth])
        linear_extrude(engrave_depth+0.03)
          rotate([0,0,90]) text(str(mm),size=top_label_font_size,halign="center",valign="center");
   }
  }
 }
}
module segmented_side(cy,side="left"){
 cx=(side=="left")?0:spacing;
 x=(side=="left")?rail_width/2-scale_inset:spacing-rail_width/2+scale_inset;
 sign=(side=="left")?-1:1;
 difference(){translate([cx,cy])rotate([0,0,90])straight_rail();
  // Right-side M6 transverse bolt bores; axis along X (normal to PL side).
  // The two holes lie on separate rail segments and avoid all four marker pods.
  if(side=="right" && show_lock_holes)
    for(hy=lock_hole_positions)
      if(abs(hy-cy)<segment_length/2-8)
        translate([cx,hy,lock_hole_z]) rotate([0,90,0])
          cylinder(d=lock_hole_d,h=rail_width+2,center=true,$fn=64);
  if(show_scale)for(mm=[15:255]){
   y=15+mm;
   if(abs(y-cy)<segment_length/2-0.6){
    len=(mm%10==0)?long_tick:((mm%5==0)?medium_tick:short_tick);
    translate([x+sign*len/2,y,face_z-engrave_depth/2])
      cube([len,0.65,engrave_depth+0.03],center=true);
    if(show_labels && mm%10==0)
      translate([x+sign*(long_tick+1),y,face_z-engrave_depth])
        linear_extrude(engrave_depth+0.03)
          mirror([0,1,0]) text(str(mm),size=label_font_size,halign=(side=="left"?"right":"left"),valign="center");
   }
  }
 }
}
module assembly(){
  for(x=[0,spacing],y=[0,spacing])
    translate([x,y])corner_pod(x==0?"left":"right",y==0?"top":"bottom");
  for(cx=[pod_size/2+segment_length/2,spacing-pod_size/2-segment_length/2])segmented_top(cx);
  for(cy=[pod_size/2+segment_length/2,spacing-pod_size/2-segment_length/2]){
    segmented_side(cy,"left");segmented_side(cy,"right");
  }
  if(show_reference_markers){
    color("#141414")for(x=[0,spacing],y=[0,spacing])
      translate([x,y,face_z+0.025])cube([marker,marker,.05],center=true);
  }
}
module single_rail(axis="top"){
 // A modular rail piece; top-side scale requires assembly origin, thus
 // manufacture marking is done AFTER assembly or use assembly-scale cutouts.
 straight_rail();
}
module splice(){
 difference(){translate([0,0,2])cube([46,24,4],center=true);
 for(x=[-15,15])translate([x,0,2])cylinder(d=3.4,h=5,center=true);
 }
}
module shim(){translate([0,0,1])cube([60,60,2],center=true);}
if(part=="assembly") translate([0,spacing,0]) mirror([0,1,0]) assembly();
else if(part=="pod")corner_pod("left","top");
else if(part=="top_rail"||part=="left_rail")single_rail();
else if(part=="right_rail")difference(){straight_rail();translate([0,0,lock_hole_z])rotate([0,90,0])cylinder(d=lock_hole_d,h=rail_width+2,center=true,$fn=64);}
else if(part=="splice")splice();
else if(part=="shim")shim();
