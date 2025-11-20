/// @param vbuff
/// @param xx
/// @param yy
/// @param zz
/// @param ww
/// @param hh
function vertex_set_wall_2(vbuff, xx, yy, zz, ww, hh)
{
	var hull = [
    [21,0],
    [8,2],
    [4,6],
    [1,12],
    [0,27],
    [0,54],
    [1,58],
    [2,59],
    [7,63],
    [19,70],
    [23,71],
    [49,71],
    [52,70],
    [54,69],
    [64,63],
    [69,59],
    [70,58],
    [71,54],
    [71,27],
    [70,12],
    [68,7],
    [63,2],
    [50,0]
];


    var sw = 72; // sprite width
    var sh = 72; // sprite height
    
    // Triangulate as a fan (lazy but works for convex hull)
    for (var i = 1; i < array_length(hull)-1; i++)
    {
        var p0 = hull[0];
        var p1 = hull[i];
        var p2 = hull[i+1];
        
        // convert to world positions
        var x0 = xx - ww + (p0[0] / sw) * (ww*2);
        var x1 = xx - ww + (p1[0] / sw) * (ww*2);
        var x2 = xx - ww + (p2[0] / sw) * (ww*2);

		var z0 = zz + (1 - p0[1] / sh) * hh;
		var z1 = zz + (1 - p1[1] / sh) * hh;
		var z2 = zz + (1 - p2[1] / sh) * hh;

        var y0 = yy;
        var y1 = yy;
        var y2 = yy;

        var u0 = p0[0] / sw;
        var u1 = p1[0] / sw;
        var u2 = p2[0] / sw;

        var v0 = p0[1] / sh;
        var v1 = p1[1] / sh;
        var v2 = p2[1] / sh;

        vertex_add_point(vbuff, x0, y0, z0, 0,0,-1,  u0, v0, c_white, 1);
        vertex_add_point(vbuff, x1, y1, z1, 0,0,-1,  u1, v1, c_white, 1);
        vertex_add_point(vbuff, x2, y2, z2, 0,0,-1,  u2, v2, c_white, 1);
    }
}
