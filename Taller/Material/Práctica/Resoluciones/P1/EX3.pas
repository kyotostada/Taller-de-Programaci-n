program EX3;

const
  fin = -1;
type
  rangogen = 1..8;
  
  peli = record
    code: integer;
    gen: rangogen;
    puntaje: real;
  end;
    
  lista = ^nodo;
  
  nodo = record
    elem: peli;
    sig: lista;
  end;
  
  punteros = record
    pri: lista;
    ult: lista;
  end;
  
  pelimax = record
    code: integer;
    puntaje: real;
  end;
  
  vector = array [rangogen] of punteros;
  vecmax = array [rangogen] of pelimax;

procedure cargarVector (var v: vector);
  
  procedure leerPeli (var p: peli);
  begin
    read(p.code);
    if (p.code <> fin) then begin
      read(p.gen);
      read(p.puntaje);
    end;
  end;
  
  procedure inicializarVector (var v: vector);
  var
    i: integer;
  begin
    for i:= 1 to 8 do begin
      v[i].pri:= nil;
      v[i].ult:= nil;
    end;
  end;
  
  procedure agregarAtras (var pri, ult: lista; p: peli);
  var
    nue: lista;
  begin
    new(nue);
    nue^.elem:= p;
    nue^.sig:= nil;
    if (pri = nil) then begin
      pri:= nue;
      ult:= nue;
    end
    else begin
      ult^.sig:= nue;
      ult:= nue;
    end;
  end;
  
var
p: peli;

begin
  leerPeli(p);
  while (p.code <> fin) do begin
    agregarAtras(v[p.code].pri, v[p.code].ult, p);
    leerPeli(p);
  end;
end;

procedure cargarVectorMaximos(var vMax: VecMax; v: vector);
  
  procedure MaxPuntaje(l: lista; var maxcode: integer; var max: real);
  begin
    max:= -1;
    while (l <> nil) do begin
      if (l^.elem.puntaje > max) then begin
        max:= l^.elem.puntaje;
        maxcode:= l^.elem.code;
      end;
      l:= l^.sig;
    end;
  end;                

var
  i: integer;
  maxcode: integer;
  max: real;
begin
  for i:= 1 to 8 do begin
     MaxPuntaje(v[i].pri, maxcode, max);
     vMax[i].puntaje:= max;
     vMax[i].code:= maxcode;
  end;
end;

procedure ordenarVector (var vMax: vecmax);
var
  i, j, pos: integer;
  item: pelimax;
begin
 for i:= 1 to (8 - 1) do 
 begin
   pos := i;
   for j := i+1 to 8 do 
        if (vMax[j].puntaje < vMax[pos].puntaje) then 
          pos:=j;
   item := vMax[pos];   
   vMax[pos] := vMax[i];   
   vMax[i] := item;
 end;
end;

procedure MostrarMaxMin (vMax: vecmax; var maxcode,mincode: integer; var max,min: real);
var
    i: integer;
  begin
    max:= -1;
    min:= 99999;
    for i:= 1 to 8 do begin
      if (vMax[i].puntaje > max) then begin
        max:= vMax[i].puntaje;
        maxcode:= vMax[i].code;
      end;
      if (vMax[i].puntaje < min) then begin
        min:= vMax[i].puntaje;
        mincode:= vMax[i].code;
      end;
    end;
    writeln('El código de la película con mayor puntuación es:', maxcode);
    writeln('El código de la película con menor puntuación es:', mincode);
end;
var
  v: vector;
  vMax: vecMax;
  maxcode, mincode: integer;
  max,min: real;
begin
  cargarVector(v);
  cargarVectorMaximos(vMax, v);
  OrdenarVector(vMax);
  MostrarMaxMin(vMax, maxcode, mincode, max, min);
end.
  
  
  
   
