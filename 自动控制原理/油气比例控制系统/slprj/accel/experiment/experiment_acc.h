#include "__cf_experiment.h"
#ifndef RTW_HEADER_experiment_acc_h_
#define RTW_HEADER_experiment_acc_h_
#include <stddef.h>
#include <float.h>
#ifndef experiment_acc_COMMON_INCLUDES_
#define experiment_acc_COMMON_INCLUDES_
#include <stdlib.h>
#define S_FUNCTION_NAME simulink_only_sfcn 
#define S_FUNCTION_LEVEL 2
#define RTW_GENERATED_S_FUNCTION
#include "rtwtypes.h"
#include "simstruc.h"
#include "fixedpoint.h"
#endif
#include "experiment_acc_types.h"
#include "multiword_types.h"
#include "mwmathutil.h"
#include "rt_defines.h"
#include "rt_nonfinite.h"
typedef struct { real_T B_1_0_0 ; real_T B_1_1_0 ; real_T B_1_3_0 ; real_T
B_1_5_0 ; real_T B_1_7_0 ; real_T B_1_8_0 ; real_T B_1_9_0 ; real_T B_1_10_0
; real_T B_1_11_0 ; real_T B_1_12_0 ; real_T B_0_0_1 ; } B_experiment_T ;
typedef struct { struct { real_T modelTStart ; } TransportDelay_RWORK ; void
* u_PWORK ; struct { void * TUbufferPtrs [ 2 ] ; } TransportDelay_PWORK ;
void * u_PWORK_a ; int32_T _sysIdxToRun ; struct { int_T Tail ; int_T Head ;
int_T Last ; int_T CircularBufSize ; int_T MaxNewBufSize ; }
TransportDelay_IWORK ; int_T Step_MODE ; char_T pad_Step_MODE [ 4 ] ; }
DW_experiment_T ; typedef struct { real_T _CSTATE ; real_T _CSTATE_n ; real_T
_CSTATE_a ; real_T _CSTATE_m ; } X_experiment_T ; typedef struct { real_T
_CSTATE ; real_T _CSTATE_n ; real_T _CSTATE_a ; real_T _CSTATE_m ; }
XDot_experiment_T ; typedef struct { boolean_T _CSTATE ; boolean_T _CSTATE_n
; boolean_T _CSTATE_a ; boolean_T _CSTATE_m ; } XDis_experiment_T ; typedef
struct { real_T _CSTATE ; real_T _CSTATE_n ; real_T _CSTATE_a ; real_T
_CSTATE_m ; } CStateAbsTol_experiment_T ; typedef struct { real_T
Step_StepTime_ZC ; } ZCV_experiment_T ; typedef struct { ZCSigState
Step_StepTime_ZCE ; } PrevZCX_experiment_T ; struct P_experiment_T_ { real_T
P_0 ; real_T P_1 ; real_T P_2 ; real_T P_3 ; real_T P_4 ; real_T P_5 ; real_T
P_6 ; real_T P_7 ; real_T P_8 ; real_T P_9 ; real_T P_10 ; real_T P_11 ;
real_T P_12 ; real_T P_13 ; real_T P_14 ; real_T P_15 ; } ; extern
P_experiment_T experiment_rtDefaultP ;
#endif
