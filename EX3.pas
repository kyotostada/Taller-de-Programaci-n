program EX3;

const
  fin = -1 
type
  rangogen = 1..8;
  
  peli = record
    code: integer;
    gen: rangogen;
    puntaje: real;
    
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
  
  procedure agregarAtras (var pri, ult: lista; p: pelicula);
  var
    nue: lista;
  begin
    new(nue);
    nue^.elem:= p;
    nue^.sig:= nil;
    if (pri = nil) then begin
      pri:= nue;
      ult:= nue;
    end;
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

procedure cargarVectorMaximos (var vMax: VectorMax; v: vector);
  
  procedure MaxPuntaje(l: lista; var maxcode: integer; var max: real);
  begin
    max:= -1
    while (l <> nil) do begin
      if (l^.elem.puntaje > max) then begin
        max:= l^.elem.puntaje
        maxcode:= l^.elem.code
      l:= l^.sig;
    end;
    ´        
            
var
  i: integer;
  maxcode: integer;
  max: real;
begin
  for i:= 1 to 8 do begin
     MaxPuntaje(v[i].pri);
     vMax[i].puntaje:= max;
     vMax[i].codigo:= maxcode;
  end;
end;

// FALTA ORDENAR E IMPRIMIR

       
procedure  
var
  v: vector;
  vMax: vectorMax;
begin
  cargarVector(v);
  cargarVectorMaximos(vMax, v);
  OrdenarVectorMaximos(vMax);
  MostrarMaxMin(vMax);
end;
  
  
  
   
