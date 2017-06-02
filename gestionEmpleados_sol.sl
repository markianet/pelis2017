programa gestionEmpleados
const 
	MAX = 2;
	NUM_OP_MENU = 5;

tipos empleado: registro
								{
									dni,
									nombre,
									apellido1,
									apellido2:	cadena;
									esJefe:		logico;
									sueldo:		numerico;
									borrado:    cadena;
								}

var
listaEmpleados:vector [MAX] empleado;
op:numerico;
final:logico;
nada: cadena;
inicio

final = FALSE;

mientras (not final)
{
  imprimirMenu();
  leer (op);
  mientras (op <= 0 || op >= NUM_OP_MENU + 1)
	{
	 leer (op);
	}

// eleccion opcion dada que sabemos es entre 1 y MAX_OP_MENU
  eval
	{
    caso (op == 1) 
							altaEmpleados();
    caso (op == 2)
							verEmpleados();
    caso (op == 3)
							borrarEmpleado();
    caso (op == 4)
							mostrarPorDni();
    caso (op == 5)
							final = TRUE;
	}

} // no fin

imprimir ("Chau");

fin

/////////////////////////////////////////////////////////////
sub imprimirMenu()
inicio
cls();
imprimir ("    PROGRAMA DE GESTIÓN DE EMPLEADOS \n\n");

imprimir ("1.- Alta empleados \n");
imprimir ("2.- Ver todos empleados\n");
imprimir ("3.- Borrar empleado por dni\n");
imprimir ("4.- Ver información un empleado por dni\n");
imprimir ("5.- Salir\n\n");
fin // imprimirMenu

sub altaEmpleados()
var
i: numerico=0;
dni,
									nombre,
									apellido1,
									apellido2:	cadena;
									esJefe:		logico;
									sueldo:		numerico;
inicio
imprimir("ALTA DE EMPLEADOS \n\n");
desde i=1 hasta MAX
{
imprimir ("Dame el DNI \n");
	leer(listaEmpleados[i].dni);
imprimir ("Dame el nombre \n");
	leer(listaEmpleados[i].nombre);
imprimir ("Dame el Apellido1 \n");
	leer(listaEmpleados[i].apellido1);
imprimir ("Dame el Apellido2 \n");
	leer(listaEmpleados[i].apellido2);
imprimir ("¿Es Jefe? \n");
	leer(listaEmpleados[i].esJefe);
imprimir ("Dame el sueldo \n");
	leer(listaEmpleados[i].sueldo);
listaEmpleados[i].borrado="no";

}

fin // altaEmpleados


sub verEmpleados()
var
i: numerico=1;
inicio
imprimir("VER EMPLEADOS \n\n");
desde i=1 hasta MAX
{
	si (listaEmpleados[i].borrado=="no")
{
	imprimir ("Empleado: ", i, "\n");
	imprimir ("DNI: ", listaEmpleados[i].dni, " \n");
	imprimir ("Nombre: ", listaEmpleados[i].nombre, " \n");
	imprimir ("Apellido1: ", listaEmpleados[i].apellido1, " \n");
	imprimir ("Apellido2: ", listaEmpleados[i].apellido2, " \n");
	imprimir ("Es Jefe: ", listaEmpleados[i].esJefe, " \n");
	imprimir ("Sueldo: ", listaEmpleados[i].sueldo, " \n");
	imprimir (" \n\n\n");
}
}
imprimir("Pulsa una tecla \n");
leer(nada);
fin //verEmpleados

sub borrarEmpleado()
var
i: numerico=1;
a: cadena;
inicio
imprimir("BORRAR EMPLEADOS POR DNI \n\n");
imprimir ("Mostrando nº de empleado y DNI \n");
desde i=1 hasta MAX
{
	imprimir ("Empleado: ", i, "\n");
	imprimir ("DNI: ", listaEmpleados[i].dni, " \n\n");
}
	imprimir ("Elige el empleado por su DNI \n");
		leer (a);
	/*desde i=1 hasta MAX
		{
			si (a==listaEmpleados[i].dni)*/
i=0;
mientras (i < MAX)
{
	i=i+1;
			si (a==listaEmpleados[i].dni)
			{ 
				listaEmpleados[i].borrado="si";
	}
}
				
imprimir (" \n\n");	
imprimir("Pulse una tecla\n");
leer(nada);
fin // borrarEmpleado

sub mostrarPorDni()
var i: numerico=1;
dnie: cadena;
inicio
imprimir("VER EMPLEADOS POR DNI \n\n");
imprimir ("Dame el DNI que buscas \n");
leer(dnie)
/*desde i=1 hasta MAX
{*/
i=0;
mientras (i < MAX)
{
i=i+1;
	si (dnie==listaEmpleados[i].dni)
		{

			imprimir ("DNI: ", listaEmpleados[i].dni, " \n");
			imprimir ("Nombre: ", listaEmpleados[i].nombre, " \n");
			imprimir ("Apellido1: ", listaEmpleados[i].apellido1, " \n");
			imprimir ("Apellido2: ", listaEmpleados[i].apellido2, " \n");
			imprimir ("Es Jefe: ", listaEmpleados[i].esJefe, " \n");
			imprimir ("Sueldo: ", listaEmpleados[i].sueldo, " \n");
		}
}
		/*}*/
imprimir (" \n\n");
imprimir("Pulse una tecla\n");
leer(nada);
fin // mostrarPorDni