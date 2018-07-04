unit tools;

interface

procedure coord_rotate(cx,cy,cz : integer); // rotate all picture when key pressed
procedure make_vf(n_elem : integer);   // make arrays with size=n_elem
procedure delete_vf(); // destroy arrays

var
  vx,vy   : array of real; // dinamic vectors for function coordinates
  v_size  : integer=0;     // size of arrays vx,vy,vz
  need_rotate : integer=0; // if not 0 need call rotate function
  r_axis  : integer=3;     // rotate around axis: 0 - x; 1 - y; 2 - z
  r_angle : integer=32;    // every step function rotate on PI/r_angle
  surface_type : integer=0;// type of drawing method, see dialog.pas

implementation
uses GLunit, OpenGL;
//------------------------------------------------------------------------------
procedure coord_rotate(cx,cy,cz : integer);
begin
glRotated(1,cx,cy,cz);
start_draw();
end;
//------------------------------------------------------------------------------
procedure make_vf(n_elem : integer);
begin SetLength(vx,n_elem); SetLength(vy,n_elem); end;
//------------------------------------------------------------------------------
procedure delete_vf(); begin vx:=nil; vy:=nil; end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------

end.
