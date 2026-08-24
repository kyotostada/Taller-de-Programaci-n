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
  
  
  Vec3 = array [1..dimF] of producto;

procedure leerProducto (var p: producto);
begin
  read(p.code);
  if (p.code <> fin) then begin
    read(p.rubro);
    read(p.precio);
  end;
end;

procedure insertarOrdenado(var l: lista; p: producto);
var
  act, ant, nue: lista;
begin
  new (nue); 
  nue^.elem := p; 
  act := L; 
  ant := L; 
  while (act <> nil) and (p.rubro > act^.elem.rubro) do begin 
  begin
    ant := act;
    act:= act^.sig;
  end;
  if (act = ant) then 
    L:= nue
  else 
    ant^.sig:= nue;
  nue^.sig:= act; 
  end;
end;

procedure cargarLista (var l: lista);
var
  p: producto;
begin
  leerProducto(p);
  while (p.code <> fin) do begin
    insertarOrdenado(l, p);
    leerProducto(p);
  end;
end;

procedure imprimirLista (l: lista);
begin
  while (l <> nil) do begin
    writeln('Código de producto:', l^.elem.code);
    writeln('Rubro:', l^.elem.rubro);
    writeln('Precio:', l^.elem.precio);
    l:= l^.sig;
  end;
end;

procedure cargarVector (l: lista; var v: vec3;  var dimL: integer);
begin
  dimL:= 0;
  while (l <> nil) and (l^.elem.rubro < rubrodeseado) do begin
    l:= l^.sig;
  while (l <> nil) and (l^.elem.rubro = rubrodeseado) do begin
    if (dimL < dimF) then begin
      dimL:= dimL + 1;
      v[dimL]:= l^.elem;
      l:= l^.sig;
    end;
  end;
end;
end;
procedure OrdenarVector (var v: vec3; dimL: integer);
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

procedure ImprimirVector(v: vec3; dimL: integer);
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
  l: lista;
  v: vec3;
  dimL: integer;
begin
  l:= nil;
  cargarLista(l);
  imprimirLista(l);
  cargarVector(l, v, dimL);
  OrdenarVector(v, dimL);
  ImprimirVector(v, dimL);
  writeln('El promedio de los precios de los productos del rubro 3 es:', Promedio(v, dimL));
end.
  
