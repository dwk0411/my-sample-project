% 2017.11.08 김도우 

% 아두이노와 통신
clear;
clc;
delete(instrfindall) %현재 연결되어있는 시리얼포트 지움 

% 추가가가가가ㅏㄱ 

s=serial('COM3'); % 현재 아두이노가 컴퓨터에 연결되어 있는 포트 
set(s,'BaudRate',9600) % 아두이노와 통신을 하게 될 통신속도 , 아두이노 코드에서 Serial.begin으로 설정해 준 속도와 같아야함 
fopen(s); %설정한 포트와 통신을 시작 ,비로서 통신이 시작 

% 원하는 이미지 선택하기  
img = imread(uigetfile({'*.jpg;*.tif;*.png;*.gif','All Image Files';...
          '*.*','All Files' },'mytitle',...
          'C:\User\사진'));

% RGB 영상 -> GRAY SCALE 영상
gray=rgb2gray(img);

% 픽셀의 수 (a X a) 조정
%a=input('행 또는 열의 수 입력 : '); 
a=7;
size=imresize(gray,[a,a]);

% 이미지 이진화 
result=im2bw(size,0.8);  

% 원본 이미지와 처리된 이미지 창 보여줌
figure(2),imshow(img),figure(3),imshow(result);

% 이진화된 이미지 행렬 결과 보여줌 
result;

% 처리된 이미지 행렬값 아두이노로 보내줌 , black:0 white:1 
for i=1:a
    for j=1:a
   
        fwrite(s,result(i,j));
    
    end
end
    
fclose(s); %포트를 닫는다
delete(instrfindall) % 아두이노와의 통신을 끊음 