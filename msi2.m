clear;
clc;
%提取数据%
data1=xlsread('999999.xls','B2:F2202');
%计算收益率
data2=[data1,100.*(data1(:,4)-data1(:,1))./data1(:,1)];
[a,b]=max(data2(:,6));
[a1,b1]=min(data2(:,6));
k=sum(data2(:,6))/length(data2(:,6));%均值
m=mean(data2(:,6));
v=var(data2(:,6));%方差
A=length(data2(:,6));%数据长度
%波动率
r1=data2(2:A,1)-data2(1:A-1,1);
r2=data2(2:A,1)-data2(1:A-1,4);
r3=data2(1:A-1,4)-data2(1:A-1,1);
r4=data2(1:A-1,2)-data2(1:A-1,3);
data888=[r1,r2,r3,r4,data2(1:A-1,5),data2(2:A,6)];
%开盘波动率，开盘收盘波动率
Aa=corrcoef(data888);
for i=1 :1:A
    if data2(i,6)>0
        data2(i,6)=1;
    else
        data2(i,6)=-1;
    end
end
%msi分析情绪
j=1;
for i=4 :1:A-1
    v(j,1)=std(data2(i-3:i,6));
    j=j+1;
end
% end
mi=[v,data2(5:A,6)];
Aaaa=corrcoef(mi);
% plot(v);
bb=length(v);
ttt=1:1:bb;
plotyy(ttt,v,ttt,data2(5:A,1));
%波动率与收益的秩相关系数
%拟合v和成交量与下日收益
% X=[ones(size(v)),v,data2(5:AAA,5)];%X是波动率和成交量的矩阵
X=[ones(size(v)),v,data2(4:A-1,6)];%X是波动率和前一日收益的矩阵
y=data2(5:A,6);
p=regress(y,X);
[b,bint] = regress(y,X) ;
scatter3(v,data2(4:A-1,6),y,'filled') ; 
hold on  
x1fit = min(v):0.05:max(v);  
x2fit = min(data2(4:A-1,6)):0.05:max(data2(4:A-1,6));  
[X1FIT,X2FIT] = meshgrid(x1fit,x2fit);  
YFIT = b(1)+ b(2)*X1FIT+b(3)*X2FIT;  
mesh(X1FIT,X2FIT,YFIT)  
xlabel('x1')  
ylabel('x2')  
zlabel('Y')  
view(10,0)  
% 
% %验证
% data22=xlsread('999999.xls','B2203:F3202');
% data222=[data22,100.*(data22(:,4)-data22(:,1))./data22(:,1)];
% BBB=length(data222(:,6));%数据长度
% jj=1;
% for ii=4 :1:BBB-1
%     vv(jj,1)=std(data222(ii-3:ii,6));
%     jj=jj+1;
% end
% % y1=p(1)+p(2)*vv+p(3)*data222(5:BBB,5);
% y1=p(1)+p(2)*vv+p(3)*data222(4:BBB-1,6);
% YY=[y1,data222(5:BBB,6)];
% yyyy=1:1:BBB-4;
% plotyy(yyyy,y1,yyyy,data222(5:BBB,6));
% % plot(yyyy,y1);
% CCC=length(y1);
% for iii=1:1:CCC
%     if YY(iii,1)>0 && YY(iii,2)>0
%         KK(iii,1)=0;
%     else if YY(iii,1)<0&&YY(iii,2)<0
%             KK(iii,1)=0;
%     else if YY(iii,1)<0&&YY(iii,2)>0
%             KK(iii,1)=0;
%         else
%             KK(iii,1)=1;
%         end
%         end
%     end
%     iii=iii+1;
% end
% KKKK=sum(KK)/length(KK);      
% hhh=data222(5:BBB,6)-y1;
% ggggg=std(hhh);
