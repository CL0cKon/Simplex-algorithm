function [ indexUnitMatrix,Unit ] = seekUnitMatrix( inputMatrix )
%seekUnitMatrix �Ӿ��󣨿��Բ��Ƿ������ҵ����Թ��ɵ�λ�������
%parameter:inputMatrix---->�������
%return:indexUnitMatrix--->����˳�򹹳ɵ�λ�����е���ţ��������ɵ�λ�����򷵻�0
%return:Unit--->����˳�򹹳ɵ�λ��������ڵ�λ�����е���ţ��������ɵ�λ�����򷵻�0

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
             break; % ���ܴ��ڶ�������ͬ�ģ�ֻҪһ�е���������
            end
        end
    end
end
if isempty(indexUnitMatrix)
    indexUnitMatrix = 0;
    Unit = 0;
end
end