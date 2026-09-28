set ModuleHierarchy {[{
"Name" : "gemm", "RefName" : "gemm","ID" : "0","Type" : "sequential",
"SubInsts" : [
	{"Name" : "grp_gemm_Pipeline_1_fu_199", "RefName" : "gemm_Pipeline_1","ID" : "1","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "Loop 1","RefName" : "Loop 1","ID" : "2","Type" : "pipeline"},]},],
"SubLoops" : [
	{"Name" : "VITIS_LOOP_39_1","RefName" : "VITIS_LOOP_39_1","ID" : "3","Type" : "no",
	"SubInsts" : [
	{"Name" : "grp_gemm_Pipeline_VITIS_LOOP_47_4_fu_205", "RefName" : "gemm_Pipeline_VITIS_LOOP_47_4","ID" : "4","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_47_4","RefName" : "VITIS_LOOP_47_4","ID" : "5","Type" : "pipeline"},]},],
	"SubLoops" : [
	{"Name" : "VITIS_LOOP_40_2","RefName" : "VITIS_LOOP_40_2","ID" : "6","Type" : "no",
		"SubInsts" : [
		{"Name" : "grp_gemm_Pipeline_VITIS_LOOP_42_3_fu_214", "RefName" : "gemm_Pipeline_VITIS_LOOP_42_3","ID" : "7","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "VITIS_LOOP_42_3","RefName" : "VITIS_LOOP_42_3","ID" : "8","Type" : "pipeline"},]},]},]},]
}]}