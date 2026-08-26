program EX4;

const
  fin = -1;
  dimF= 20;
  rubrodeseado = 3;
type
  rangorubro = 1..6;

  producto = record
    code: integer;
    rubro: rangorubro;
    precio: real;
  end;
  
  lista = ^nodo;
  
  
  nodo = record
    elem: producto;
    sig: lista;
  end;
  
  punteros = record
    pri: lista;
    ult: lista;
  end;
  
  Vector = array [1..dimF] of punteros;
  Vec3 = array [1..dimF] of producto;

procedure cargarVector(var v: vector);
	
	procedure inicializarVector (var v: vector);
  var
    i: integer;
  begin
    for i:= 1 to 6 do begin
      v[i].pri:= nil;
      v[i].ult:= nil;
    end;
  end;
	
	
	
	procedure leerProducto (var p: producto);
	begin
	  read(p.code);
	  if (p.code <> fin) then begin
		read(p.rubro);
		read(p.precio);
	  end;
	end;

	procedure insertarOrdenado(var pun: lista; p: producto);
	var
	  act, ant, nue: lista;
	begin
	  new (nue); 
	  nue^.elem := p; 
	  act := pun; 
	  ant := pun; 
	  while (act <> nil) and (p.rubro > act^.elem.rubro) do begin 
	  begin
		ant := act;
		act:= act^.sig;
	  end;
	  if (act = ant) then 
		pun:= nue
	  else 
		ant^.sig:= nue;
	  nue^.sig:= act; 
	  end;
	end;

var
  p: producto;
begin
  leerProducto(p);
  while (p.code <> fin) do begin
    insertarOrdenado(v[p.rubro].pri, p);
    leerProducto(p);
  end;
end;

procedure imprimirLista (v: vector);
var
  i: integer;
begin
  for i:= 1 to 6 do begin
    while (v[i].pri <> nil) do begin
      writeln('Código de producto:', v[i].pri^.elem.code);
      v[i].pri:= v[i].pri^.sig;
  end;
end;
end;

procedure cargarVector3 (v: vector; var v3: vec3;  var dimL: integer);
begin
  dimL:= 0;
  while (v[rubrodeseado].pri <> nil) do begin
    if (dimL < dimF) then begin
      dimL:= dimL + 1;
      v3[dimL]:= v[3].pri^.elem;
      v[rubrodeseado].pri:= v[rubrodeseado].pri^.sig
    end;
  end;
end;
procedure OrdenarVector3 (var v: vec3; dimL: integer);
var
  i, j, pos: integer;
  item: producto;
begin
 for i:= 1 to (dimL - 1) do 
 begin
   pos := i;
   for j := i+1 to dimL do 
        if (v[j].code < v[pos].precio) then 
          pos:=j;
   item := v[pos];   
   v[pos] := v[i];   
   v[i] := item;
 end;
end;

procedure ImprimirVector3(v: vec3; dimL: integer);
var
  i: integer;
begin
  for i:= 1 to dimL do begin
    writeln('Código de producto:', v[i].code);
    writeln('Rubro:', v[i].rubro);
    writeln('Precio:', v[i].precio);
  end;
end;

function Promedio(v: vec3; dimL: integer): real;
var
  i: integer;
  sumatotal: real;
begin
  sumatotal:= 0;
  for i:= 1 to dimL do begin
    sumatotal:= sumatotal + v[i].precio;
  end;
  
  Promedio:= sumatotal / dimL;
end;
    
var
  v: vector;
  v3: vec3;
  dimL: integer;
begin
  cargarVector(v);
  imprimirLista(v);
  cargarVector3(v, v3, dimL);
  OrdenarVector3(v3, dimL);
  ImprimirVector3(v3, dimL);
  writeln('El promedio de los precios de los productos del rubro 3 es:', Promedio(v3, dimL));
end.
  
