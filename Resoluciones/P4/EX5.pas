program EX5;
const
  fin = -1;
type

  fecha = record
    dia: integer;
    mes: integer;
    anio: integer;
  end;


  consulta = record
    nroConsulta: integer;
    fec: fecha;
    tipo: integer;
    costo: real;
  end;
  
  lista = ^nodoLista;

  nodoLista = record
    elem: consulta;
    sig: lista;
  end;

  datoArbol1 = record
    nroHistoria: integer;
    consultas: lista;
  end;

  arbol1 = ^nodoArbol1;

  nodoArbol1 = record
    elem: datoArbol1;
    hi: arbol1;
    hd: arbol2;
  end;


  datoArbol2 = record;
    nroHistoria: integer;
    costoTotal: real;
  end;

  arbol2 = ^nodoArbol2;

  nodoArbol2 = record
    elem: datoArbol2;
    hi: arbol2;
    hd: arbol2;
  end;

procedure generarArbol1(var a1: arbol1);

    procedure leerFecha (f: fecha);
    begin
      read(f.dia);
      read(f.mes);
      read(f.anio);
    end;


    procedure leerConsulta (var c: consulta; var n: integer);
    
        procedure leerFecha (f: fecha);
        begin
            read(f.dia);
            read(f.mes);
            read(f.anio);
        end;

    begin
      read(n);
      if (n <> fin) then begin
        read(c.nroConsulta);
        leerFecha(c.fec);
        read(c.tipo);
        read(c.costo);
      end;
    end;


    procedure agregarAdelante (var l: lista; c: consulta);
    var
      nue: lista;
    begin
      new(nue);
      nue^.elem:= c;
      nue^.sig:= nil;
      l:= nue;
    end;

    procedure cargarDatos1(var a1; c: consulta; n: integer);
    begin
      if (a1 = nil) then begin
        new(a1);
        a1^.elem.nroHistoria:= n;
        agregarAdelante(a1^.elem.consultas, c);
        a^.hi:= nil;
        a^.hd:= nil;
      end;
      else
        if (a1^.elem.nroHistoria = n) then
          agregarAdelante(a1^.elem.consultas, c);
        else
          if (a1^.elem.nroHistoria > n) then
            cargarDatos1(a^.hd, c, n);
          else
            cargarDatos1(a^.hi, c, n);
    end;
    
procedure imprimirArbol1(a1: arbol1);
  procedure imprimirHistoria (l: lista);
  begin
    while (l <> nil) do begin
      writeln('Numero de consulta:', l^.elem.nroConsulta);
      writeln('Dia: ', l^.elem.fec.dia);
      writeln('Mes: ', l^.elem.fec.mes);
      writeln('Anio: ', l^.elem.fec.anio);
      writeln('Tipo de consulta: ', l^.elem.tipo);
      writeln('Costo  de la consulta: ', l^.elem.costo);
      l:= l^.sig;
    end;

begin
  if (a1 <> nil) then begin
    imprimirArbol1(a1^.hi)
    imprimirHistoria(a1^.elem.consultas);
    imprimirArbol1(a1^.hd);
  end;

 procedure recorrerLista (l: lista; var aux: integer);
  var
  begin
    aux:= 0;
    while (l<> nil) do begin
      aux:= aux + 1;
      l:= l^.sig;
    end;


procedure NumeroMax (a1: arbol1, var maxnro: integer);
var
  aux: integer;
  max: integer;
begin
  max:= -1
  if (a <> nil) then begin
    recorrerLista(a^.elem.consultas, aux);
    if (aux > max) then
      max:= a^.elem.nroHistoria;
    else
      NumeroMax:= NumeroMax(a1^.hi) + NumeroMax(a1^.hd);
  end;

function CantConsultas(a1: arbol1; nro: integer);
var
  aux: integer;
begin
  if (a = nil) then CantConsultas:= 0;
  else
    if (a <> nil) then begin
        if (a1^.elem.nroHistoria = nro) then begin
        recorrerLista(a1^.elem.consultas, aux);
        CantConsultas:= aux;
        end;
        else
          if (a1^.elem.nroHistoria < nro) then
            CantConsultas:= CantConsultas(a1^.hi);
          else
            CantConsultas:= CantConsultas(a1^.hd);
    end;
end;

procedure CantSuperan (a1: arbol1; var cant:integer; valor: integer)

  procedure ContarSuperan (l: lista; valor: real; var aux: integer);
  var
  begin
    aux:= 0;
    while (l<> nil) do begin
      if (l^.elem.costo > valor) then
        aux:= aux + 1;
      l:= l^.sig;
    end;




var
  aux: integer;
begin
  cant:= 0;
  if (a1 <> nil) then begin
    CantSuperan(a1^.hi, aux, valor);
    cant:= cant + aux;
    CantSuperan(a1^.hd, aux, valor);
  end;

function ObtenerCostoEntreDosCodigos2 (a2: arbol2; codigo1, codigo2: integer): real; 
  
  function ImporteTotal (l: lista): real;
  var
    aux: real;
  begin
    aux:= 0;
    while (l <> nil) do begin
      aux:= aux + l^.elem.costo;
      l:= l^.sig;
    end;
    ImporteTotal:= aux;
  end;

begin
  if (a = nil) then ObtenerCostoEntreDosCodigos2 := 0
       else
		if (a^.dato.codigo > codigo1) then 
		  if (a^.dato.codigo < codigo2) then 
			 ObtenerCostoEntreDosCodigos2 := ImporteTotal(a2^.elem.consultas); + ObtenerCostoEntreDosCodigos2  (a^.hi, codigo1, codigo2) + ObtenerCostoEntreDosCodigos2  (a^.hd, codigo1, codigo2)
		  else
			ObtenerCostoEntreDosCodigos2 := ObtenerCostoEntreDosCodigos2  (a^.hi, codigo1, codigo2) + ObtenerCostoEntreDosCodigos2  (a^.hd, codigo1, codigo2)
		else  
		  ObtenerCostoEntreDosCodigos2 := ObtenerCostoEntreDosCodigos2  (a^.hi, codigo1, codigo2);
	    end;


procedure generarArbol2 (var a2: arbol2; a1: arbol1);

  function CostoTotal(l: lista): real;
  var
    aux: real;
  begin
    aux := 0;
    while (l <> nil) do begin
      aux := aux + l^.elem.costo;
      l := l^.sig;
    end;
    CostoTotal := aux;
  end;

  procedure cargarDatos2(var a2: arbol2; nro: integer; c: real);
  begin
    if (a2 = nil) then begin
      new(a2);
      a2^.elem.nroHistoria := nro;
      a2^.elem.costoTotal := c;
      a2^.hi := nil;
      a2^.hd := nil;
    end
    else
      if (nro < a2^.elem.nroHistoria) then
        cargarDatos2(a2^.hi, nro, c)
      else
        cargarDatos2(a2^.hd, nro, c);
  end;

begin
  if (a1 <> nil) then begin
    cargarDatos2(a2, a1^.elem.nroHistoria, CostoTotal(a1^.elem.consultas));
    generarArbol2(a2, a1^.hi);
    generarArbol2(a2, a1^.hd);
  end;
end;

var
  c: real;
begin
  if (a1 <> nil) then begin
    generarArbol2(a2^.hi, a1);
    cargarDatos2(a2^.hi, a1, CostoTotal(c))
    generarArbol2(a2^.hd, a1);
  end;
end;
var
  a1: arbol1;
  a2: arbol2;
  nro: integer;
  valor: real;
  maxnro: integer;
  codigo1, codigo2: integer;
  cantsup: integer;
begin
  generarArbol1(a1);
  imprimirArbol1(a1);
  writeln;
  writeln;
  writeln('El numero de historia clinica mas grande es:', NumeroMax(a1));
  writeln;
  writeln;
  writeln('Ingrese un numero de historia clinica');
  readln(nro);
  writeln;
  writeln;
  CantConsultas(a1, maxnumero);
  writeln('La mascota con numero de historia clinica', nro, 'tiene', maxnumero, 'consultas');
  writeln;
  writeln;
  writeln('Ingrese un valor');
  writeln;
  writeln;
  CantSuperan(a1, valor)
  writeln('La cantidad de consultas que superan los', valor, 'pesos es de:', cantsup);
  writeln;
  writeln;
  writeln('El costo total de consultas entre el codigo', codigo1, 'y', codigo2, 'es de:', ObtenerCostoEntreDosCodigos(a1, codigo1,codigo2));
  generarArbol2(a2, a1);
end.




  