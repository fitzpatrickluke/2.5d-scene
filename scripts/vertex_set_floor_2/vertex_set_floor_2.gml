/// @param vbuf
/// @param x0
/// @param y0
/// @param w
/// @param h
/// @param tile_size
function vertex_set_floor_2(vbuf, x0, y0, w, h, tile_size)
{
    var v = vbuf;
    var ts = tile_size;
    var cols = w div ts;
    var rows = h div ts;

    for (var yy = 0; yy < rows; yy++)
    {
        for (var xx = 0; xx < cols; xx++)
        {
            var px = x0 + xx * ts;
            var py = y0 + yy * ts;

            // first triangle
            vertex_add_point(v, px,      py,      0, 0,1,0, 0,0, c_white, 1);
            vertex_add_point(v, px,      py+ts,   0, 0,1,0, 0,1, c_white, 1);
            vertex_add_point(v, px+ts,   py+ts,   0, 0,1,0, 1,1, c_white, 1);

            // second triangle
            vertex_add_point(v, px+ts,   py+ts,   0, 0,1,0, 1,1, c_white, 1);
            vertex_add_point(v, px,      py,      0, 0,1,0, 0,0, c_white, 1);
            vertex_add_point(v, px+ts,   py,      0, 0,1,0, 1,0, c_white, 1);
        }
    }
}
