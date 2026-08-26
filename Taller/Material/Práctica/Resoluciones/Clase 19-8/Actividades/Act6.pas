program ProgramaListas;
Const
  fin = 120;
type
  
  lista = ^nodo;
  
  nodo = record
    dato: integer;
    sig: lista;
  end;
procedure agregarElemento (var LI, LF: lista; n: integer);
var
  aux : lista;
begin
  new(aux);
  aux^.dato := n;
  aux^.sig := nil;
  if (LI = nil) then begin
    LI:= aux;
	LF:= aux;
  end
  else begin
		LF^.sig:= aux;
		LF:= aux;
	  end;
	end;

procedure CargarLista (var li, lf: lista);
var
  num: integer;
begin
  num:= random(51) + 100;
  while (num <> fin) do begin
    num:= random(51) + 100;
    agregarElemento(li, lf, num);
  end;
end;

procedure ImprimirLista (l: lista);
var
  aux: integer;
begin
  aux:= 0;
  while (l <> nil) do begin
    aux:= aux + 1;
    if ((aux mod 2) <> 0) then
      writeln('Número:', l^.dato, 'Posición', aux);
    l:= l^.sig
  end;
end;

function BuscarElemento (l: lista; num: integer): boolean;
var
  ok: boolean;
begin
  ok:= false;
  while (l <> nil) and (l^.dato <> num) do begin
   l:= l^.sig;
  end;
  
  if (l <> nil) and (l^.dato = num) then
    ok:= true;
  
  BuscarElemento:= ok;
end;

var
  li, lf: lista;
  n: integer;
begin
  li:= nil;
  randomize;
  cargarLista(li, lf);
  ImprimirLista(li);
  read(n);
  if (BuscarElemento(li, n)) then
	writeln('Se encontró el elemento');
end.

    
