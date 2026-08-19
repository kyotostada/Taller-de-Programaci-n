Program Act2;


Procedure ImprimirRango (var a, b, n: integer);
var
  i:= integer;
begin
  for i:= 1 to n do begin
    writeln(random(b-a) + a);
  end;
end;

var
  li, ls, cant: integer;
begin
  read(li);
  read(ls)
  read(cant)
  ImprimirRango (li, ls, cant);
end.
  
