clear;
clc;
%��ȡ����%
data1=xlsread('999999.xls','B2:F2202');
%����������
data2=[data1,100.*(data1(:,4)-data1(:,1))./data1(:,1)];
[a,b]=max(data2(:,6));
[a1,b1]=min(data2(:,6));
k=sum(data2(:,6))/length(data2(:,6));%��ֵ
m=mean(data2(:,6));
v=var(data2(:,6));%����
A=length(data2(:,6));%���ݳ���
%������
r1=data2(2:A,1)-data2(1:A-1,1);
r2=data2(2:A,1)-data2(1:A-1,4);
r3=data2(1:A-1,4)-data2(1:A-1,1);
r4=data2(1:A-1,2)-data2(1:A-1,3);
for i=1 :1:A
    if data2(i,6)>0
        data2(i,6)=1;
    else
        data2(i,6)=-1;
    end
end
data888=[r1,r2,r3,r4,data2(1:A-1,5),data2(2:A,6)];
%���̲����ʣ��������̲�����
Aa=corrcoef(data888);
%msi��������
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
%������������������ϵ��
%���v�ͳɽ�������������
% X=[ones(size(v)),v,data2(5:AAA,5)];%X�ǲ����ʺͳɽ����ľ���
X=[ones(size(v)),v,data2(4:A-1,6)];%X�ǲ����ʺ�ǰһ������ľ���
y=data2(5:A,6);
p=regress(y,X);
%%%

%
Sample=X(:,2:3);
grp=y;
c=cvpartition(grp,'k',5); 
minfn = @(z)crossval('mcr',Sample,grp,'Predfun', ...
    @(xtrain,ytrain,xtest)crossf1(xtrain,ytrain,...
    xtest),'partition',c);
 opts = optimset('MaxIter',10); 
%%%
% y1=p(1)+p(2)*v+p(3)*data2(4:A-1,6);
% YY=[y1,data2(5:A,6)];
% yyyy=1:1:A-4;
% plotyy(yyyy,y1,yyyy,data2(5:A,6));
% qw=YY(:,1)-YY(:,2);
% plot(qw);
% mean(qw)
% %��֤
% data22=xlsread('999999.xls','B2203:F3202');
% data222=[data22,100.*(data22(:,4)-data22(:,1))./data22(:,1)];
% B=length(data222(:,6));%���ݳ���
% jj=1;
% for ii=4 :1:B-1
%     vv(jj,1)=std(data222(ii-3:ii,6));
%     jj=jj+1;
% end
% % y1=p(1)+p(2)*vv+p(3)*data222(5:BBB,5);
% y1=p(1)+p(2)*vv+p(3)*data222(4:B-1,6);
% YY=[y1,data222(5:B,6)];
% yyyy=1:1:B-4;
% plotyy(yyyy,y1,yyyy,data222(5:B,6));
% % plot(yyyy,y1);
% CCC=length(y1);
% for iii=1:1:CCC
%     if YY(iii,1)>0 && YY(iii,2)>0
%         KK(iii,1)=1;
%     else if YY(iii,1)<0&&YY(iii,2)<0
%             KK(iii,1)=1;
%     else if YY(iii,1)<0&&YY(iii,2)>0
%             KK(iii,1)=0;
%         else
%             KK(iii,1)=0;
%         end
%         end
%     end
%     iii=iii+1;
% end
% KKKK=sum(KK)/length(KK);      
% hhh=data222(5:B,6)-y1;
% ggggg=std(hhh);
