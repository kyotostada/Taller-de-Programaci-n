Program Act3;
procedure ImprimirCondicion (var a, b, f: integer);
var
  ale: integer;
begin
repeat
  ale:= random(b-a) + a;
  writeln(ale);
until (ale = f);
end;

var
  li, ls, fin: integer;
begin
  randomize;
  writeln('Ingrese límite inferior:');
  read(li);
  writeln('Ingrese límite superior:');
  read(ls);
  writeln('Ingrese valor de fin:');
  read(fin);
  ImprimirCondicion(li, ls, fin);
end.
