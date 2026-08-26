program gimnasio;
Const
  fin = 0;
type
  
  RangoNro = 1..500;
  RangoAct = 1..5;
  
  asistencia = record
    dia: integer;
    mes: integer;
    ano: integer;
    nro: RangoNro;
    act: RangoAct;
  end;
  
  VecAct = array [rangoAct] of integer;

  lista = ^nodo;
  
  nodo = record
    elem: asistencia;
    sig: lista;
  end;

procedure leerAsistencia (var a: asistencia);
begin
  a.nro:= random(500) + 1;
  if (a.nro <> fin) then begin
    read(a.dia);
    read(a.mes);
    read(a.ano);
    read(a.act);
  end;
end;

procedure insertarOrdenado (var l: lista; a: asistencia);
var
  nue: lista; 
  act, ant: lista;
begin
  new (nue); 
  nue^.elem := a; 
  act := L; 
  ant := L; 
  while (act <> nil) and (a.nro > act^.elem.nro) do begin 
  begin
    ant := act;
    act:= act^.sig;
  end;
  if (act = ant) then 
    L:= nue
  else 
    ant^.sig:= nue;
  nue^.sig:= act; 
  end;
end;

procedure cargarLista (var l: lista);
var
  a: asistencia;
begin
  leerAsistencia(a);
  while (a.nro <> 0) do begin
    insertarOrdenado(l, a);
    leerAsistencia(a);
  end;
end;

procedure inicializarVector(var v: VecAct);
var
  i: integer;
begin
  for i:= 1 to 5 do begin
    v[i]:= 0;
  end;
end;

procedure cargarVector(l: lista; var v: VecAct);
begin
  while (l <> nil) do begin
    v[l^.elem.act]:= v[l^.elem.act] + 1;
    l:= l^.sig;
  end;
end;


procedure imprimirAsistencia (l: lista);
begin
  while (l <> nil) do begin
    writeln('Número de cliente:', l^.elem.nro);
    writeln('Día:', l^.elem.dia);
    writeln('Mes:', l^.elem.mes);
    writeln('Año:', l^.elem.ano);
    writeln('Actividad:', l^.elem.act);
    l:= l^.sig;
  end;
end;

procedure ImprimirLista(l: lista);
begin
  while (l <> nil) do begin
    imprimirAsistencia(l);
    l:= l^.sig;
  end;
end;

procedure MaxAsistencias(l: lista; num: integer; var cantasist: integer);
begin
  cantasist:= 0;
  while (l <> nil) and (num < l^.elem.nro) do 
  begin
		l:= l^.sig;
  end;
  while (l <> nil) and (l^.elem.nro = num) do begin
    cantasist:= cantasist + 1;
    l:= l^.sig;
  end;
end;// ¿Cómo muestro la cantidad de asistencias de uno si cada nodo es una asistencia?

procedure ActividadMax (v: VecAct; var maxact: integer);
var
  i: integer;
  max: integer;
begin
  max:= -1;
  for i:= 1 to 5 do begin
    if (v[i] > max) then begin
      max:= v[i];
      maxact:= i;
    end;
  end;
end;

var
  l: lista;
  num: integer;
  v: VecAct;
  maxact, cantasist: integer;
begin
  l:= nil;
  randomize;
  cargarLista(l);
  inicializarVector(v);
  cargarVector(l, v);
  ImprimirLista(l);
  writeln('Introduzca número de cliente:');
  readln(num);
  MaxAsistencias(l, num, cantasist);
  ActividadMax(v, maxact);
end.
    
