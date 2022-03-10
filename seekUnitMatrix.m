function [ indexUnitMatrix,Unit ] = seekUnitMatrix( inputMatrix )
%seekUnitMatrix 从矩阵（可以不是方阵）中找到可以构成单位矩阵的列
%parameter:inputMatrix---->输入矩阵
%return:indexUnitMatrix--->可以顺序构成单位矩阵列的序号，若构不成单位矩阵，则返回0
%return:Unit--->可以顺序构成单位矩阵的列在单位矩阵中的序号，若构不成单位矩阵，则返回0

indexUnitMatrix = [];
Unit=[];
[row_inputMatrix,colomn_inputMatrix] = size(inputMatrix);
if row_inputMatrix <= colomn_inputMatrix
    for i = 1:row_inputMatrix
        E = zeros(row_inputMatrix,1);
        E(i) = 1;
        for j = 1:colomn_inputMatrix
            if all(inputMatrix(:,j)==E)
                Unit = [Unit,i];
                indexUnitMatrix = [indexUnitMatrix,j];
             break; % 可能存在多列是相同的，只要一列的索引就行
            end
        end
    end
end
if isempty(indexUnitMatrix)
    indexUnitMatrix = 0;
    Unit = 0;
end
end