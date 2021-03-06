//+------------------------------------------------------------------+
//|                                                        Tools.mqh |
//|                                               Diego Maicon Silva |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Diego Maicon Silva"
#property link      "https://www.mql5.com"

#include <Thaler\CSvmTools.mqh>
CSvmTools svmTools;

class Tools{
         private:
         
         public:
             Tools();
            ~Tools();
            
         struct candidatoNoSVM{ 
            int   tendencia;     // Indicadores tendência
            int   oscilador;     // Indicadores osciladores
            int   volume;        // Indicadores vol
            int   compra;
            int   venda;
           };
           
         candidatoNoSVM verificaNewCandleNoSVM(double SMA,double SMA_3,double EMA,double EMA_3,double CO,double CO_1,double VROC,int pVROC,
                                                 double AO,double AO_1,double WR,double MACD,double MACD_1,double SING,double SING_1,
                                                 double preAtivo,double preAtivo_1,double BBI,double BBI_1,double BBS,double BBS_1,
                                                 double ap,double ad_P,double preAtivo_P,double obv,double obv_P,
                                                 double RSI,int pa_RSI_C,int pa_RSI_V,double ST,int pa_ST_C,int pa_ST_V,double hilo);
         
         
};
         
         
         
         
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
Tools::Tools()
  {
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
Tools::~Tools()
  {
  }
//+------------------------------------------------------------------+
    
  
                     
                     
  candidatoNoSVM Tools::verificaNewCandleNoSVM(double SMA,double SMA_3,double EMA,double EMA_3,double CO,double CO_1,double VROC,int pVROC,double AO,double AO_1,double WR,double MACD,double MACD_1,double SING,double SING_1,double preAtivo,double preAtivo_1,double BBI,double BBI_1,double BBS,double BBS_1,double ap,double ad_P,double preAtivo_P,double obv,double obv_P,double RSI,int pa_RSI_C,int pa_RSI_V,double ST,int pa_ST_C,int pa_ST_V,double hilo){
         
         candidatoNoSVM c;
         c.compra=0;
         c.venda=0; 
         c.oscilador=0;c.tendencia=0;c.volume=0;   
         
               
           //-----Tendência
              if(svmTools.IsCompraSMA21(SMA,SMA_3))
                 {
                  c.tendencia++;
                  c.compra++;
                 }
               if(svmTools.IsCompraEMA21(EMA,EMA_3))
                 {
                  c.tendencia++;
                  c.compra++;
                 }
               if (svmTools.IsCompraBB(preAtivo,preAtivo_1,BBI,BBI_1)){  
                   c.tendencia++;
                   c.compra++;
               }  
               
               if(svmTools.IsCompraHILO(hilo,preAtivo))
                 {
                  c.tendencia++;
                  c.compra++;
                 }
            //-- Oscilador      
               if(svmTools.IsCompraCO(CO,CO_1))
                 {
                  c.oscilador++;
                  c.compra++;
                 }
                if(svmTools.IsCompraWR(WR))
                 {
                  c.oscilador++;
                  c.compra++;
                 }  
                
                if(svmTools.IsCompraMACD(MACD,MACD_1,SING,SING_1))
                 {
                  c.oscilador++;
                  c.compra++;
                 }
               
               if(svmTools.IsCompraRSI(RSI,pa_RSI_C))
                 {
                  c.oscilador++;
                  c.compra++;
                 }
                if(svmTools.IsCompraST(ST,pa_ST_C))
                 {
                  c.oscilador++;
                  c.compra++;
                 }
                if(svmTools.IsCompraAO(AO,AO_1))
                    {
                     c.oscilador++;
                     c.compra++;
                    }   
              //--Volume 
               if (svmTools.IsCompraAD(ap,ad_P,preAtivo,preAtivo_P)){  
                   c.volume++;
                   c.compra++;
               }
               
               if(svmTools.IsCompraVROC(VROC,pVROC))
                 {
                  c.volume++;
                  c.compra++;
                 }
                 
               if (svmTools.IsCompraOBV(obv,obv_P,preAtivo,preAtivo_P)){  
                   c.volume++;
                   c.compra++;
               }
               
           
            //--  Se Venda --------------------------------------------------------------------
              if(svmTools.IsVendaSMA21(SMA,SMA_3))
                 {
                  c.tendencia++;
                  c.venda++;
                 }
               if(svmTools.IsVendaEMA21(EMA,EMA_3))
                 {
                  c.tendencia++;
                  c.venda++;
                 }
                if(svmTools.IsVendaBB(preAtivo,preAtivo_1,BBS,BBS_1)){  
                   c.tendencia++;
                   c.venda++;
                  } 
                if(svmTools.IsVendaHILO(hilo,preAtivo))
                 {
                  c.tendencia++;
                  c.venda++;
                 }
                 
                 
            //--  Oscilador
               if(svmTools.IsVendaCO(CO,CO_1))
                 {
                  c.oscilador++;
                  c.venda++;
                 }   
               if(svmTools.IsVendaWR(WR))
                 {
                  c.oscilador++;
                  c.venda++;
                 }  
                if(svmTools.IsVendaMACD(MACD,MACD_1,SING,SING_1))
                 {
                  c.oscilador++;
                  c.venda++;
                 } 
               if(svmTools.IsVendaRSI(RSI,pa_RSI_V))
                 {
                  c.oscilador++;
                  c.venda++;
                 } 
               if(svmTools.IsVendaST(ST,pa_ST_V))
                 {
                  c.oscilador++;
                  c.venda++;
                 }
               if(svmTools.IsVendaAO(AO,AO_1))
                 {
                  c.oscilador++;
                  c.venda++;
                 }  
                 
             //--   Volume 
               if(svmTools.IsVendaAD(ap,ad_P,preAtivo,preAtivo_P)){  
                   c.volume++;
                   c.venda++;
               }
               if(svmTools.IsVendaVROC(VROC,pVROC))
                 {
                  c.volume++;
                  c.venda++;
                 }
               if(svmTools.IsVendaOBV(obv,obv_P,preAtivo,preAtivo_P)){  
                   c.volume++;
                   c.venda++;
               }    
             
         return c;  
  }