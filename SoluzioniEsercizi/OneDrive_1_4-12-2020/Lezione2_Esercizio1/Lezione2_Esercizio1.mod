/*********************************************
 * OPL 12.10.0.0 Model
 * Author: Marcello
 * Creation Date: Dec 4, 2020 at 9:14:43 AM
 * Programmazione Produzione Multiperiodo
 *********************************************/
int Nmesi=...;
int QN=...;
int QE=...;
int QC=...;
int CN=...;
int CE=...;
float CS=...;

range mesi=1..Nmesi;
float D[mesi]=...;
float S0=...;

dvar float+ X[mesi];
dvar float+ Y[mesi];
dvar float+ Z[mesi];

minimize sum(i in mesi)(CN*X[i] +CE*Y[i]+CS*Z[i]);
subject to{
  forall(i in mesi){
    produzioneN: X[i]<=QN;  
    produzioneE: Y[i]<=QE;
    statoC:      Z[i]<=QC;
  } 
  Z[5]==0;
  
  X[1]+Y[1]+S0==D[1]+Z[1];  
  forall(i in mesi : i>=2)
    X[i]+Y[i]+Z[i-1]==D[i]+Z[i];
}
 