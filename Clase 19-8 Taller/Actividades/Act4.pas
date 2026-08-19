Program Act4;

type
  Vector = array [1..50] of integer;


procedure CargarVector (max, min: integer; var dimL: integer;var v: vector);
var
  num: integer;
begin
  dimL:= 0;
  num:= random(max-min) + min;
  while (num <> max) do begin
    dimL:= dimL + 1;
    v[dimL]:= num;
    writeln(num);
  end;
end;

var
  v: vector;
  dL: integer;
  a, b: integer;
begin
  randomize;
  read(a);
  read(b);
  CargarVector(b, a, dL, v);
end.
  
  
