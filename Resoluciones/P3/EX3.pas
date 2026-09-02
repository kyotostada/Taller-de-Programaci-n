program EX3;
const
  fin = 0;
type
  rangosocio = 0..60;
  rangocodigo= 0..230;

  fecha = record
    dia: integer;
    mes: integer;
    anio: integer;
  end;

  prestamo = record
    code: rangocodigo;
    fec: fecha;
    cantdias: integer;
  end;

  lista = ^nodoLista;

  nodoLista = record
    elem: prestamo;
    sig: lista;
  end;

  datosocio = record
    nroSocio: integer;
    lis: lista;
  end;

  arbol = ^nodoArbol;

  nodoArbol = record
    elem: datosocio;
    hi: arbol;
    hd: arbol;
  end;

procedure generarArbol (var a: arbol);
  
  procedure leerFecha (var f: fecha);
  begin
    writeln('Ingrese una fecha');
    read(f.dia);
    read(f.mes);
    read(f.anio);
  end;
  
  procedure leerPrestamo (var p: prestamo; var nro: integer);
  begin
      writeln('Ingrese numero de socio:');
      read(nro);
      if (nro <> fin) then begin
        leerFecha(p.fec);
        writeln('Ingrese un código de libro');
        read(p.code);
        writeln('Ingrese la duración del prestamo:');
        read(p.cantdias);
      end;  
    end;
  

  procedure agregarAdelante(var l: lista; p: prestamo);
  var
    nue: lista;
  begin
    new(nue);
    nue^.elem:= p;
    nue^.sig:= l;
    l:= nue;
  end;

  procedure cargarArbol(var a: arbol; p: prestamo; nro: integer);
  begin
    if (a = nil) then begin
      new(a);
      a^.elem.nroSocio:= nro;
      a^.elem.lis:= nil;
      agregarAdelante(a^.elem.lis, p);
      a^.hi:= nil;
      a^.hd:= nil;
    end
    else begin
      if (a^.elem.nroSocio = nro) then 
        agregarAdelante(a^.elem.lis, p)
      else begin
        if (a^.elem.nroSocio < nro) then
          cargarArbol(a^.hi, p, nro)
        else
          cargarArbol(a^.hd, p, nro);
      end;
  end;
end;
var
  p: prestamo;
  nro: integer;
begin
  a:= nil;
  leerPrestamo(p, nro);
  while (nro <> fin) do begin
    cargarArbol(a, p, nro);
    leerPrestamo(p, nro);
  end;
end;
  
function cantMultiplo(a: arbol): integer;
begin
  if (a <> nil) then begin
    if ((a^.elem.nroSocio mod 5) = 0) then
      cantMultiplo:= 1 + cantMultiplo(a^.hi) + cantMultiplo(a^.hd)
    else
      cantMultiplo:= cantMultiplo(a^.hi) + cantMultiplo(a^.hd);
  end;
end;
    
procedure recorrerLista (l: lista; var aux: integer);
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
  if (a <> nil) then begin
    recorrerLista(a^.elem.lis, aux);
    writeln('Código de socio:', a^.elem.nroSocio, 'cantidad de libros cuyo préstamo duró siete o menos días es', aux);
    InformarSocios(a^.hi);
    InformarSocios(a^.hd);
  end;
end;


procedure InformarPromedio (a: arbol; valor: real; var prom: real);    

  procedure contarSociosPromedio(l: lista; valor: real; var promediosocio: real);
  var
    dias, cantprest: real;
  begin
    dias:= 0;
    cantprest:= 0;
    while (l <> nil) do begin
      dias:= dias + 1;
      cantprest:= cantprest + l^.elem.cantdias;
      l:=l^.sig;
    end;
    promedioSocio:= cantprest / dias;
  end;
  
  procedure cargarPromedio (a: arbol; valor: real);
  var
    promedioSocio: real;
  begin
    promedioSocio:= 0;
    if (a <> nil) then begin
      contarSociosPromedio(a^.elem.lis, valor, promedioSocio);
      if (promedioSocio > valor) then
        writeln('Número de socio:', a^.elem.nroSocio, 'promedio de días de prestamo:', promedioSocio);
      end;
      cargarPromedio (a^.hi, valor);
      cargarPromedio (a^.hd, valor);
  end;

begin
cargarPromedio(a, valor);
end;


// EL PROGRAMA NUNCA TERMINA CUANDO SE INGRESA EL VALOR FIN

var
  a: arbol;
  prom: real;
  valor: integer;
begin
  generarArbol(a);
  if (a <> nil) then begin
  writeln('La cantidad de socios cuyo número es múltiplo de cinco es:', cantMultiplo(a));
  InformarSocios(a);
  writeln('Ingrese un valor como promedio');
  readln(valor);
  InformarPromedio(a, valor, prom);
  writeln('El promedio de dias de préstamo de quienes superan el valor promedio es:', prom);
  end;
end.
