program ProgramaListasOrdenadas;
Const
  fin = 120;
type
  
   lista = ^nodo;
   
   nodo = record
     dato: integer;
     sig: lista;
   end;


procedure insertarOrdenado(var L:lista; num: integer);
var
  nue: lista; 
  act, ant: lista;
begin
  new (nue); 
  nue^.dato := num; 
  act := L; 
  ant := L; 
  while (act <> nil) and (num > nue^.dato)do 
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

procedure CargarListaOrdenada (var l: lista);
var
  num: integer;
begin
  num:= random(51) + 100;
  while (num <> fin) do begin
	num:= random(51) + 100;
	insertarOrdenado(l, num);
  end;
end;
  


function BuscarOrdenado (l: lista; var num: integer): boolean;
var
  ok: boolean;
begin
  ok:= false;
  while (l <> nil) and (num < l^.dato) do 
  begin
		l:= l^.sig;
  end;
  if (l <> nil) and (l^.dato = num) then
    ok:= true;
  BuscarOrdenado:= ok;
end;
 
procedure ImprimirLista (l: lista);
var
  aux: integer;
begin
  aux:= 0;
  while (l <> nil) do begin
    aux:= aux + 1;
    writeln('Número:', l^.dato, 'Posición', aux);
    l:= l^.sig
  end;
end;

var
  l: lista;
  n: integer;
begin
  l:= nil;
  randomize;
  cargarlistaordenada(l);
  imprimirlista(l);
  readln(n);
  if (BuscarOrdenado(l, n)) then
    writeln('Se encontró el número');
end.
