set ModuleHierarchy {[{
"Name" : "gemm", "RefName" : "gemm","ID" : "0","Type" : "sequential",
"SubLoops" : [
	{"Name" : "VITIS_LOOP_39_1","RefName" : "VITIS_LOOP_39_1","ID" : "1","Type" : "no",
	"SubInsts" : [
	{"Name" : "grp_gemm_Pipeline_1_fu_199", "RefName" : "gemm_Pipeline_1","ID" : "2","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "Loop 1","RefName" : "Loop 1","ID" : "3","Type" : "pipeline"},]},
	{"Name" : "grp_gemm_Pipeline_VITIS_LOOP_48_4_fu_204", "RefName" : "gemm_Pipeline_VITIS_LOOP_48_4","ID" : "4","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_48_4","RefName" : "VITIS_LOOP_48_4","ID" : "5","Type" : "pipeline"},]},],
	"SubLoops" : [
	{"Name" : "VITIS_LOOP_41_2","RefName" : "VITIS_LOOP_41_2","ID" : "6","Type" : "no",
		"SubInsts" : [
		{"Name" : "grp_gemm_Pipeline_VITIS_LOOP_43_3_fu_213", "RefName" : "gemm_Pipeline_VITIS_LOOP_43_3","ID" : "7","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "VITIS_LOOP_43_3","RefName" : "VITIS_LOOP_43_3","ID" : "8","Type" : "pipeline"},]},]},]},]
}]}