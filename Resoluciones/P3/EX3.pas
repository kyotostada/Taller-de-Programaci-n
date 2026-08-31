program EX3;
const
  fin = 0;
type
  rangosocio = 1..60;
  rangocodigo= 200..230;

  fecha = record
    dia: integer;
    mes: integer;
    año: integer;
  end;

  prestamo = record
    nro: rangosocio
    code: rangocodigo;
    fec: fecha;
    cantdias: integer;
  end;

  lista = ^nodoLista

  nodoLista = record
    elem: prestamo;
    sig: lista;
  end;

  arbol = ^nodoArbol;

  nodoArbol = record
    elem: prestamo;
    prestamos: lista;
    hi: arbol;
    hd: arbol;
  end;

procedure generarArbol (var a: arbol);
  
  procedure leerFecha (var f: fecha);
  begin
    read(f.dia);
    read(f.mes);
    read(f.año);
  end;
  
  procedure leerPrestamo (var p: prestamo);
  var
    f: fecha;
  begin
    read(p.nro);
    if (p.nro <> fin) then begin
      leerFecha(p.fec);
      read(p.code);
      read(p.cantdias);
    end;

  end;
  

  procedure agregarAdelante(var l: lista, p: prestamo);
  var
    nue: lista;
  begin
    new(nue);
    nue^.elem:= p;
    nue^.sig:= l;
    l:= nue;
  end;

  procedure cargarArbol(var a: arbol, p: prestamo)
  var
  begin
    if (a = nil) then begin
      new(a);
      a^.prestamos:= nil
      agregarAdelante(a^.prestamos, p);
      a^.hi:= nil;
      a^.hd:= nil;
    end;
    else begin
      if (a^.elem.nro = p.nro) then 
        agregarAdelante(a^.prestamos, p);
      else begin
        if (a^.elem.nro < p.nro) then
          cargarArbol(a^.hi, p);
        else
          cargarArbol(a^.hd, p);
      end;
  end;

var
  p: prestamo;
begin
  a:= nil;
  leerPrestamo(p);
  while (p.code <> 0) do begin
    cargarArbol(a, p);
    leerPrestamo(p);
  end;
end;
  
function cantMultiplo(a: arbol): integer;
begin
  if (a <> nil) then begin
    if (a^.elem.nro mod 5) = 0) then
      cantMultiplo:= 1 + cantMultiplo(a);
    cantMultiplo:= cantMultiplo(a^.hi);
    cantMultiplo:= cantMultiplo(a^.hd);
  end;
end;
    
procedure recorrerLista (l: lista, var aux: integer);
begin
  aux:= 0;
  while (l <> nil) do begin
    if (l^.elem.cantdias <= 7) then
      aux:= aux + 1;
    l:= l^.sig;
  end;
end;

procedure InformarSocios (a: arbol);
var
  aux: integer;
begin
  if (a <> nil) then
    recorrerLista(a^.prestamos, aux);
    write('Código de socio:', a^.elem.code, 'cantidad de libros cuyo préstamo duró siete o menos días es', aux);
    InformarSocios(a^.hi);
    InformarSocios(a^.hd);
  end;
end;


procedure InformarPromedio (a: arbol; valor: real; var prom: real);    

  
  
  procedure cargarPromedio (a: arbol; valor: real; var aux, cantsocios: real);
  begin
    if (a <> nil) then
      if (a^.elem.cantdias > valor) then
        aux:= aux + a^.elem.cantdias;
        cantsocios:= cantsocios + 1;
        writeln('Número de socio:');
      end;
      InformarPromedio (a^.hi, valor, prom);
      InformarPromedio (a^.hd, valor, prom);
var
aux: real;
cantsocios: real;
begin
aux:= 0;
cantsocios:= 0;
cargarPromedio(a, valor, aux, cantsocios);
prom:= aux / cantsocios
end;




var
  a: arbol;
  prom: real;
  valor: integer;
begin
  randomize;
  generarArbol(a);
  writeln('La cantidad de socios cuyo número es múltiplo de cinco es:', cantMultiplo(a));
  InformarSocios(a);
  writeln('Ingrese un valor como promedio');
  readln(valor);
  InformarPromedio(a, valor, prom);
  writeln('El promedio de dias de préstamo de quienes superan el valor promedoi es:', prom);
end;

