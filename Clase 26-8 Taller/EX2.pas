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
