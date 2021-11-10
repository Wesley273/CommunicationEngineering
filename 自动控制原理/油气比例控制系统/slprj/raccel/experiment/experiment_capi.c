#include "__cf_experiment.h"
#include "rtw_capi.h"
#ifdef HOST_CAPI_BUILD
#include "experiment_capi_host.h"
#define sizeof(s) ((size_t)(0xFFFF))
#undef rt_offsetof
#define rt_offsetof(s,el) ((uint16_T)(0xFFFF))
#define TARGET_CONST
#define TARGET_STRING(s) (s)    
#else
#include "builtin_typeid_types.h"
#include "experiment.h"
#include "experiment_capi.h"
#include "experiment_private.h"
#ifdef LIGHT_WEIGHT_CAPI
#define TARGET_CONST                  
#define TARGET_STRING(s)               (NULL)                    
#else
#define TARGET_CONST                   const
#define TARGET_STRING(s)               (s)
#endif
#endif
static const rtwCAPI_Signals rtBlockSignals [ ] = { { 0 , 0 , TARGET_STRING (
"experiment/Gain" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 1 , 0 ,
TARGET_STRING ( "experiment/Gain1" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 ,
0 } , { 2 , 0 , TARGET_STRING ( "experiment/Step" ) , TARGET_STRING (
"期望F/A" ) , 0 , 0 , 0 , 0 , 1 } , { 3 , 0 , TARGET_STRING (
"experiment/Sum" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 4 , 0 ,
TARGET_STRING ( "experiment/Sum1" ) , TARGET_STRING ( "e" ) , 0 , 0 , 0 , 0 ,
0 } , { 5 , 0 , TARGET_STRING ( "experiment/传感器滞后" ) , TARGET_STRING (
"" ) , 0 , 0 , 0 , 0 , 0 } , { 6 , 0 , TARGET_STRING (
"experiment/快速燃料流" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 7
, 0 , TARGET_STRING ( "experiment/慢速燃料流" ) , TARGET_STRING ( "" ) , 0 ,
0 , 0 , 0 , 0 } , { 8 , 0 , TARGET_STRING ( "experiment/控制规律" ) ,
TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 9 , 0 , TARGET_STRING (
"experiment/Transport Delay" ) , TARGET_STRING ( "实际F/A" ) , 0 , 0 , 0 , 0
, 0 } , { 0 , 0 , ( NULL ) , ( NULL ) , 0 , 0 , 0 , 0 , 0 } } ; static const
rtwCAPI_BlockParameters rtBlockParameters [ ] = { { 10 , TARGET_STRING (
"experiment/Gain" ) , TARGET_STRING ( "Gain" ) , 0 , 0 , 0 } , { 11 ,
TARGET_STRING ( "experiment/Gain1" ) , TARGET_STRING ( "Gain" ) , 0 , 0 , 0 }
, { 12 , TARGET_STRING ( "experiment/Step" ) , TARGET_STRING ( "Time" ) , 0 ,
0 , 0 } , { 13 , TARGET_STRING ( "experiment/Step" ) , TARGET_STRING (
"Before" ) , 0 , 0 , 0 } , { 14 , TARGET_STRING ( "experiment/Step" ) ,
TARGET_STRING ( "After" ) , 0 , 0 , 0 } , { 15 , TARGET_STRING (
"experiment/传感器滞后" ) , TARGET_STRING ( "A" ) , 0 , 0 , 0 } , { 16 ,
TARGET_STRING ( "experiment/传感器滞后" ) , TARGET_STRING ( "C" ) , 0 , 0 , 0
} , { 17 , TARGET_STRING ( "experiment/快速燃料流" ) , TARGET_STRING ( "A" )
, 0 , 0 , 0 } , { 18 , TARGET_STRING ( "experiment/快速燃料流" ) ,
TARGET_STRING ( "C" ) , 0 , 0 , 0 } , { 19 , TARGET_STRING (
"experiment/慢速燃料流" ) , TARGET_STRING ( "A" ) , 0 , 0 , 0 } , { 20 ,
TARGET_STRING ( "experiment/慢速燃料流" ) , TARGET_STRING ( "C" ) , 0 , 0 , 0
} , { 21 , TARGET_STRING ( "experiment/控制规律" ) , TARGET_STRING ( "A" ) ,
0 , 0 , 0 } , { 22 , TARGET_STRING ( "experiment/控制规律" ) , TARGET_STRING
( "C" ) , 0 , 0 , 0 } , { 23 , TARGET_STRING ( "experiment/控制规律" ) ,
TARGET_STRING ( "D" ) , 0 , 0 , 0 } , { 24 , TARGET_STRING (
"experiment/Transport Delay" ) , TARGET_STRING ( "DelayTime" ) , 0 , 0 , 0 }
, { 25 , TARGET_STRING ( "experiment/Transport Delay" ) , TARGET_STRING (
"InitialOutput" ) , 0 , 0 , 0 } , { 0 , ( NULL ) , ( NULL ) , 0 , 0 , 0 } } ;
static const rtwCAPI_ModelParameters rtModelParameters [ ] = { { 0 , ( NULL )
, 0 , 0 , 0 } } ;
#ifndef HOST_CAPI_BUILD
static void * rtDataAddrMap [ ] = { & rtB . dhwggqks43 , & rtB . h3rc1kv0s3 ,
& rtB . c2rqi2iah0 , & rtB . fj0bos2tb0 , & rtB . l511fkq3nx , & rtB .
nqpa2du5up , & rtB . nkt3zyzr03 , & rtB . jaay3j3x35 , & rtB . ej3tvyux3f , &
rtB . orr1ul5nd2 , & rtP . Gain_Gain , & rtP . Gain1_Gain , & rtP . Step_Time
, & rtP . Step_Y0 , & rtP . Step_YFinal , & rtP . _A , & rtP . _C , & rtP .
_A_aawihjtczj , & rtP . _C_o2qzxacspm , & rtP . _A_nyf10t0hos , & rtP .
_C_g3mxtq2o3f , & rtP . _A_outvcdxp1d , & rtP . _C_kqbv44p3fg , & rtP . _D ,
& rtP . TransportDelay_Delay , & rtP . TransportDelay_InitOutput , } ; static
int32_T * rtVarDimsAddrMap [ ] = { ( NULL ) } ;
#endif
static TARGET_CONST rtwCAPI_DataTypeMap rtDataTypeMap [ ] = { { "double" ,
"real_T" , 0 , 0 , sizeof ( real_T ) , SS_DOUBLE , 0 , 0 } } ;
#ifdef HOST_CAPI_BUILD
#undef sizeof
#endif
static TARGET_CONST rtwCAPI_ElementMap rtElementMap [ ] = { { ( NULL ) , 0 ,
0 , 0 , 0 } , } ; static const rtwCAPI_DimensionMap rtDimensionMap [ ] = { {
rtwCAPI_SCALAR , 0 , 2 , 0 } } ; static const uint_T rtDimensionArray [ ] = {
1 , 1 } ; static const real_T rtcapiStoredFloats [ ] = { 0.0 , 1.0 } ; static
const rtwCAPI_FixPtMap rtFixPtMap [ ] = { { ( NULL ) , ( NULL ) ,
rtwCAPI_FIX_RESERVED , 0 , 0 , 0 } , } ; static const rtwCAPI_SampleTimeMap
rtSampleTimeMap [ ] = { { ( const void * ) & rtcapiStoredFloats [ 0 ] , (
const void * ) & rtcapiStoredFloats [ 0 ] , 0 , 0 } , { ( const void * ) &
rtcapiStoredFloats [ 0 ] , ( const void * ) & rtcapiStoredFloats [ 1 ] , 1 ,
0 } } ; static rtwCAPI_ModelMappingStaticInfo mmiStatic = { { rtBlockSignals
, 10 , ( NULL ) , 0 , ( NULL ) , 0 } , { rtBlockParameters , 16 ,
rtModelParameters , 0 } , { ( NULL ) , 0 } , { rtDataTypeMap , rtDimensionMap
, rtFixPtMap , rtElementMap , rtSampleTimeMap , rtDimensionArray } , "float"
, { 2502144191U , 339682286U , 764250307U , 4100573306U } , ( NULL ) , 0 , 0
} ; const rtwCAPI_ModelMappingStaticInfo * experiment_GetCAPIStaticMap ( void
) { return & mmiStatic ; }
#ifndef HOST_CAPI_BUILD
void experiment_InitializeDataMapInfo ( void ) { rtwCAPI_SetVersion ( ( *
rt_dataMapInfoPtr ) . mmi , 1 ) ; rtwCAPI_SetStaticMap ( ( *
rt_dataMapInfoPtr ) . mmi , & mmiStatic ) ; rtwCAPI_SetLoggingStaticMap ( ( *
rt_dataMapInfoPtr ) . mmi , ( NULL ) ) ; rtwCAPI_SetDataAddressMap ( ( *
rt_dataMapInfoPtr ) . mmi , rtDataAddrMap ) ; rtwCAPI_SetVarDimsAddressMap (
( * rt_dataMapInfoPtr ) . mmi , rtVarDimsAddrMap ) ;
rtwCAPI_SetInstanceLoggingInfo ( ( * rt_dataMapInfoPtr ) . mmi , ( NULL ) ) ;
rtwCAPI_SetChildMMIArray ( ( * rt_dataMapInfoPtr ) . mmi , ( NULL ) ) ;
rtwCAPI_SetChildMMIArrayLen ( ( * rt_dataMapInfoPtr ) . mmi , 0 ) ; }
#else
#ifdef __cplusplus
extern "C" {
#endif
void experiment_host_InitializeDataMapInfo ( experiment_host_DataMapInfo_T *
dataMap , const char * path ) { rtwCAPI_SetVersion ( dataMap -> mmi , 1 ) ;
rtwCAPI_SetStaticMap ( dataMap -> mmi , & mmiStatic ) ;
rtwCAPI_SetDataAddressMap ( dataMap -> mmi , NULL ) ;
rtwCAPI_SetVarDimsAddressMap ( dataMap -> mmi , NULL ) ; rtwCAPI_SetPath (
dataMap -> mmi , path ) ; rtwCAPI_SetFullPath ( dataMap -> mmi , NULL ) ;
rtwCAPI_SetChildMMIArray ( dataMap -> mmi , ( NULL ) ) ;
rtwCAPI_SetChildMMIArrayLen ( dataMap -> mmi , 0 ) ; }
#ifdef __cplusplus
}
#endif
#endif
