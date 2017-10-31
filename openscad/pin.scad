// This module outputs bended pin
// _L - whole pin length
// _l - length of bottom part
// _H - whole pin height
// _th - pin thickness
// _a - bending angle
// _W - pin width
module pin(_L,_l,_H,_th,_a,_W)
{
	// Internal variables
    _d1 = _th*sin(_a) / (1-cos(_a));
    _d2 = (_th-_H)*cos(_a) / sin(_a);

	rotate([90,0,90])
    // Extrude the following polygon
	linear_extrude(height = _W, center = true, convexity = 10, twist = 0)
        polygon([[0,0],
                 [_l,0],
				 [_l+_d2,_H-_th],
				 [_L,_H-_th],
				 [_L,_H],
				 [_l+_d2-_d1,_H],
				 [_l-_d1,_th],
				 [0,_th]]);
}

module pin_th(_th, _L, _l,_W,_w)
{
    // Extrude the following polygon
	linear_extrude(height = _th, center = true, convexity = 10, twist = 0)
        polygon([[_w/2,0],
                 [_w/2,_l],
				 [_W/2,_l+(_W-_w)/2],
				 [_W/2,_l+_L],
				 [-_W/2,_l+_L],
				 [-_W/2,_l+(_W-_w)/2],
				 [-_w/2,_l],
				 [-_w/2,0]]);
}
