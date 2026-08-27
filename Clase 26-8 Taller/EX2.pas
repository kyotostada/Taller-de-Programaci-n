program EX2;
const
  min = 200;
  max = 230;
type

  lista = ^nodo;
  
  nodo = record
    elem: integer;
    sig: lista;
  end;
  
procedure cLista (var l: lista);
  procedure cargarLista (var l: lista);
  var
    aux: integer; 
    nue: lista;
  begin
    aux:= random (max - min) + 1;
    if (aux <> min) then begin
      cargarLista(l^.sig);
      new(nue);
      nue^.elem:= aux;
      nue^.sig:= l;
      l:= nue;
    end;
  end;   
begin
  l:= nil;
  cargarLista(l);    
end;

procedure ImprimirLista (l: lista);
begin
  if (l <> nil) then begin
    ImprimirLista(l^.sig);
    writeln(l^.elem);
  end;
end;

procedure ImprimirInverso (l: lista);
begin
  if (l <> nil) then begin
    writeln(l^.elem);
    ImprimirInverso(l^.sig);
  end;
end;
    
function MinimoLista (l: lista): integer;
begin
  if (l <> nil) then begin
    MinimoLista:= MinimoLista(l^.sig);
    if l^.elem < min then
      MinimoLista:= l^.elem;
  end;
end;
    
function BusquedaLista (l: lista; valor: integer): boolean;
begin
  if (l = nil) then BusquedaLista:= false
  else
    if (l^.elem = valor) then BusquedaLista:= true
    else
      BusquedaLista:= BusquedaLista(l^.sig, valor);
  end;
  
      
var
  l: lista;
  valormin: integer;
  encontre: boolean;
  valor: integer;
begin
  randomize;
  clista(l);
  ImprimirLista(l);
  ImprimirInverso(l);
  valormin:= MinimoLista(l);
  read(valor);
  encontre:= BusquedaLista(l, valor);
end.
program EX2;
const
  min = 200;
  max = 230;
  
  
  lista = ^nodo;
  
  nodo = record
    elem: integer;
    sig: lista;
  end;
  
procedure lista (var l: lista);

  procedure agregarAdelante (var l: lista; n: integer);
  var
    nue: lista;
  begin
    new(nue);
    nue^.elem:= n;
    nue^.sig: l;
    l:= nue;
  end;
  
  procedure cargarLista (var l: lista);
  var
    aux: integer;
  begin
    aux:= random + (max - min) + 1;
    while (aux <> min) do begin
      agregarAdelante(l, aux);
      aux:= random + (max - min) + 1;
    end;
  end;
      
begin
  l:= nil;
  cargarLista(l);    
end;

procedure ImprimirListaRecursivo (l: lista);
begin
  if (l <> nil) then
    ImprimirListaRecursivo(l^.sig);
    writeln(l^.elem);
  end;
end;

procedure ImprimirListaRecursivo (l: lista);
begin
  if (l <> nil) then begin
    writeln(l^.elem);
    ImprimirListaRecursivo(l^.sig);
  end;
end;
var
  l: lista;
  min: integer;
  encontre: boolean;
begin
  randomize;
  lista(l);
  ImprimirLista(l);
  ImprimirInverso(l);
  MínimoLista(l, min);
  BusquedaLista(l, encontre);
