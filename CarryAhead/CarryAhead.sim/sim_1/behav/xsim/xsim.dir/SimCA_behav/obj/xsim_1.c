/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern int main(int, char**);
extern void execute_215(char*, char *);
extern void execute_10(char*, char *);
extern void execute_11(char*, char *);
extern void execute_12(char*, char *);
extern void execute_68(char*, char *);
extern void execute_188(char*, char *);
extern void execute_189(char*, char *);
extern void execute_191(char*, char *);
extern void execute_192(char*, char *);
extern void execute_194(char*, char *);
extern void execute_195(char*, char *);
extern void execute_197(char*, char *);
extern void execute_198(char*, char *);
extern void execute_200(char*, char *);
extern void execute_201(char*, char *);
extern void execute_203(char*, char *);
extern void execute_204(char*, char *);
extern void execute_206(char*, char *);
extern void execute_207(char*, char *);
extern void execute_209(char*, char *);
extern void execute_210(char*, char *);
extern void execute_212(char*, char *);
extern void execute_213(char*, char *);
extern void execute_15(char*, char *);
extern void execute_16(char*, char *);
extern void execute_17(char*, char *);
extern void execute_18(char*, char *);
funcp funcTab[27] = {(funcp)execute_215, (funcp)execute_10, (funcp)execute_11, (funcp)execute_12, (funcp)execute_68, (funcp)execute_188, (funcp)execute_189, (funcp)execute_191, (funcp)execute_192, (funcp)execute_194, (funcp)execute_195, (funcp)execute_197, (funcp)execute_198, (funcp)execute_200, (funcp)execute_201, (funcp)execute_203, (funcp)execute_204, (funcp)execute_206, (funcp)execute_207, (funcp)execute_209, (funcp)execute_210, (funcp)execute_212, (funcp)execute_213, (funcp)execute_15, (funcp)execute_16, (funcp)execute_17, (funcp)execute_18};
const int NumRelocateId= 27;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/SimCA_behav/xsim.reloc",  (void **)funcTab, 27);
	iki_vhdl_file_variable_register(dp + 19472);
	iki_vhdl_file_variable_register(dp + 19528);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/SimCA_behav/xsim.reloc");
}

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/SimCA_behav/xsim.reloc");
	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net
	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void relocate(char *);

void sensitize(char *);

void simulate(char *);

extern SYSTEMCLIB_IMP_DLLSPEC void local_register_implicit_channel(int, char*);
extern void implicit_HDL_SCinstatiate();

extern SYSTEMCLIB_IMP_DLLSPEC int xsim_argc_copy ;
extern SYSTEMCLIB_IMP_DLLSPEC char** xsim_argv_copy ;

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_sv_type_file_path_name("xsim.dir/SimCA_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/SimCA_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/SimCA_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
