program EX3;
const
  fin = -1;
type
  RangoGeneros = 1..8;
  
  peli = record
    code: integer;
    gen: rangogeneros;
    puntaje: real;
  end;
  
  
  
  
  lista = ^nodo;
  
  nodo = record
    elem: pelimax;
    sig: lista;
  end;
  
  pelimax = record
    puntaje: real;
    code: integer;
    pri: lista;
    ult: lista;
  end;
  
  VecGen = array [rangogeneros] of pelimax;

procedure inicializarVector(var v: VecGen);
var
  i: integer;
begin
  for i:= 1 to 8 do begin
    v[i].pri:= nil;
    v[i].ult:= nil;
  end;
end;

procedure agregarAtras (var pun: lista; p: película);
var
  nue: lista;
begin
  new(nue);
  nue^.elem:= p;
  nue^.sig:= nil;
  if (pun.pri = nil) then begin
    pun.pri:= nue;
    pun.ult:= nue
  end;
  else begin
    pun.ult^.sig:= nue;
    pun.ult:= nue;
  end;
end;

procedure leerPeli(var p: peli);
begin
  read(p.code);
  if (p.code <> fin) then begin
    read(p.gen);
    read(p.puntaje);
  end;
end;

procedure cargarLista(var v: vecgen);
var
  p: peli;
begin
  leerPeli(p);
  if (p.code <> fin) then begin
    agregarAtras(v[p.code], p);
    leerPeli(p);
  end;
end;

procedure MaxPeli (var maxcode: integer; var maxpun: real; p: real; c: integer);
begin
  if (p > maxpun) then begin
    maxcode:= c;
    maxpun:= p;
  end;
end;




procedure cargarVector (var v: vecgen; l: lista);
var
  genactual: rangogeneros;
  maxcode: integer;
  maxpun: real;
begin
  while (l <> nil) do begin
    genactual:= l^.elem.gen;
    maxcode:= -1;
    maxpun:= -1;
    while (l <> nil) and (l^.elem.gen = genactual) do begin
      MaxPeli(maxcode, maxpun, l^.elem.puntaje, l^.elem.code);
      l:= l^.sig;
    end;
    v[genactual].puntaje:= maxpun;
    v[genactual].code:= maxcode;
  end;
end;
    
procedure OrdenarVector(var v: vecgen);
var
  i, j, pos: integer;
  item: pelimax;
begin
 for i:= 1 to (8 - 1) do 
 begin
   pos := i;
   for j := i+1 to 8 do 
        if (v[j].code < v[pos].code) then 
          pos:=j;
   item := v[pos];   
   v[pos] := v[i];   
   v[i] := item;
 end;
end; 

procedure MaxMin(v: vecgen);
var
  maxcode, mincode, i: integer;
  minpun, maxpun: real;
begin
  minpun:= 99999;
  maxpun:= -1;
  for i:= 1 to 8 do begin
    if v[i].puntaje > maxpun then begin
      maxpun:= v[i].puntaje;
      maxcode:= i;
    end;
    if v[i].puntaje < minpun then begin
      minpun:= v[i].puntaje;
      mincode:= i;
    end;
  end;
  writeln('La película con mayor puntaje tiene de código:', maxcode, 'y obtuvo una nota de:', maxpun);
  writeln('La película con menor puntaje tiene de código:', mincode, 'y obtuvo una nota de:', minpun);
end;

var
  l: lista;
  v: VecGen;
begin
  l:= nil;
  inicializarVector(v);
  cargarLista(l);
  cargarVector(v, l);
  OrdenarVector(v);
  MaxMin(v);
end.