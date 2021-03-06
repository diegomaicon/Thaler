//+------------------------------------------------------------------+
//|                                                     SvmTools.mqh |
//|                                               Diego Maicon Silva |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Diego Maicon Silva"
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CSvmTools{
private:

public:
                     CSvmTools();
                    ~CSvmTools();
   bool              IsCompra(double SMA,double SMA_3,double EMA,double EMA_3,double CO,double CO_1,double WR,double S,double VOL);
   bool              IsVenda(double SMA,double SMA_3,double EMA,double EMA_3,double CO,double CO_1,double WR,double S,double VOL);
   bool              IsCompraSMA21(double SMA,double SMA_3);
   bool              IsVendaSMA21(double SMA,double SMA_3);

   bool              IsCompraEMA21(double EMA,double EMA_3);
   bool              IsVendaEMA21(double EMA,double EMA_3);

   bool              IsCompraCO(double CO,double CO_1);
   bool              IsVendaCO(double CO,double CO_1);
   
   bool              IsCompraVROC(double VROC,int pVROC);
   bool              IsVendaVROC(double VROC,int pVROC);
   
   bool              IsCompraAO(double AO,double AO_1);
   bool              IsVendaAO(double AO,double AO_1);
   
   bool              IsCompraMACD(double macd,double macd_1,double sing,double sing_1);
   bool              IsVendaMACD(double macd,double macd_1,double sing,double sing_1);

   bool              IsCompraWR(double WR);
   bool              IsVendaWR(double WR);
   
   bool              IsCompraBB(double preAtivo,double preAtivo_1, double BBI, double BBI_1);
   bool              IsVendaBB(double preAtivo,double preAtivo_1, double BBI, double BBI_1);
   
   bool              IsCompraAD(double ad,double ad_P,double preAtivo,double preAtivo_P);
   bool              IsVendaAD(double ad,double ad_P,double preAtivo,double preAtivo_P);
   
   bool              IsCompraOBV(double obv,double obv_P,double preAtivo,double preAtivo_P);
   bool              IsVendaOBV(double obv,double obv_P,double preAtivo,double preAtivo_P);
   
   bool              IsCompraRSI(double RSI,int P);
   bool              IsVendaRSI(double RSI,int P);

   bool              IsCompraST(double ST,int P);
   bool              IsVendaST(double ST,int P);
   
   bool              IsCompraHILO(double hilo, double preco); 
   bool              IsVendaHILO(double hilo, double preco);   
struct novoCandle 
  { 
   string  candle;     // Indicadores ativos
   int   cont;         // Contador
  };
  
   novoCandle           verificaNewCandle(double SMA,double SMA_3,double EMA,double EMA_3,double CO,double CO_1,double VROC,int pVROC,
                                          double AO,double AO_1,double WR,double MACD,double MACD_1,double SING,double SING_1,
                                          double preAtivo,double preAtivo_1,double BBI,double BBI_1,double BBS,double BBS_1,
                                          double ap,double ad_P,double preAtivo_P,double obv,double obv_P,
                                          double RSI,int pa_RSI_C,int pa_RSI_V,double ST,int pa_ST_C,int pa_ST_V,double hilo);
  };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
CSvmTools::CSvmTools()
  {
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
CSvmTools::~CSvmTools()
  {
  }
//+------------------------------------------------------------------+



/*
Done  Regra 1      x Compra SMAp (i) > SMAp (i − 3) | P ∈ {8, 9, 21}
Done  Regra 2      x Compra EMAp (i) > EMAp (i − 3) | P ∈ {8, 9, 21}
Done  Regra 3      x Compra And(COp (i − 1)<0, COp (i)>0) | P ∈ {10, 15, 20}
Done  Regra 4      x Compra VROCp (i) > P | P e {120,150}
Done  Regra 5      x Compra And(AOp(i) > 0 , AO(i-1) < 0) | P ∈ {8, 14, 21}
Done  Regra 6      x Compra WRp (i) < − 90 | P ∈ {8, 9, 21}
Done  Regra 7      x Compra And(MACDp(i) > Sing(i), MACD[i-1] < Sing[i-1]) | P e {12,26,9}
Done  Regra 8      x Compra And(PrecoAtivo(i−1) < BBIp(i−1); PrecoAtivo(i) > BBIp(i)) | P ∈{20,14,24} 
Done  Regra 9      x Compra And(AD(i) >  AD(i − P), Asset Price(i) > Asset Price(i − P)) | P ∈ {1, 2, 3}
Done  Regra 10     x Compra And(OBV(i) > OBV (i − P), Asset Price(i) > Asset Price(i − P)) | P ∈ {1, 2, 3}
Done  Regra 11     x Compra RSI(i) < P  | P e {10, 20, 30}
Done  Regra 12     x Compra S(i) < P    | P e {10, 15, 20}
  Regra 13       hilo  
      */
bool CSvmTools::IsCompra(double SMA,double SMA_3,double EMA,double EMA_3,double CO,double CO_1,double WR,double S,double VOL)
  {

   if(SMA>SMA_3 && EMA>EMA_3 && (CO_1<0 && CO>0) && VOL>300 && S<15 && WR<-90)
   
      return(true);
   else
      return(false); // Otherwise -> return(false)*/
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CSvmTools::IsCompraSMA21(double SMA,double SMA_3)
  {
   if(SMA>SMA_3)
      return true;
   else
      return false;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CSvmTools::IsCompraEMA21(double EMA,double EMA_3)
  {
   if(EMA>EMA_3)
      return true;
   else
      return false;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CSvmTools::IsCompraCO(double CO,double CO_1)
  {
   if((CO_1 < 0) && (CO > 0))
      return true;
   else
      return false;
  }
  
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CSvmTools::IsCompraVROC(double VROC,int pVROC)
  {
   if(VROC > pVROC)
      return true;
   else
      return false;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CSvmTools::IsCompraAO(double AO,double AO_1)
  {
   if((AO > 0) && (AO_1 < 0))
      return true;
   else
      return false;
  }
  
  
   bool CSvmTools::IsCompraMACD(double macd,double macd_1,double sing,double sing_1)
   {
   if ((macd > sing) && (macd_1 < sing_1))
      return true;
   else
      return false;
  }  
  
  
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CSvmTools::IsCompraWR(double WR)
  {
   if(WR < -90)
      return true;
   else
      return false;
  }
  
  
 bool CSvmTools::IsCompraBB(double preAtivo,double preAtivo_1, double BBI, double BBI_1){
     if((preAtivo_1 < BBI_1) && (preAtivo > BBI))
         return true;
      else
         return false;  
           
     
 }  
 
 bool CSvmTools::IsCompraAD(double ad,double ad_P,double preAtivo,double preAtivo_P){
     if ((ad >  ad_P) && (preAtivo > preAtivo_P))
         return true;
      else
         return false;    
 }
 
 
 
 bool CSvmTools::IsCompraOBV(double obv,double obv_P,double preAtivo,double preAtivo_P){
   if ((obv > obv_P) && (preAtivo  > preAtivo_P ))
      return true;
   else
      return false;
   }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CSvmTools::IsCompraRSI(double RSI,int P)
  {
   if(RSI < P)
      return true;
   else
      return false;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CSvmTools::IsCompraST(double ST,int P)
  {
   if(ST < P)
      return true;
   else
      return false;
  }
  
  
bool  CSvmTools::IsCompraHILO(double hilo, double preco){
      if(hilo < preco)
         return true;
      else
         return false;
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
/*
           VENDA
  Regra 14        x  VENDA SMA P (i) < SMA P (i − 3) P ∈ {8, 9, 21}
  Regra 15        x  VENDA EMA P (i) < EMA P (i − 3) P ∈ {8, 9, 21}
  Regra 16        x  VENDA And(CO P (i − 1) > 0 , CO P (i) > 0) P ∈ {10, 15, 20}
  Regra 17        x  VENDA VROCp (i) > P | P e {120,150} 
  Regra 18        x  VENDA And(AOp(i) < 0 , AOp(i-1) > 0)| P ∈ {8, 14, 21}
  Regra 19        x  VENDA WR P (i) > − 10 P ∈ {8, 9, 21}
  Regra 20        x  VENDA And(MACDp(i) < Sing(i), MACD[i-1] > Sing[i-1]) | P e {12,26,9}
  Regra 21        x  VENDA And(PrecoAtivo(i−1) < BBS20(i−1);PrecoAtivo(i) > BBS20(i)) P {20,14,24} 
  Regra 22        x  VENDA And(AD(i) < AD(i − P), Asset Price(i) < Asset Price(i − P)) P ∈ {1, 2, 3}
  Regra 23        x  VENDA And(OBV (i)< OBV (i − P), Asset Price(i) < Asset Price(i − P)) P ∈ {1, 2, 3}
  Regra 24        x  VENDA RSI (i)>P P ∈ {70, 80, 90}
  Regra 25        x  VENDA S(i)> P P ∈ {80, 85, 90}
  Regra 26        Hilo  
       */
bool CSvmTools::IsVenda(double SMA,double SMA_3,double EMA,double EMA_3,double CO,double CO_1,double WR,double S,double VOL)
  {
   if(SMA<SMA_3 && EMA<EMA_3 && (CO_1>0 && CO>0) && VOL>300 && S>85 && WR>-10)
      return(true);
   else
      return(false);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CSvmTools::IsVendaSMA21(double SMA,double SMA_3)
  {
   if(SMA < SMA_3)
      return true;
   else
      return false;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CSvmTools::IsVendaEMA21(double EMA,double EMA_3)
  {
   if(EMA < EMA_3)
      return true;
   else
      return false;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CSvmTools::IsVendaCO(double CO,double CO_1)
  {
   if((CO_1 > 0) && (CO > 0))
      return true;
   else
      return false;
  }
  
  //+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CSvmTools::IsVendaVROC(double VROC,int pVROC)
  {
   if(VROC > pVROC)
      return true;
   else
      return false;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CSvmTools::IsVendaAO(double AO,double AO_1)
  {
   if((AO < 0) && (AO_1 > 0))
      return true;
   else
      return false;
  }  
  
  bool CSvmTools::IsVendaMACD(double macd,double macd_1,double sing,double sing_1)
   {
   if ((macd < sing) && (macd_1 > sing_1))
      return true;
   else
      return false;
  }  
  
bool CSvmTools::IsVendaWR(double WR)
  {
   if(WR > -10)
      return true;
   else
      return false;
  }
  
bool CSvmTools::IsVendaBB(double preAtivo,double preAtivo_1, double BBS, double BBS_1){
   if((preAtivo_1 < BBS_1) && (preAtivo > BBS))
      return true;
   else
      return false;
  
}  
bool CSvmTools::IsVendaAD(double ad,double ad_P,double preAtivo,double preAtivo_P){
    if( (ad < ad_P) && (preAtivo < preAtivo_P))
     return true;
   else
      return false;
}

bool CSvmTools::IsVendaOBV(double obv,double obv_P,double preAtivo,double preAtivo_P){
   if ((obv < obv_P) && (preAtivo  < preAtivo_P ))
      return true;
   else
      return false;
   }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CSvmTools::IsVendaRSI(double RSI,int P)
  {
   if(RSI > P)
      return true;
   else
      return false;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CSvmTools::IsVendaST(double ST,int P)
  {
   if(ST > P)
      return true;
   else
      return false;
  }
  
  
bool  CSvmTools::IsVendaHILO(double hilo, double preco){
      if(hilo > preco)
         return true;
      else
         return false;
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
novoCandle CSvmTools::verificaNewCandle(double SMA,double SMA_3,double EMA,double EMA_3,double CO,double CO_1,double VROC,int pVROC,
                                        double AO,double AO_1,double WR,double MACD,double MACD_1,double SING,double SING_1,
                                        double preAtivo,double preAtivo_1,double BBI,double BBI_1,double BBS,double BBS_1,
                                        double ap,double ad_P,double preAtivo_P,double obv,double obv_P,
                                        double RSI,int pa_RSI_C,int pa_RSI_V,double ST,int pa_ST_C,int pa_ST_V,double hilo)
  {
   novoCandle candidato;
   candidato.candle = "";
   candidato.cont = 0;
   
   int contador = 0;
//Se Comprar
   if(IsCompraSMA21(SMA,SMA_3))
     {
      candidato.candle+=" 1:1";
      contador++;
     }
   if(IsCompraEMA21(EMA,EMA_3))
     {
      candidato.candle+=" 2:1";
      contador++;
     }
   if(IsCompraCO(CO,CO_1))
     {
      candidato.candle+=" 3:1";
      contador++;
     }
   if(IsCompraVROC(VROC,pVROC))
     {
      candidato.candle+=" 4:1";
      contador++;
     }
   if(IsCompraAO(AO,AO_1))
     {
      candidato.candle+=" 5:1";
      contador++;
     }
    if(IsCompraWR(WR))
     {
      candidato.candle+=" 6:1";
      contador++;
     }
    if(IsCompraMACD(MACD,MACD_1,SING,SING_1))
     {
      candidato.candle+=" 7:1";
      contador++;
     }

   if (IsCompraBB(preAtivo,preAtivo_1,BBI,BBI_1)){  
       candidato.candle+=" 8:1";
       contador++;
   }
   if (IsCompraAD(ap,ad_P,preAtivo,preAtivo_P)){  
       candidato.candle+=" 9:1";
       contador++;
   }
   if (IsCompraOBV(obv,obv_P,preAtivo,preAtivo_P)){  
       candidato.candle+=" 10:1";
       contador++;
   }
   if(IsCompraRSI(RSI,pa_RSI_C))
     {
      candidato.candle+=" 11:1";
      contador++;
     }
   if(IsCompraST(ST,pa_ST_C))
     {
      candidato.candle+=" 12:1";
      contador++;
     }
   /*  if(IsCompraHILO(hilo,preAtivo))
     {
      candidato.candle+=" 13:1";
      contador++;
     }*/

//Se Venda 
  if(IsVendaSMA21(SMA,SMA_3))
     {
      candidato.candle+=" 14:1";
      contador++;
     }
   if(IsVendaEMA21(EMA,EMA_3))
     {
      candidato.candle+=" 15:1";
      contador++;
     }
     
   if(IsVendaCO(CO,CO_1))
     {
      candidato.candle+=" 16:1";
      contador++;
     }
   if(IsVendaVROC(VROC,pVROC))
     {
      candidato.candle+=" 17:1";
      contador++;
     }
  if(IsVendaAO(AO,AO_1))
     {
      candidato.candle+=" 18:1";
      contador++;
     }
  if(IsVendaWR(WR))
     {
      candidato.candle+=" 19:1";
      contador++;
     }
   if(IsVendaMACD(MACD,MACD_1,SING,SING_1))
     {
      candidato.candle+=" 20:1";
      contador++;
     }
  if (IsVendaBB(preAtivo,preAtivo_1,BBS,BBS_1)){  
       candidato.candle+=" 21:1";
       contador++;
   }
   if (IsVendaAD(ap,ad_P,preAtivo,preAtivo_P)){  
       candidato.candle+=" 22:1";
       contador++;
   }
    if (IsVendaOBV(obv,obv_P,preAtivo,preAtivo_P)){  
       candidato.candle+=" 23:1";
       contador++;
   }    
   if(IsVendaRSI(RSI,pa_RSI_V))
     {
      candidato.candle+=" 24:1";
      contador++;
     }
   if(IsVendaST(ST,pa_ST_V))
     {
      candidato.candle+=" 25:1";
      contador++;
     }
  /* if(IsVendaHILO(hilo,preAtivo))
     {
      candidato.candle+=" 26:1";
      contador++;
     }
   */
      candidato.cont = contador;
   return candidato;
  }
