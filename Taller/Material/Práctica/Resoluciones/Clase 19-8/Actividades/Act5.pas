Program Act5;

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

procedure ImprimirVector (dimL: integer; v: vector);
var
  aux: integer;
begin
  aux:= 0;
  while (aux < dimL) do begin
    aux:= aux + 1;
    if ((aux mod 2) <> 0) then
      writeln('Número', v[aux], 'Posición:', aux);
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
  ImprimirVector(dL, v);
end.
  
  
