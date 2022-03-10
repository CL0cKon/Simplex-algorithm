%%程序使用说明

Adata,Bdata,Cdata需要手动输入。其中，Adata输入系数矩阵；Bdata输入资源向量；Cdata输入价值变量。B，C输入形式为列向量。

该程序使用以下的标准型：

	max z=CX
	AX=B
	X>=0

注：common为主程序，输出有需要手动调整之处。此程序没有考虑退化情况。

