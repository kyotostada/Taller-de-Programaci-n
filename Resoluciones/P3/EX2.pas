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
    codigo: inte
    fec: fecha;
    cantVentas: integer; 
  end;


  arbol1 = ^nodoVenta

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

  arbolProducto = ^nodoProducto

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

  lista = ^nodoLista

  nodoLista = record
    elem: vental;
    sig: lista;
  end;

// ÁRBOL 3

  venta2 = record
    code: integer;
    lis: lista;
  end;

  arbolProductoVentas = ^nodoProductoVentas

  nodoProductoVentas = record
    elem: venta2;
    hi: arbolProductoVentas;
    hd: arbolProductoVentas;
  end;

procedure generarDatos (var V1: venta; var P: productoM; var v2: venta2; var vl: vental);
begin
  // Venta Árbol 1
  v1.code:= random(101);
  if (v.code <> fin) then
    v1.fec.dia:= random (30) + 1;
    v1.fec.mes:= random(12) + 1;
    v1.fec.anio:= random (2026-2000) + 2000;
    v1.cant:= random(1001);
  // Producto Árbol 2
  p.code:= v1.code
  p.totalVentas:= v1.cant;
  // Venta Árbol 3
  v2.code:= v1.code
  // Venta lista
  vl.fec:= v1.fec;
  vl.cant:= v1.cant;
end;


procedure generarArboles (var AV: arbol1; var AP: arbolProducto; var APV: arbolProductoVentas; var V1: venta; var P: productoM; var v2: venta2);

  Procedure cargarArbol1 (var a: arbol1; v: venta);
  Begin
    if (a = nil) 
    then begin
           new(a);
           a^.dato:= v; 
           a^.HI:= nil; 
           a^.HD:= nil;
         end
    else if (elem.numero < a^.elem.code) 
         then cargarArbol1(a^.HI, elem)
         else cargarArbol1(a^.HD, elem); 
  End;
  
  Procedure cargarArbol2 (var a: arbolProducto; p: producto);
  Begin
    if (a = nil) then begin
      new(a);
      a^.dato:= p; 
      a^.HI:= nil; 
      a^.HD:= nil;
    end;
    else
      if (a.code = p.code) then
        a^.dato.cant := a^.dato.cant + p.cant
    end;
      else
        if (elem.numero < a^.elem.code) 
          then cargarArbol2(a^.HI, p)
          else cargarArbol2(a^.HD, p); 
      end;
  End;

  Procedure cargarLista (var l: lista; vl: vental);
  var
    nue: lista;
  begin
    new(nue);
    nue^.elem:= v;
    nue^.sig:= l;
    l:= nue;
  end;

  Procedure cargarArbol3 (var a: arbolProductoVentas; v: venta2; vl: vental);
  begin
    if (a = nil) then
      new(a);
      a^.elem.lista := nil;
      cargarLista(a^.elem.lista, vl);
      a^.elem.code:= v.code;
      a^.hi:= nil;
      a^.hd:= nil;
    end;
    else begin
      if (v.code = a^.elem.code) then
        cargarLista(a^.elem.lista, vl);
      else begin
        if (v.code < a^.elem.code) then
          cargarArbol3((a^.HI, vl));
        else
          if (v.code > a^.elem.code) then
            cargarArbol3((a^.HD, vl));
      end;
  end;

var
  vl: vental;
begin
  a:= nil;
  av:= nil;
  apv:= nil;
  lectura(v1, p, v2, vl);
  while (v.cod <> fin) do begin
    cargarArbol1(av, v1)
    cargarArbol2(ap, p);
    cargarArbol3(apv, v2);
    generarDatos(v1,p,v2,vl);
  end;
end;

procedure CantidadFecha (a: arbol1; f: fecha; var cant);
begin
  if (a <> nil) then begin
    if (a^.elem.fec.dia = f.dia) and (a^.elem.fec.mes = f.mes) and (a^.elem.fec.año = f.anio) then
      cant:= cant + a^.elem.cant;
    else begin
      CantidadFecha(a^.hi, f,cant);
      CantidadFecha(a^.hd, f,cant);
    end;
  end;
end;

procedure MaxUnidades (AV: arbolProducto; var max, maxcode: integer);
begin
  if (av <> nil) do begin
    if (av^.elem.cant > max) then begin
      max:= av^.elem.cant
      maxcode:= av^.elem.code
    end;
    else begin
      MaxUnidades(av^.hi, max, maxcode)
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
    recorrerlista (apv^.elem.lista, aux);
    if aux > max then begin
      max:= aux
      maxcode:= apv^.elem.code
    end;
    MaxVentas (apv^.hi, max,maxcode);
    MaxVentas  (apv^.hd, max,maxcode);
var
  arbolV: arbol1;
  arbolP: arbolProducto;
  arbolPV: arbolProductoVentas;
  f: fecha;
  CantFecha: integer;
  maxcode, maxven: integer;
begin
  randomize;
  generarArboles (arbolV, arbolP, arbolPV);
  writeln('Ingrese una fecha:');
  leerFecha(f);
  CantidadFecha(arbolV, f, cant)
  writeln('La cantidad de ventas en la fecha:', f, 'es de:', cantfecha);
  MaxUnidades(arbolP, max, maxcode);
  writeln('El código de producto con mayor cantidad de unidades vendidas es:', maxuni);
  MaxVentas(arbolPV, maxven);
  writeln('El código de producto con mayor cantidad de ventas es:', maxven)
end;
