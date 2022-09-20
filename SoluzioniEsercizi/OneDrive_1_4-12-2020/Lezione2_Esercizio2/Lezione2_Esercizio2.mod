/*********************************************
 * OPL 12.10.0.0 Model
 * Author: Marcello
 * Creation Date: Dec 4, 2020 at 9:50:29 AM
 * Flusso di costo minimo (implementazione 1)
 *********************************************/
tuple arco{
  int nodoOut;
  int nodoIn;
  int peso;
}

{arco} Archi=...;

tuple nodo{
  int indiceNodo;
  int peso;
}

{nodo} Nodi=...;

dvar float+ F[Archi];

minimize sum(a in Archi)F[a]*a.peso;
subject to{
  forall(i in Nodi)
    continuita: sum(a in Archi : i.indiceNodo==a.nodoOut)F[a]-sum(a in Archi : i.indiceNodo==a.nodoIn)F[a]==i.peso;
}



