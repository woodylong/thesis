clear;
clc;
%提取数据%
data1=xlsread('999999.xls','B2:F2202');
%计算收益率
data2=[data1,100.*(data1(:,4)-data1(:,1))./data1(:,1)];
A=length(data2(:,6));%数据长度
%波动率
% data9=[var(data2(:,1)),var(data2(:,2)),var(data2(:,3)),var(data2(:,4)),var(data2(:,5)),var(data2(:,6))];
%%规范化
v=data2(1:A-1,5);
v2=data2(1:A-1,4)-data2(1:A-1,1);
v3=data2(1:A-1,2)-data2(1:A-1,3);
v4=data2(2:A,1)-data2(1:A-1,1);
V2=(v2-max(v2))/(max(v2)-min(v2));
V3=(v3-max(v3))/(max(v3)-min(v3));
V=(v-max(v))/(max(v)-min(v));
V4=(v4-max(v4))/(max(v4)-min(v4));
sample=[V,V2,V3,V4,data2(2:A,6)];
for i=1:1:A-1
    if sample(i,5)>0
        sample(i,5)=1;
    else 
        sample(i,5)=0;
    end
end
% svmStruct=svmtrain(data999(:,1:2),data999(:,3),'showplot',true,'kernel_function','quadratic');
%linear
%
% svmStruct=svmtrain(data999(:,1:4),data999(:,5),'kernel_function','rbf');

%
%网格法验证
Sample=sample(:,1:4);
grp=sample(:,5);
% C=[-1 0 1]; 
% rbf_sigma=[-1 0 1 ];
% c=cvpartition(grp,'k',10); 
% minfn = @(z)crossval('mcr',Sample,grp,'Predfun', ...
%     @(xtrain,ytrain,xtest)crossfun(xtrain,ytrain,...
%     xtest,exp(z(1)),exp(z(2))),'partition',c);
%  opts = optimset('MaxIter',10); 
% for i=1:size(C,2)
%     for j=1:size(rbf_sigma,2)
%         [searchmin fval] = fminsearch(minfn,[rbf_sigma(j);C(i)],opts);
% k(i,j)=fval;
%     end
% end
svmStruct= svmtrain(Sample,grp,'Kernel_Function','rbf',...
   'rbf_sigma',exp(-1),'boxconstraint',exp(-1));
% vvv=svmclassify(svmStruct,data99(:,1:4));
%

% svmStruct=svmtrain(data999(:,1:2),data999(:,3),'showplot',true,'kernel_function','rbf');
%quadratic 

%验证
data2222=xlsread('999999.xls','B2203:F3202');
data22=[data2222,100.*(data2222(:,4)-data2222(:,1))./data2222(:,1)];
B=length(data22(:,6));
vb=data22(1:B-1,5);
vb2=data22(1:B-1,4)-data2(1:B-1,1);
vb3=data22(1:B-1,2)-data2(1:B-1,3);
vb4=data22(2:B,1)-data2(1:B-1,1);
Vb2=(vb2-max(vb2))/(max(vb2)-min(vb2));
Vb3=(vb3-max(vb3))/(max(vb3)-min(vb3));
Vb=(vb-max(vb))/(max(vb)-min(vb));
Vb4=(vb4-max(vb4))/(max(vb4)-min(vb4));
sampleb=[Vb,Vb2,Vb3,Vb4,data22(2:B,6)];
% 交叉测试用于调整rbf核和惩罚系数
% 
% C1=5:0.5:11;
% sigma1=-1:0.25:3; 
% k1(1:size(C1,2),1:size(sigma1,2))=zeros(size(C1,2),size(sigma1,2));
% for i=1:size(C1,2)
%     for j=1:size(sigma1,2)
%         [searchmin fval] = fminsearch(minfn,[sigma1(1,j);C1(1,i)],opts);
%         k1(i,j)=fval;
%     end
% end
% svmStruct= svmtrain(xtrain,ytrain,'Kernel_Function','rbf',...
%    'rbf_sigma',sigma,'boxconstraint',C);

%

vvv=svmclassify(svmStruct,sampleb(:,1:4));
for i=1:1:B-1
    if sampleb(i,5)>0
        sampleb(i,5)=1;
    else 
        sampleb(i,5)=0;
    end
end
CCC=length(vvv);
YY=[vvv,sampleb(:,5)];
for iii=1:1:CCC
    if YY(iii,1)==0 && YY(iii,2)==0
        KK(iii,1)=1;
    else if YY(iii,1)==1&&YY(iii,2)==1
            KK(iii,1)=1;
        else
            KK(iii,1)=0;
        end
        end
end
KKKK=sum(KK)/length(KK);