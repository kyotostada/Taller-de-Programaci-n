Program NumeroAleatorio;
var
  ale: integer;
begin
  randomize;
  ale:= random(100);
  writeln('El numero aleatorio generado es:', ale);
  readln;
end.

