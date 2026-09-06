program EX4;
const
  fin = 0;
type

  fec = record;
    dia: integer;
    mes: integer;
    anio: integer;
  end;

  final = record
    code: integer;
    fecha: fec;
    nota: real;
  end;

  lista = ^nodoLista;

  nodoLista = record
    elem: final;
    sig: lista;
  end;

  arbol = ^nodoArbol;

  nodoArbol = record
    legajo: integer;
    finales: lista;
    hi: arbol;
    hd: arbol;
  end;

procedure generarArbol (var a: arbol);
  
  procedure leerFecha (var fecha: fec);
  begin
    read(f.dia);
    read(f.mes);
    read(f.anio);
  end;

  procedure leerFinal (var f: final);
  begin
    read(f.code)
    leerFecha(f.fecha)
    read(f.nota);
  end;

  procedure agregarAdelante (var l: lista; f: final);
  var
    nue: lista;
  begin
    new(nue);
    nue^.elem:= f;
    nue^.sig:= l;
    l:= nue;
  end;

  procedure cargarArbol (var a: arbol; f: final; l: integer);
  begin
    if (a <> nil) then begin
      new(a);
      a^.legajo:= l;
      a^.finales:= nil;
      agregarAdelante(a^.finales, f);
      a^.hi:= nil;
      a^.hd:= nil;
    end;
    else
      if (l < a^.legajo) then
      cargarArbol(a^.hi, f, l);
      else
        cargarArbol(a^.hd, f, l);
  end;

var
  f: final;
  l: integer;
begin
  a:= nil;
  writeln ('Ingrese un número de legajo');
  read(l);
  leerFinal(f);
  while (l <> fin) do begin
    cargarArbol(a, f, l);
    leerFinal(f);
  end;
end;


procedure InformarAprobados (a: arbol);

  procedure contarAprobados (l: lista, var aux: integer);
  begin
  aux:= 0;
  while (l <> nil) do begin
    if (l^.elem.nota >= 4) then
      aux:= aux + 1;
    l:= l^.sig;
  end;

var
  aux: integer;
begin
  if (a <> nil) then begin
    contarAprobados(a^.finales, aux);
    writeln('La cantidad de finales que aprobo el alumno de legajo', a^.legajo, 'es:', aux);
    InformarAprobados(a^.hi);
    InformarAprobados(a^.hd);
  end;
end;

procedure InfoMateria (a: arbol; mat: integer; var cantAprobados, cantDesaprobados: integer);

  procedure AprobadosYDesaprobados (l: lista; mat: integer; var cantAprobados, cantDesaprobados: integer);
  begin
    while (l <> nil) do begin
      if (l^.code = mat) and (l^.nota >= 4) then
        cantAprobados:= cantAprobados + 1;
      else
        if (l^.code = mat) then
          cantDesaprobados:= cantDesaprobados + 1;
      l:= l^.sig;
    end;
  end; 

begin
  cantAprobados:= 0;
  cantDesaprobados:= 0;
  if (a <> nil) then begin
    AprobadosYDesaprobados(a^.finales, mat, cantAprobados, cantDesaprobados);
    InfoMateria(a^.hi);
    InfoMateria(a^.hd);
  end;
end;

procedure FinalesRendidos (a: arbol; valor: integer; var cantRendidos);

  procedure contarFinales (l: lista; var aux: integer);
  begin
    aux:= 0;
    while (l <> nil) do begin
      aux:= aux + 1;
      l:= l^.sig;
    end;
  end;

var
  aux: integer;
begin
  contarFinales(a^.finales, aux)
  if (aux = valor) then
    cantRendidos:= cantRendidos + 1;
  FinalesRendidos(a^.hi);
  FinalesRendidos(a^.hd);
end;


var
  a: arbol;
  cantAprobados, cantDesaprobados, mat, cantRendidos, valor: integer;
begin
  generarArbol(a);
  InformarAprobados(a);
  writeln('Ingresar codigo de materia:');
  readln(mat);
  InfoMateria(a, mat, cantAprobados, cantDesaprobados);
  writeln ('En la materia de codigo', mat,'aprobaron el final', cantAprobados, 'mientras que los que lo desaprobaron fueron', cantDesaprobados);
  writeln('Ingresar valor: ')
  FinalesRendidos(a, valor, cantRendidos);
  if (valor = 1) then
    writeln('La cantidad de alumnos que rindieron 1 final es de', cantRendidos);
  else
    writeln('La cantidad de alumnos que rindieron', valor, 'finales es de:', cantRendidos);
end.

