/*********************************************
 * OPL 12.10.0.0 Model
 * Author: Marcello
 * Creation Date: Dec 4, 2020 at 9:58:26 A
 * flusso di costo minimo (implementazione 2)
 *********************************************/
int nNodi = ...;
range Nodi = 1..nNodi;

tuple arco{
  int nodoOut ;
  int nodoIn;
}
{arco} Archi=...;
int divergenza[Nodi]=...;
int costo[Archi]=...;

dvar float+ F[Archi];

minimize sum(a in Archi)F[a]*costo[a];
subject to{
  forall(i in Nodi)
    continuita: sum( a in Archi : a.nodoOut==i)F[a] -sum(a in Archi : a.nodoIn==i)F[a]==divergenza[i];
}