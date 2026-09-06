program EX3;
const
  fin = -1;
type
  inscripcion = record
    numero: integer;
    codigo: integer;
    dni: integer;
    asistAlumno: integer;
  end;

  taller = record
    codigoTaller: integer;
    alumnos: integer;
    asistTotal: integer;
  end;

  arbol = ^nodoArbol;

  nodoArbol = record
    elem: taller;
    hi: arbol;
    hd: arbol;
  end;


procedure generarArbol (var a: arbol);

  procedure leerInscripcion (var i: inscripcion);
  begin
    read(i.numero);
    if (i.numero <> fin) then begin
      read(i.codigo);
      read(i.dni);
      read(i.asistAlumno);
    end;
  end;
  
  procedure cargarDatos(a: arbol; i: inscripcion);
  begin
    if (a = nil) then begin
      a^.elem.alumnos:= 0;
      a^.elem.asistTotal:= 0;
      a^.elem.codigoTaller:= i.codigo; 
    else begin
      a^.elem.alumnos:= a^.elem.alumnos + 1;
      a^.elem.asistTotal:= a^.elem.alumnos + 1;
    end;
  end;

  procedure prepararDatos (i: inscripcion; var t: taller);
  begin
  
  procedure cargarArbol(var a: arbol; i: inscripcion);
  begin
    if (a = nil) then begin
      new(a);
      a^.elem.t.;
      cargarDatos(a, i);
      a^.hi:= nil;
      a^.hd:= nil;
    end;
    else
      if (a^.elem.codigoTaller = i.codigo) then
        cargarDatos(a, i);
      else
        if (a^.elem.codigoTaller < i.codigo) then
          cargarArbol(a^.hi, i);
        else
            cargarArbol(a^.hd, i);
  end;

var
  i: inscripcion;
begin
  leerInscripcion(i);
  while (i.numero <> fin) do begin
    cargarArbol(a, i);
    leerInscripcion(i);
  end;


  procedure imprimirArbol(a: arbol);
    procedure imprimir (a: arbol);
    begin
      writeln('Codigo de taller:', a^.elem.codigoTaller);
      writeln('Cantidad de alumnos en el taller:', a^.elem.alumnos)
      writeln('Asistencias totales al taller:', a^.elem.asistTotal);
    end;
   
  begin
    if (a <> nil) then begin
      imprimirArbol(a^.hi);
      imprimir(a^.elem);
      imprimirArbol(a^.hd);
    end;
  end;

procedure CodigoMax (a: arbol; var maxcode: integer)

  procedure recorrer(a: arbol; var max, maxcode: integer);
  begin
    if (a <> nil) then begin
      recorrer(a^.hi, max, maxcode)
      if (a^.elem.alumnos > max) then begin
        max:= a^.elem.alumnos;
        maxcode:= a^.elem.codigoTaller;
      end;
      recorrer(a^.hd, max, maxcode)
    end;
  end;
var
  max: integer;
begin
  max:= -1;
  maxcode:= -1;
  recorrer(a, max, maxcode);
end;


function CantidadDeCodigosMenores (a: arbol; valor: integer): integer; begin
    if (a = nil) then
      CantidadDeCodigosMenores:= 0
      else 
        if (a^.dato.codigo >= cod) then
          CantidadDeCodigosMenores:= CantidadDeCodigosMenores (a^.hi, cod) +  CantidadDeCodigosMenores (a^.hd, cod)
          else
          CantidadDeCodigosMenores:= 1 + CantidadDeCodigosMenores (a^.hi, cod) + CantidadDeCodigosMenores (a^.hd, cod)
end;

function ObtenerAsistenciasEntreDosCodigos (a: arbol; codigo1, codigo2: integer): real;
  begin
    if (a = nil) then ObtenerAsistenciasEntreDosCodigos:= 0
        else
		  if (a^.dato.codigo > codigo1) then 
		    if (a^.dato.codigo < codigo2) then 
			  ObtenerAsistenciasEntreDosCodigos:= a^.dato.alumnos + ObtenerAsistenciasEntreDosCodigos (a^.hi, codigo1, codigo2) + ObtenerAsistenciasEntreDosCodigos (a^.hd, codigo1, codigo2)
		    else
			  ObtenerAsistenciasEntreDosCodigos:= ObtenerAsistenciasEntreDosCodigos (a^.hi, codigo1, codigo2) + ObtenerAsistenciasEntreDosCodigos (a^.hd, codigo1, codigo2)
		  else  
		    ObtenerAsistenciasEntreDosCodigos:= ObtenerAsistenciasEntreDosCodigos (a^.hi, codigo1, codigo2);
	    end;


var
  a: arbol;
  valor, codigo1, codigo2, codemax: integer;
begin
  generarArbol(a);
  imprimirArbol(a);
  CodigoMax(a, codemax);
  writeln('El codigo del taller con más participantes inscriptos es:', codemax);
  writeln('Ingrese un valor:')
  readln(valor);
  writeln('La cantidad de talleres los cuales su código es menor al valor ingresado es:', CantidadDeCodigosMenores(a, valor))
  writeln('Ingrese el primer codigo:');
  readln(codigo1);
  writeln('Ingrese el segundo codigo:');
  readln(codigo2);
  writeln('La cantidad de asistencias a los talleres entre', codigo1, 'y', codigo2, 'es:', ObtenerAsistenciasEntreDosCodigos(a, codigo1, codigo2)); 
end.