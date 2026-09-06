program EX4;
const
  fin = 0;
type
  alquiler = record
    numero: integer;
    dia: integer;
    horas: integer;
    importe: real;
  end;

  DatoArbol1 = record
    codigo: integer;
    a: alquiler;
  end;

  arbol1 = ^nodoArbol1;

  nodoArbol1 = record
    elem: DatoArbol1;
    hi: arbol1;
    hd: arbol1;
  end;

  lista = ^nodoLista;

  nodoLista = record;
    elem: alquiler;
    sig: lista;
  end;
  
  DatoArbol2 = record
    codigo: integer;
    lis: lista;
  end;

  arbol2 = ^nodoArbol2
  
  nodoArbol2 = record
    elem: datoarbol2;
    hi: arbol2;
    hd: arbol2;
  end;

  arbol3 = ^nodoArbol3;
  
  
  datoarbol3 = record
    codigo: integer;
    totalHoras: integer;
  end;
  
  nodoArbol3 = record
    elem: datoarbol3;
    hi: arbol3;
    hd: arbol3;
  end;

procedure generarArboles (var a1: arbol1; var a2: arbol2);

  procedure leerAlquiler(var a: alquiler, var c: integer);
  begin
    read(c);
    if (c <> fin) then begin
      read(a.numero);
      read(a.dia);
      read(a.horas);
      read(a.importe);
    end;
  end;

  procedure agregarAdelante(var l: lista, a: alquiler);
  var
    nue: lista;
  begin
    new(nue);
    nue^.elem:= a;
    nue^.sig:= nil;
    l:= nue;
  end;

  procedure cargarArbol1 (var a1: arbol1; a: alquiler; c: integer);
  begin
    if (a1 = nil) then begin
      new(a1)
      a1^.elem.codigo:= c;
      a1^.elem.a:= a;
      a1^.hi:= nil;
      a1^.hd:= nil;
    end;
    else
      if (a1^.elem.codigo = c) or (a1^.elem.codigo > a.codigo) then
        cargarArbol1(a1^.hd, a);
      else
        cargarArbol1(a1^.hi, a);
  end;

  procedure cargarArbol2 (var a2: arbol2; a: alquiler; c: integer);
  begin
    if (a2 = nil) then begin
      new(a2);
      a2^.elem.codigo:= c;
      agregarAdelante(a2^.elem.lis, a);
      a2^.HI:= nil;
      a2^.hd:= nil;
    end;
    else
      if (a2^.elem.codigo = a.codigo) then
        agregarAdelante(a2^.elem.lis, a);
        else
        if (a2^.elem.codigo > a.codigo) then
          cargarArbol2(a^.hd, a, c);
        else
          cargarArbol2(a^.hi, a, c);
   end;

var
  c: integer;
  a: alquiler;
begin
  leerAlquiler(a, c);
  while (c <> fin) do begin
    cargarArbol1(a1, a, c);
    cargarArbol2(a2, a, c);
    leerAlquiler(a, c);
  end;
end;       

function CodeBicicletaMax (a1: arbol1): integer;
begin
  if (a1 <> nil) then begin
    if (a1^.hd <> nil) then
      CodeBicicletaMax:= CodeBicicletaMax(a1^.hd);
    else
      CodeBicicletaMax:= a1^.elem.codigo;
  end;
end;

function CodeBicicletaMin (a2: arbol2): integer;
begin
  if (a2 <> nil) then begin
    if (a2^.hd <> nil) then
      CodeBicicletaMin:= CodeBicicletaMin(a2^.hd);
    else
      CodeBicicletaMin:= a2^.elem.codigo;
  end;
end;

function CantAsistencias(a2: arbol2; nro: integer): integer;
begin
  if (a2 <> nil) then begin
    if (a^.elem.numero = nro) then
      CantAsistencias:= 1 + CantAsistencias(a2^.hd, nro) 
    else
      CantAsistencias:= CantAsistencias(a2^.hd, nro) + CantAsistencias(a2^.HI, nro)
  end;
end;

function CantAlquileres (a2: arbol; nro: integer): integer;

  procedure recorrerLista(l: lista; var aux: integer);
  begin
    while (l <> nil) do begin
      aux:= aux + 1;
      l:= l^.sig;
    end;
  end;

var
  aux: integer;
begin
  aux:= 0;
  if (a2 <> nil) then begin
    if (a2^.elem.numero = nro) then begin
      recorrerLista(a2^.elem.lis, aux);
    else
      if (a2^.elem.numero < nro) then
        CantAlquileres:= CantAlquileres(a2^.hi, nro)
      else
        CantAlquileres:= CantAlquileres(a2^.hd, nro);
  end;
  CantAlquileres:= aux;
end;

procedure generarArboles2 (a1: arbol1; a2: arbol2; var ai, aii: arbol3);

  
  procedure cargarArboli(var ai: arbol3; a1: arbol1);
    
    procedure cargarDatosi(var ai: arbol3; a1: arbol1);
    begin
      if (ai = nil) then begin
        new(ai);
        ai^.elem.codigo:= a1^.elem.codigo;
        ai^.elem.totalHoras:= a1^.elem.horas;
        ai^.hi:= nil;
        ai^.hd:= nil;
      end;
      else
        if (ai^.elem.codigo < a1^.elem.codigo) then
          cargarDatosi(ai^.hi, a1);
        else
          CargarDatosi(ai^.hd, a1);
      else
        ai^.elem.totalHoras:= ai^.elem.totalHoras  + a1^.elem.horas;
    end;
  begin
    if (a1 <> nil) then begin
      cargarArboli(ai^.hd);
      cargarDatos(ai, a1);
      cargarArboli(ai^.hd);
    end;
  end;

  procedure cargarArbolii (var aii: arbol3; a2: arbol2);
    
    function CantHoras (l: lista): integer;
    var
      aux: integer;
    begin
      aux:= 0;
      while (l <> nil) then begin
        aux:= aux + l^.elem.horas;
        l:= l^.sig;
      end;
      CantHoras = aux;
    end;


    procedure cargarDatosii (var aii: arbol3; a2: arbol2; h: integer);
    begin
      if (aii = nil) then begin
      new(aii);
      aii^.elem.codigo:= a2^.elem.codigo
      aii^.elem.codigo:= h;
      aii^.hi:= nil;
      aii^.hd:= nil;
      end;
      else
        if (aii^.elem.codigo < a2^.elem.codigo) then
          cargarDatosii(aii^.hi, a2, h);
        else
          cargarDatosii(aii^.hd, a2, h);
      end;
    end;

var
  h: integer;
begin
  cargarArboli(ai, a1);
  cargarArbol2(aii, a2, CantHoras(h));
end;
  
function ObtenerImporteEntreDosCodigos (a1: arbol1; codigo1, codigo2: integer): real; begin
  if (a = nil) then ObtenerImporteEntreDosCodigos:= 0
       else
		if (a^.dato.codigo > codigo1) then 
		  if (a^.dato.codigo < codigo2) then 
			 ObtenerImporteEntreDosCodigos:= a^.dato.a.importe + ObtenerImporteEntreDosCodigos (a^.hi, codigo1, codigo2) + ObtenerImporteEntreDosCodigos (a^.hd, codigo1, codigo2)
		  else
			ObtenerImporteEntreDosCodigos:= ObtenerImporteEntreDosCodigos (a^.hi, codigo1, codigo2) + ObtenerImporteEntreDosCodigos (a^.hd, codigo1, codigo2)
		else  
		  ObtenerImporteEntreDosCodigos:= ObtenerImporteEntreDosCodigos (a^.hi, codigo1, codigo2);
	    end; 

function ObtenerImporteEntreDosCodigos2 (a2: arbol2; codigo1, codigo2: integer): real; 
  
  function ImporteTotal (l: lista): real;
  var
    aux: real;
  begin
    aux:= 0;
    while (l <> nil) do begin
      aux:= aux + l^.elem.importe;
      l:= l^.sig;
    end;
    ImporteTotal:= aux;
  end;

begin
  if (a = nil) then ObtenerImporteEntreDosCodigos:= 0
       else
		if (a^.dato.codigo > codigo1) then 
		  if (a^.dato.codigo < codigo2) then 
			 ObtenerImporteEntreDosCodigos:= ImporteTotal(a2^.elem.lis); + ObtenerImporteEntreDosCodigos (a^.hi, codigo1, codigo2) + ObtenerImporteEntreDosCodigos (a^.hd, codigo1, codigo2)
		  else
			ObtenerImporteEntreDosCodigos:= ObtenerImporteEntreDosCodigos (a^.hi, codigo1, codigo2) + ObtenerImporteEntreDosCodigos (a^.hd, codigo1, codigo2)
		else  
		  ObtenerImporteEntreDosCodigos:= ObtenerImporteEntreDosCodigos (a^.hi, codigo1, codigo2);
	    end;



var
  a1: arbol1;
  a2: arbol2;
  ai, aii: arbol3;
  nro: integer;
  codigo1, codigo2: integer;
begin
  generarArboles (a1, a2);
  writeln('El codigo de bicicleta mas grande es:', CodeBicicletaMax(a1));
  writeln('El codigo de bicicleta mas chico es:', CodeBicicletaMin(a2));
  writeln;
  writeln;
  writeln('Ingrese un numero de cliente:');
  readln(nro);
  writeln('El cliente con numero:', nro, 'tiene', CantAsistencias(a1, nro), 'asistencias');
  writeln;
  writeln;
  writeln('Ingrese un numero de cliente:');
  readln(nro);
  writeln('El cliente con numero:', nro, 'tiene', CantAlquileres(a2, nro), 'alquileres');
  generarArboles2(a1, a2, ai, aii);
  ImprimirArbol(aii);
  writeln;
  writeln;
  writeln('Ingrese el primer codigo:');
  readln(codigo1);
  writeln('Ingrese el segundo codigo:');
  readln(codigo2);
  writeln('La cantidad de asistencias a los talleres entre', codigo1, 'y', codigo2, 'es:', ObtenerImporteEntreDosCodigos(a1, codigo1, codigo2)); 
  writeln;
  writeln;
  writeln('Ingrese el primer codigo:');
  readln(codigo1);
  writeln('Ingrese el segundo codigo:');
  readln(codigo2);
  writeln('La cantidad de asistencias a los talleres entre', codigo1, 'y', codigo2, 'es:', ObtenerImporteEntreDosCodigos2(a2, codigo1, codigo2));
end. 
  