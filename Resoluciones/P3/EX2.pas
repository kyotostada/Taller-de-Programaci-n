program EX2;
const
  fin = 0;
  min = 1;
  max = 100;
type
  rangocodigo = 1..100;
  rangodia = 1..31;
  rangomes = 1..12;
  
  
  fecha = record
    dia: rangodia;
    mes: rangomes;
    anio: integer;
  end;

// ÁRBOL 1
  venta = record
    codigo: integer;
    fec: fecha;
    cantVentas: integer; 
  end;


  arbol1 = ^nodoVenta;

  nodoVenta = record
    elem: venta;
    HI: arbol1;
    HD: arbol1
  end;

// ÁRBOL 2
  producto = record
    code: integer;
    totalVentas: integer;
  end;

  arbolProducto = ^nodoProducto;

  nodoProducto = record
    elem: producto;
    HI: arbolProducto;
    HD: arbolProducto;
  end;

// LISTA
  vental = record
    fec : fecha;
    cant: integer;
  end;

  lista = ^nodoLista;

  nodoLista = record
    elem: vental;
    sig: lista;
  end;

// ÁRBOL 3

  venta2 = record
    code: integer;
    lis: lista;
  end;

  arbolProductoVentas = ^nodoProductoVentas;

  nodoProductoVentas = record
    elem: venta2;
    hi: arbolProductoVentas;
    hd: arbolProductoVentas;
  end;

procedure generarDatos (var V1: venta; var P: producto; var v2: venta2; var vl: vental);
begin
  // Venta Árbol 1
  v1.codigo:= random(101);
  if (v1.codigo <> fin) then
    v1.fec.dia:= random (30) + 1;
    v1.fec.mes:= random(12) + 1;
    v1.fec.anio:= random (2026-2000) + 2000;
    v1.cantVentas:= random(1001)+1;
  // Producto Árbol 2
  p.code:= v1.codigo;
  p.totalVentas:= v1.cantVentas;
  // Venta Árbol 3
  v2.code:= v1.codigo;
  // Venta lista
  vl.fec:= v1.fec;
  vl.cant:= v1.cantVentas;
end;


procedure generarArboles (var AV: arbol1; var AP: arbolProducto; var APV: arbolProductoVentas; var V1: venta; var P: producto; var v2: venta2);

  Procedure cargarArbol1 (var a: arbol1; v: venta);
  Begin
    if (a = nil) 
    then begin
           new(a);
           av^.elem:= v; 
           av^.HI:= nil; 
           av^.HD:= nil;
         end
    else if (v.codigo < av^.elem.codigo) 
         then cargarArbol1(av^.HI, v)
         else cargarArbol1(av^.HD, v); 
  End;
  
  Procedure cargarArbol2 (var a: arbolProducto; p: producto);
  Begin
    if (a = nil) then begin
      new(a);
      a^.elem:= p; 
      a^.HI:= nil; 
      a^.HD:= nil;
    end
    else
      if (a^.elem.code = p.code) then
        a^.elem.totalVentas := a^.elem.totalVentas + p.totalVentas
      else
        if (p.code < a^.elem.code) 
          then cargarArbol2(a^.HI, p)
          else cargarArbol2(a^.HD, p); 
      end;

  Procedure cargarLista (var l: lista; vl: vental);
  var
    nue: lista;
  begin
    new(nue);
    nue^.elem:= vl;
    nue^.sig:= l;
    l:= nue;
  end;

  Procedure cargarArbol3 (var a: arbolProductoVentas; v: venta2; vl: vental);
  begin
    if (a = nil) then begin
      new(a);
      a^.elem.lis := nil;
      cargarLista(a^.elem.lis, vl);
      a^.elem.code:= v.code;
      a^.hi:= nil;
      a^.hd:= nil;
    end
    else
      if (v.code = a^.elem.code) then
        cargarLista(a^.elem.lis, vl)
      else
        if (v.code < a^.elem.code) then
          cargarArbol3(a^.HI, v, vl)
        else
            cargarArbol3(a^.HD, v, vl);
      end;

var
  vl: vental;
begin
  av:= nil;
  ap:= nil;
  apv:= nil;
  generarDatos(v1, p, v2, vl);
  while (v1.codigo <> fin) do begin
    cargarArbol1(av, v1);
    cargarArbol2(ap, p);
    cargarArbol3(apv, v2, vl);
    generarDatos(v1,p,v2,vl);
  end;
end;

procedure CantidadFecha (a: arbol1; f: fecha; var cant: integer);
begin
  if (a <> nil) then begin
    if (a^.elem.fec.dia = f.dia) and (a^.elem.fec.mes = f.mes) and (a^.elem.fec.anio = f.anio) then
      cant:= cant + a^.elem.cantVentas
    else begin
      CantidadFecha(a^.hi, f,cant);
      CantidadFecha(a^.hd, f,cant);
    end;
  end;
end;

procedure MaxUnidades (AV: arbolProducto; var max, maxcode: integer);
begin
  if (av <> nil) then begin
    if (av^.elem.totalVentas > max) then begin
      max:= av^.elem.totalVentas;
      maxcode:= av^.elem.code
    end
    else begin
      MaxUnidades(av^.hi, max, maxcode);
      MaxUnidades(av^.hd, max, maxcode);
    end;
  end;
end;


procedure recorrerlista (l: lista; var aux: integer);
begin
  aux:= 0;
  while (l <> nil) do begin
    aux := aux + 1;
    l:= l^.sig;
  end;
end;


procedure MaxVentas (APV: arbolProductoVentas; var max, maxcode: integer);
var
  aux: integer;
begin
  if (apv <> nil) then
    recorrerlista (apv^.elem.lis, aux);
    if aux > max then begin
      max:= aux;
      maxcode:= apv^.elem.code;
    end;
    MaxVentas (apv^.hi, max,maxcode);
    MaxVentas  (apv^.hd, max,maxcode);
end;


procedure leerFecha(var f: fecha);
begin
  read(f.dia);
  read(f.mes);
  read(f.anio);
end;
var
  arbolV: arbol1;
  arbolP: arbolProducto;
  arbolPV: arbolProductoVentas;
  v1: venta;
  v2: venta2;
  p: producto;
  f: fecha;
  CantFecha: integer;
  maxcode, maxven: integer;
  maxcant: integer;
  maxcantVen: integer;
begin
  maxcant:= -1;
  maxcantVen:= -1;
  randomize;
  generarArboles (arbolV, arbolP, arbolPV, v1, p, v2);
  writeln('Ingrese una fecha:');
  leerFecha(f);
  CantidadFecha(arbolV, f, cantFecha);
  writeln('La cantidad de ventas en la fecha es de:', cantfecha);
  MaxUnidades(arbolP, maxcant, maxcode);
  writeln('El código de producto con mayor cantidad de unidades vendidas es:', maxcant);
  MaxVentas(arbolPV, maxcantVen, maxven);
  writeln('El código de producto con mayor cantidad de ventas es:', maxven)
end.
