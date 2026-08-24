program EX2;
Const
  dimF = 300;
  fin = -1;
type
  oficina = record
    code: integer;
    dni: integer;
    valor: real;
  end;

  vector = array [1..dimF] of oficina;

procedure leerOficina (var o: oficina);
begin
  read(o.code);
  if (o.code <> fin) then begin
    read(o.dni);
    read(o.valor);
  end;
end;

procedure cargarVector (var v: vector; var dimL: integer);
var
  o: oficina;
begin
  dimL:= 0;
  leerOficina(o);
  while (o.code <> fin) do begin
    dimL:= dimL + 1;
    v[dimL]:= o;
    leerOficina(o);
  end;
end;

procedure ordenarVector(var v: vector; dimL: integer);
var
  i, j, pos: integer;
  item: oficina;
begin
 for i:= 1 to (dimL - 1) do 
 begin
   pos := i;
   for j := i+1 to dimL do 
        if (v[j].code < v[pos].code) then 
          pos:=j;
   item := v[pos];   
   v[pos] := v[i];   
   v[i] := item;
 end;
end;
var
  v: vector;
  dimL: integer;
begin
  cargarVector(v, dimL);
  ordenarVector(v, dimL);
end.
      
