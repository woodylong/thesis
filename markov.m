clear;
clc;
%提取数据%
data1=xlsread('999999.xls','B2:F2202');
hmm=[data1(:,1),data1(:,5)];
k=length(hmm);
hmm2=hmm(2:k,:);
delta=hmm2-hmm(1:k-1,:);
i=1;
j=0;
jj=0;
jjj=0;
jjjj=0;
suk=length(find(delta(:,1)>0));
suk1=length(find(delta(:,1)==0));
suk2=length(find(delta(:,1)<0));
for i=1:1:k-1
if delta(i,1)>0 &&delta(i,2)>0
    j=j+1;
else if delta(i,1)>0 && delta(i,2)<0
    jj=jj+1;
else if delta(i,1)<0 && delta(i,2)<0
    jjj=jjj+1;
else if delta(i,1)<0 && delta(i,2)>0
    jjjj=jjjj+1;
    end
    end
    end
end

end

%计算收益率
% data2=[data1,100.*(data1(:,4)-data1(:,1))./data1(:,1)];
% AAA=length(data2(:,6));%数据长度
% %波动率
% % data9=[var(data2(:,1)),var(data2(:,2)),var(data2(:,3)),var(data2(:,4)),var(data2(:,5)),var(data2(:,6))];
% data999=[data2(1:AAA-1,4),data2(1:AAA-1,5),data2(1:AAA-1,2)-data2(1:AAA-1,3),data2(2:AAA,6)];
% qqq=corrcoef(data2);
% qqqq=corrcoef(data999);
% 
% X=[ones(AAA-1,1),data2(1:AAA-1,5),data2(1:AAA-1,2)-data2(1:AAA-1,3)];%X是成交量
% y=data2(2:AAA,6);
% p=regress(y,X);
% 
% YY=p(1)+p(2).*data2(1:AAA-1,5)+p(3)*(data2(1:AAA-1,2)-data2(1:AAA-1,3));
% ee=abs(y-YY);
% ppp=regress(ee,X);
% ts=(p(2)*data2(1:AAA-1,5)+p(3)*(data2(1:AAA-1,2)-data2(1:AAA-1,3)))./(ppp(2)*data2(1:AAA-1,5)+ppp(3)*(data2(1:AAA-1,2)-data2(1:AAA-1,3)));
% rrr=mean(ts(AAA-600:AAA-1));
% plot(ts);
% plotyy(1:1:AAA-1,ts,1:1:AAA-1,data2(2:AAA,4));
% % data8888=[v,data2(4:AAA-1,1)];
%  data88888=[ts(5:BB,1),v(1:BBB-1,1)];
%  A=corrcoef(data88888);
% % Aa=corrcoef(data8888);
% a=corrcoef(data888);