set ModuleHierarchy {[{
"Name" : "gemm", "RefName" : "gemm","ID" : "0","Type" : "sequential",
"SubInsts" : [
	{"Name" : "grp_gemm_Pipeline_zero_init_top_loop_zero_init_in_loop_fu_253", "RefName" : "gemm_Pipeline_zero_init_top_loop_zero_init_in_loop","ID" : "1","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "zero_init_top_loop_zero_init_in_loop","RefName" : "zero_init_top_loop_zero_init_in_loop","ID" : "2","Type" : "pipeline"},]},],
"SubLoops" : [
	{"Name" : "i_loop","RefName" : "i_loop","ID" : "3","Type" : "no",
	"SubInsts" : [
	{"Name" : "grp_gemm_Pipeline_arow_loop_fu_276", "RefName" : "gemm_Pipeline_arow_loop","ID" : "4","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "arow_loop","RefName" : "arow_loop","ID" : "5","Type" : "pipeline"},]},
	{"Name" : "grp_gemm_Pipeline_kj_loop_fu_285", "RefName" : "gemm_Pipeline_kj_loop","ID" : "6","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "kj_loop","RefName" : "kj_loop","ID" : "7","Type" : "pipeline"},]},
	{"Name" : "grp_gemm_Pipeline_wb_loop_fu_311", "RefName" : "gemm_Pipeline_wb_loop","ID" : "8","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "wb_loop","RefName" : "wb_loop","ID" : "9","Type" : "pipeline"},]},]},]
}]}