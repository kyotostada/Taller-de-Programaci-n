program EX3;
const
  fin = '.';
  dimF = 20;
type
  vector = array [1..dimF] of char;

procedure cargarVector (var v: vector; var dimL: integer);
	procedure cargarVectorRecursivo (var v: vector; var dimL: integer);
	var
	  aux: char;
	begin
	  writeln('Introduzca un caracter:');
	  read(aux);
	  if (dimF <> 0) and (aux <> fin) then begin
	    dimL:= dimL + 1;
	    v[dimL]:= aux;
	    cargarVectorRecursivo(v, dimL);
	  end;
	end;
begin
  dimL:= 0;
  cargarVectorRecursivo(v, dimL);
end;

function esPalindromo (v: vector; dimL: integer): boolean;

	function esPalindromoRecursivo (v: vector; ini, dimL: integer): boolean;
	  
	begin
	  if (dimL = 0) or (dimL = 1) then esPalindromo:= true
	  else begin
		if (v[dimL] = v[ini]) then esPalindromoRecursivo := esPalindromoRecursivo(v, ini+1, dimL-1)
		else
  		  esPalindromoRecursivo:= false;
	  end;
	end;
var
  ini: integer;
begin
  ini:= 1;
  esPalindromo:= EsPalindromoRecursivo(v, ini, dimL);  
end;
var
  v: vector;
  dimL: integer;
  es: boolean;
begin
  cargarVector(v, dimL);
  es:= esPalindromo(v, dimL);
  if es then
    writeln('La palabra introducida es un palíndromo');
end.
