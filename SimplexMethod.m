function [Sol,Opti,kk,Xb,a,b]=SimplexMethod(A,B,C,X)
%单纯形表计算程序

[m,n]=size(A);
Xb=X;               %基变量下标
Cb=C(Xb);            %基变量价值系数
Sigma=C-A'*Cb;              %计算初始检验数
flag=1;
kk=0;                 %迭代次数

%迭代
while(1)
    [SigmaMax,k]=max(Sigma);        
    if SigmaMax<=0              %检验数全小于或等于零，得到最优解
        flag=1;
        break;
    else
        SigPos=find(Sigma>0);
    end
    if all(A(:,SigPos)<=0)      %Pk小于或等于零
        flag=0;
        break;
    else
        APos=find(A(:,k)>0);
        [theta,r]=min(B(APos)./A(APos,k));
        l=APos(r);              %找出θ与主元
    end
    
        Xb(l)=k;
        Cb(l)=C(k);             %更改Xb与Cb
        kk=kk+1;
        
%高斯消去法
    a=A(:,k);                   %保留A的第k列
    %更新A
    A(l,:)=A(l,:)/A(l,k);
    for i=1:m
        if i~=l
            A(i,:)=A(i,:)-A(i,k)*A(l,:);
        end
    end
    
    %更新B
    for i=1:m
        if i==l
            B(i)=theta;
        else
            B(i)=B(i)-a(i)*theta;
        end
    end
    
    %计算Sigma
    Sigma=C-A'*Cb;
end

if flag==1
    disp('已找到最优解');
    Sol=zeros(n,1);
    index=Xb;
    for i=1:length(index)
    Sol(index(i))=B(i);
    end
    Opti=C'*Sol;
else
    disp('该问题无解');
end
    a=A;
    b=B;
    
end