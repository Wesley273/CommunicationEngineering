#include "__cf_experiment.h"
#ifndef RTW_HEADER_experiment_h_
#define RTW_HEADER_experiment_h_
#include <stddef.h>
#include <float.h>
#include <string.h>
#include "rtw_modelmap.h"
#ifndef experiment_COMMON_INCLUDES_
#define experiment_COMMON_INCLUDES_
#include <stdlib.h>
#include "rtwtypes.h"
#include "simtarget/slSimTgtSigstreamRTW.h"
#include "simtarget/slSimTgtSlioCoreRTW.h"
#include "simtarget/slSimTgtSlioClientsRTW.h"
#include "simtarget/slSimTgtSlioSdiRTW.h"
#include "sigstream_rtw.h"
#include "simstruc.h"
#include "fixedpoint.h"
#include "raccel.h"
#include "slsv_diagnostic_codegen_c_api.h"
#include "rt_logging.h"
#include "dt_info.h"
#include "ext_work.h"
#endif
#include "experiment_types.h"
#include "multiword_types.h"
#include "mwmathutil.h"
#include "rt_defines.h"
#include "rtGetInf.h"
#include "rt_nonfinite.h"
#define MODEL_NAME experiment
#define NSAMPLE_TIMES (2) 
#define NINPUTS (0)       
#define NOUTPUTS (0)     
#define NBLOCKIO (10) 
#define NUM_ZC_EVENTS (0) 
#ifndef NCSTATES
#define NCSTATES (4)   
#elif NCSTATES != 4
#error Invalid specification of NCSTATES defined in compiler command
#endif
#ifndef rtmGetDataMapInfo
#define rtmGetDataMapInfo(rtm) (*rt_dataMapInfoPtr)
#endif
#ifndef rtmSetDataMapInfo
#define rtmSetDataMapInfo(rtm, val) (rt_dataMapInfoPtr = &val)
#endif
#ifndef IN_RACCEL_MAIN
#endif
typedef struct { real_T c2rqi2iah0 ; real_T nqpa2du5up ; real_T l511fkq3nx ;
real_T orr1ul5nd2 ; real_T ej3tvyux3f ; real_T dhwggqks43 ; real_T h3rc1kv0s3
; real_T nkt3zyzr03 ; real_T jaay3j3x35 ; real_T fj0bos2tb0 ; } B ; typedef
struct { struct { real_T modelTStart ; } eu2l1tx2i3 ; struct { void *
LoggedData ; } hiorts1iwr ; struct { void * TUbufferPtrs [ 2 ] ; } np2wettfn0
; struct { void * LoggedData ; } fr50kfzev3 ; struct { int_T Tail ; int_T
Head ; int_T Last ; int_T CircularBufSize ; int_T MaxNewBufSize ; }
m5n5qebodq ; int_T bp5400sfn1 ; } DW ; typedef struct { real_T fmuvtqo1m0 ;
real_T gs55yrc542 ; real_T ch1dnq0ikj ; real_T kgtnhjige0 ; } X ; typedef
struct { real_T fmuvtqo1m0 ; real_T gs55yrc542 ; real_T ch1dnq0ikj ; real_T
kgtnhjige0 ; } XDot ; typedef struct { boolean_T fmuvtqo1m0 ; boolean_T
gs55yrc542 ; boolean_T ch1dnq0ikj ; boolean_T kgtnhjige0 ; } XDis ; typedef
struct { real_T fmuvtqo1m0 ; real_T gs55yrc542 ; real_T ch1dnq0ikj ; real_T
kgtnhjige0 ; } CStateAbsTol ; typedef struct { real_T ghnyu4zqcu ; } ZCV ;
typedef struct { rtwCAPI_ModelMappingInfo mmi ; } DataMapInfo ; struct P_ {
real_T Step_Time ; real_T Step_Y0 ; real_T Step_YFinal ; real_T _A ; real_T
_C ; real_T TransportDelay_Delay ; real_T TransportDelay_InitOutput ; real_T
_A_outvcdxp1d ; real_T _C_kqbv44p3fg ; real_T _D ; real_T Gain_Gain ; real_T
Gain1_Gain ; real_T _A_aawihjtczj ; real_T _C_o2qzxacspm ; real_T
_A_nyf10t0hos ; real_T _C_g3mxtq2o3f ; } ; extern const char *
RT_MEMORY_ALLOCATION_ERROR ; extern B rtB ; extern X rtX ; extern DW rtDW ;
extern P rtP ; extern const rtwCAPI_ModelMappingStaticInfo *
experiment_GetCAPIStaticMap ( void ) ; extern SimStruct * const rtS ; extern
const int_T gblNumToFiles ; extern const int_T gblNumFrFiles ; extern const
int_T gblNumFrWksBlocks ; extern rtInportTUtable * gblInportTUtables ; extern
const char * gblInportFileName ; extern const int_T gblNumRootInportBlks ;
extern const int_T gblNumModelInputs ; extern const int_T
gblInportDataTypeIdx [ ] ; extern const int_T gblInportDims [ ] ; extern
const int_T gblInportComplex [ ] ; extern const int_T gblInportInterpoFlag [
] ; extern const int_T gblInportContinuous [ ] ; extern const int_T
gblParameterTuningTid ; extern DataMapInfo * rt_dataMapInfoPtr ; extern
rtwCAPI_ModelMappingInfo * rt_modelMapInfoPtr ; void MdlOutputs ( int_T tid )
; void MdlOutputsParameterSampleTime ( int_T tid ) ; void MdlUpdate ( int_T
tid ) ; void MdlTerminate ( void ) ; void MdlInitializeSizes ( void ) ; void
MdlInitializeSampleTimes ( void ) ; SimStruct * raccel_register_model ( void
) ;
#endif
