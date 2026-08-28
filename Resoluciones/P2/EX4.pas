program EX4;
const
  dimF = 30;
  max = 550;
  min = 300;
type
  indice = -1..550;
  vector = array [1..dimF] of integer;

procedure	generarVector(var v: vector);

  procedure generarVectorRecursivo (var v: vector; pos: integer);
  var
    num: integer;
  begin
    num:= random(max-min) + min;
    writeln(num);
    if (pos < dimF) then begin
      v[pos]:= num;
      generarVectorRecursivo(v, pos + 1);
    end;
  end;

var
  pos: integer;
begin
  pos:= 1;
  generarVectorRecursivo(v, pos);
end;

procedure Ordenar (var v: vector);

var i, j, pos: integer; item: integer;	
		
begin
 for i:= 1 to dimF - 1 do 
 begin 
   pos := i;
   for j := i+1 to dimF do 
        if (v[j] < v[pos])then pos:=j;

   item := v[pos];   
   v[pos] := v[i];   
   v[i] := item;
 end;
end;

Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice);
var
  medio: integer;
begin
  medio:= (ini + fin) div 2;
  while (ini <= fin) and (dato <> v[medio]) do begin
    if (dato > v[medio]) then
      fin:= medio -1
    else
      ini:= medio +1;
    medio:= (ini + fin) div 2;
  end;
  if (ini <= fin) and (dato = v[medio]) then
    pos:= medio
  else
    pos:= -1;
  end;


var
  v: vector;
  dato: integer;
  pos: indice;
begin
  generarVector (v); // Recursivo
  ordenar(v); // Imperativo
  writeln('Introduzca el número que desee buscar');
  readln(dato);
  BusquedaDicotomica(v, 1, dimF, dato, pos); // Imperativo
  writeln(pos);
end.
