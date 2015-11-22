/* Include files */
// Distribution Modeling sub-package
#include <oms_dist_support.h>
#include "headers\wban_math.h"
#include "headers\wban_params.h"
#include "headers\wban_struct.h"

/* Node configuration constants		*/

/* Special attribute values			*/
#define	SC_INFINITE_TIME		-1.0

/* Interrupt code values			*/
#define	SC_START			0
#define	SC_STOP				1

#define	SC_GEN_TF		    8

/* Input and output streams		*/
#define	STRM_FROM_UP_TO_MAC	0

/* State machine conditions 		*/
#define	START					((op_intrpt_type () == OPC_INTRPT_SELF) && (op_intrpt_code () == SC_START))
#define	DISABLED				((op_intrpt_type () == OPC_INTRPT_SELF) && (op_intrpt_code () == SC_STOP))
#define	STOP					((op_intrpt_type () == OPC_INTRPT_SELF) && (op_intrpt_code () == SC_STOP))

#define	MSDU_GEN ((op_intrpt_type () == OPC_INTRPT_SELF) && (op_intrpt_code () == SC_GEN_TF))

/* Function prototypes.				*/
static void wban_source_init (void);
static void wban_print_parameters (void);
static void wban_gen_tf_up(int up);

/* Global variables.				*/
extern int app_sent_msdu_nbr; // Number of MSDU generated by the Application Layer
extern double app_sent_msdu_bits; // MSDUs sent by the Application Layer [kbits]
