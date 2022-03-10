%通用单纯形法主程序
clear;close all;clc;

%载入数据
A=load('Adata.txt');
B=load('Bdata.txt');
C=load('Cdata.txt');

%寻找基变量
[m n]=size(A);
[ indexUnitMatrix,Unit ] = seekUnitMatrix( A );

%判断类型
if size(indexUnitMatrix)==m
    X=indexUnitMatrix;
    [Sol,Opti,kk,XB,a,b]=SimplexMethod(A,B,C,X);     %无人工变量
else
    U=eye(m); 
    
    if indexUnitMatrix==0
    a_arti=[A U];       %加入人工变量
    c_arti=[zeros(1,n) -1.*ones(1,size(U,2))]';
    X_arti=[n+1:n+size(U,2)];
    [Sol,w,kk,XB,a,b]=SimplexMethod(a_arti,B,c_arti,X_arti);
    else
    U(:,Unit)=[];
    a_arti=[A U];       %加入人工变量
    c_arti=[zeros(1,n) -1.*ones(1,size(U,2))]';
    X_arti=[indexUnitMatrix n+1:n+size(U,2)];
    [Sol,w,kk,XB,a,b]=SimplexMethod(a_arti,B,c_arti,X_arti);
    end
        
    if w==0
    a(:,n+1:n+size(U,2))=[];    %排除人工变量
    [Sol,Opti,kk,XB,a,b]=SimplexMethod(a,b,C,XB);
    else
        disp('该问题无解')
    end
end

%输出最优解和目标函数值（Max输出Opti，Min输出-Opti）
Sol
-Opti
