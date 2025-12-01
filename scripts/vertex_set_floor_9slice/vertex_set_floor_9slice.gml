/// @param vbuf
/// @param x0
/// @param y0
/// @param zz
/// @param w
/// @param h
/// @param tile_size
function vertex_set_floor_9slice(vbuf, x0, y0, zz, w, h, tile_size)
{
    var v  = vbuf;
    var ts = tile_size;

    var cols = w div ts;
    var rows = h div ts;

    for (var yy = 0; yy < rows; yy++)
    {
        for (var xx = 0; xx < cols; xx++)
        {
			
            var px = x0 + xx * ts;
            var py = y0 + yy * ts;

			
            // determine which of the 3×3 tile types to use
            var tx = 1; // default: center
            var ty = 1;

            if (yy == 0)          ty = 0;
            else if (yy == rows-1) ty = 2;
			
            if (xx == 0)          tx = 0;
            else if (xx == cols-1) tx = 2;

            // compute UV start and end
			var u0 = 1/3*tx;
            var v0 = 1/3*ty;
            var u1 = 1/3*tx+1/3;
            var v1 = 1/3*ty+1/3;

            // first triangle
            vertex_add_point(v, px,      py,      zz, 0,1,0,  u0,v0,  c_white, 1);
            vertex_add_point(v, px,      py+ts,   zz, 0,1,0,  u0,v1,  c_white, 1);
            vertex_add_point(v, px+ts,   py+ts,   zz, 0,1,0,  u1,v1,  c_white, 1);

            // second triangle
            vertex_add_point(v, px+ts,   py+ts,   zz, 0,1,0,  u1,v1,  c_white, 1);
            vertex_add_point(v, px,      py,      zz, 0,1,0,  u0,v0,  c_white, 1);
            vertex_add_point(v, px+ts,   py,      zz, 0,1,0,  u1,v0,  c_white, 1);
        }
    }
}
