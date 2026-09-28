set ModuleHierarchy {[{
"Name" : "gemm", "RefName" : "gemm","ID" : "0","Type" : "sequential",
"SubInsts" : [
	{"Name" : "grp_gemm_Pipeline_1_fu_199", "RefName" : "gemm_Pipeline_1","ID" : "1","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "Loop 1","RefName" : "Loop 1","ID" : "2","Type" : "pipeline"},]},],
"SubLoops" : [
	{"Name" : "i_loop","RefName" : "i_loop","ID" : "3","Type" : "no",
	"SubInsts" : [
	{"Name" : "grp_gemm_Pipeline_wb_loop_fu_205", "RefName" : "gemm_Pipeline_wb_loop","ID" : "4","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "wb_loop","RefName" : "wb_loop","ID" : "5","Type" : "pipeline"},]},],
	"SubLoops" : [
	{"Name" : "k_loop","RefName" : "k_loop","ID" : "6","Type" : "no",
		"SubInsts" : [
		{"Name" : "grp_gemm_Pipeline_j_loop_fu_214", "RefName" : "gemm_Pipeline_j_loop","ID" : "7","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "j_loop","RefName" : "j_loop","ID" : "8","Type" : "pipeline"},]},]},]},]
}]}