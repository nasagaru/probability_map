clc, clear

for i=1:77
    
data=load(sprintf('%02d.txt',i));

data1=data(:,2); tmp=find(data1==0);
significant(1)=1-length(tmp)/length(data1);
data1(data1==0)=[]; stand(1)=std(data1);

data2=data(:,3); tmp=find(data2==0); 
significant(2)=1-length(tmp)/length(data2);
data2(data2==0)=[]; stand(2)=std(data2);

data3=data(:,4); tmp=find(data3==0);
significant(3)=1-length(tmp)/length(data3);
data3(data3==0)=[]; stand(3)=std(data3);

data4=data(:,5); tmp=find(data4==0);
significant(4)=1-length(tmp)/length(data4);
data4(data4==0)=[]; stand(4)=std(data4);

data5=data(:,6); tmp=find(data5==0); 
significant(5)=1-length(tmp)/length(data5);
data5(data5==0)=[]; stand(5)=std(data5);

data6=data(:,7); tmp=find(data6==0); 
significant(6)=1-length(tmp)/length(data6); 
data6(data6==0)=[]; stand(6)=std(data6);

data7=data(:,8); tmp=find(data7==0); 
significant(7)=1-length(tmp)/length(data7);
data7(data7==0)=[]; stand(7)=std(data7);

data8=data(:,9); tmp=find(data8==0); 
significant(8)=1-length(tmp)/length(data8);
data8(data8==0)=[]; stand(8)=std(data8);

db(i,1)=mean(data1);
db(i,2)=mean(data2);
db(i,3)=mean(data3);
db(i,4)=mean(data4);
db(i,5)=mean(data5);
db(i,6)=mean(data6);
db(i,7)=mean(data7);
db(i,8)=mean(data8);
% db(i,9)=significant(1);
% db(i,10)=significant(2);
% db(i,11)=significant(3);
% db(i,12)=significant(4);
% db(i,13)=significant(5);
% db(i,14)=significant(7);
% db(i,15)=significant(6);
% db(i,16)=significant(8);
% db(i,17)=stand(1);
% db(i,18)=stand(2);
% db(i,19)=stand(3);
% db(i,20)=stand(4);
% db(i,21)=stand(5);
% db(i,22)=stand(6);
% db(i,23)=stand(7);
% db(i,24)=stand(8);

end

db(~isfinite(db))=0;

save -ascii db_nexbee.txt db

% n=1:8;
% m=1:228;
% for j=1:228
%     subplot(1,2,1),
%     % plot(n,db(j,9:16))
%     stem(db(j,9:16))
%     xlabel('Anchor Number')
%     ylabel('Significant')
%     title('Total Significant')
%     hold on
%     grid on
%     subplot(1,2,2)
%     stem(db(j,17:24), 'ro')
%     xlabel('Anchor Number')
%     ylabel('Standard Deviation')
%     title('Total Standard Deviation')
%     hold on
%     grid on
% end
