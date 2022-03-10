function [Sol,Opti,kk,Xb,a,b]=SimplexMethod(A,B,C,X)
%�����α�������

[m,n]=size(A);
Xb=X;               %�������±�
Cb=C(Xb);            %��������ֵϵ��
Sigma=C-A'*Cb;              %�����ʼ������
flag=1;
kk=0;                 %��������

%����
while(1)
    [SigmaMax,k]=max(Sigma);        
    if SigmaMax<=0              %������ȫС�ڻ�����㣬�õ����Ž�
        flag=1;
        break;
    else
        SigPos=find(Sigma>0);
    end
    if all(A(:,SigPos)<=0)      %PkС�ڻ������
        flag=0;
        break;
    else
        APos=find(A(:,k)>0);
        [theta,r]=min(B(APos)./A(APos,k));
        l=APos(r);              %�ҳ�������Ԫ
    end
    
        Xb(l)=k;
        Cb(l)=C(k);             %����Xb��Cb
        kk=kk+1;
        
%��˹��ȥ��
    a=A(:,k);                   %����A�ĵ�k��
    %����A
    A(l,:)=A(l,:)/A(l,k);
    for i=1:m
        if i~=l
            A(i,:)=A(i,:)-A(i,k)*A(l,:);
        end
    end
    
    %����B
    for i=1:m
        if i==l
            B(i)=theta;
        else
            B(i)=B(i)-a(i)*theta;
        end
    end
    
    %����Sigma
    Sigma=C-A'*Cb;
end

if flag==1
    disp('���ҵ����Ž�');
    Sol=zeros(n,1);
    index=Xb;
    for i=1:length(index)
    Sol(index(i))=B(i);
    end
    Opti=C'*Sol;
else
    disp('�������޽�');
end
    a=A;
    b=B;
    
end