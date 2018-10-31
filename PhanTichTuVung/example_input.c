Program Example2; 
Var a,b,c;
PROCEDURE gcd(a; b; var d);  
	Begin    
	   While a <> b do
		if a > b then a := a - b
		else b := b - a;	
	  d := b;
	  b := 123456789;
	End;
Begin  
   Call Readln(a);	Call Readln(b);
	(* Call gcd(a,b,c; *)
	Call Writeln(c);
End.

Begin a + 