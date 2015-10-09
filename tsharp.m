clear;
clc;
%提取数据%
data_load=xlsread('1A0001.xls','B2:F6002');
%计算收益率
data_benifit=[data_load,100.*(data_load(:,4)-data_load(:,1))./data_load(:,1)];
length_date=length(data_benifit(:,6));%数据长度
%波动率
% data9=[var(data2(:,1)),var(data2(:,2)),var(data2(:,3)),var(data2(:,4)),var(data2(:,5)),var(data2(:,6))];
data_temp=[data_benifit(1:length_date-1,4),data_benifit(1:length_date-1,5),data_benifit(1:length_date-1,2)-data_benifit(1:length_date-1,3),data_benifit(2:length_date,6)];
qqq=corrcoef(data_benifit);
qqqq=corrcoef(data_temp);

X=[ones(length_date-1,1),data_benifit(1:length_date-1,5),data_benifit(1:length_date-1,2)-data_benifit(1:length_date-1,3)];%X是成交量
y=data_benifit(2:length_date,6);
p=regress(y,X);

YY=p(1)+p(2).*data_benifit(1:length_date-1,5)+p(3)*(data_benifit(1:length_date-1,2)-data_benifit(1:length_date-1,3));
ee=abs(y-YY);
ppp=regress(ee,X);
ts=(p(2)*data_benifit(1:length_date-1,5)+p(3)*(data_benifit(1:length_date-1,2)-data_benifit(1:length_date-1,3)))./(ppp(2)*data_benifit(1:length_date-1,5)+ppp(3)*(data_benifit(1:length_date-1,2)-data_benifit(1:length_date-1,3)));
rrr=mean(ts(length_date-600:length_date-1));
plot(ts);

plotyy(1:1:length_date-1,ts,1:1:length_date-1,data_benifit(2:length_date,4));
% % data8888=[v,data2(4:AAA-1,1)];
%  data88888=[ts(5:BB,1),v(1:BBB-1,1)];
%  A=corrcoef(data88888);
% % Aa=corrcoef(data8888);
% a=corrcoef(data888);