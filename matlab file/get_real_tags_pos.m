clear all
real_pos

for i=1:77
temp=load(sprintf('nexbee\\%02d.txt',i));
max_nexbee(i)=length(temp);
end

data=zeros(77,max(max_nexbee),9);

for i=1:77    
temp=load(sprintf('nexbee\\%02d.txt',i));
    for j=1:length(temp)
     data(i,j,:)=temp(j,:);
    end
end
map_x=120
map_y=120
lrf_pos=lrf_pos+120/2;

result_circle_img=zeros(120,120);

j=1; %위치 관련 인덱스
k=1; % 넥스비 데이터 측정 횟수 관련 
l=9; % 넥스비 데이터 순번
anchor_pos=zeros(2,8)
for l=2:9
    result_circle_img=zeros(120,120);   
    for j=1:77
        for k=1:416
            temp_circle_img=zeros(120,120);
            for i=0:0.1:2*pi
                if(data(j,k,l)>0)
                    x=data(j,k,l)*cos(i)+lrf_pos(j,1);
                    y=data(j,k,l)*sin(i)+lrf_pos(j,2);
                    x=round(x);
                    y=round(y);
                    if(temp_circle_img(x,y)==0)
                        temp_circle_img(x,y)=1;
                    end
                end
            end
            result_circle_img=result_circle_img+temp_circle_img;
        end
    end
    [x y]=find(result_circle_img==max(max(result_circle_img)))
    anchor_pos(1,l-1)=x;
    anchor_pos(2,l-1)=y;
end