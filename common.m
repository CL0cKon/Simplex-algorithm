%ͨ�õ����η�������
clear;close all;clc;

%��������
A=load('Adata.txt');
B=load('Bdata.txt');
C=load('Cdata.txt');

%Ѱ�һ�����
[m n]=size(A);
[ indexUnitMatrix,Unit ] = seekUnitMatrix( A );

%�ж�����
if size(indexUnitMatrix)==m
    X=indexUnitMatrix;
    [Sol,Opti,kk,XB,a,b]=SimplexMethod(A,B,C,X);     %���˹�����
else
    U=eye(m); 
    
    if indexUnitMatrix==0
    a_arti=[A U];       %�����˹�����
    c_arti=[zeros(1,n) -1.*ones(1,size(U,2))]';
    X_arti=[n+1:n+size(U,2)];
    [Sol,w,kk,XB,a,b]=SimplexMethod(a_arti,B,c_arti,X_arti);
    else
    U(:,Unit)=[];
    a_arti=[A U];       %�����˹�����
    c_arti=[zeros(1,n) -1.*ones(1,size(U,2))]';
    X_arti=[indexUnitMatrix n+1:n+size(U,2)];
    [Sol,w,kk,XB,a,b]=SimplexMethod(a_arti,B,c_arti,X_arti);
    end
        
    if w==0
    a(:,n+1:n+size(U,2))=[];    %�ų��˹�����
    [Sol,Opti,kk,XB,a,b]=SimplexMethod(a,b,C,XB);
    else
        disp('�������޽�')
    end
end

%������Ž��Ŀ�꺯��ֵ��Max���Opti��Min���-Opti��
Sol
-Opti
