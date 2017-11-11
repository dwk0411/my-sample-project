% 2017.11.08 �赵�� 

% �Ƶ��̳�� ���
clear;
clc;
delete(instrfindall) %���� ����Ǿ��ִ� �ø�����Ʈ ���� 

% �߰������������� 

s=serial('COM3'); % ���� �Ƶ��̳밡 ��ǻ�Ϳ� ����Ǿ� �ִ� ��Ʈ 
set(s,'BaudRate',9600) % �Ƶ��̳�� ����� �ϰ� �� ��żӵ� , �Ƶ��̳� �ڵ忡�� Serial.begin���� ������ �� �ӵ��� ���ƾ��� 
fopen(s); %������ ��Ʈ�� ����� ���� ,��μ� ����� ���� 

% ���ϴ� �̹��� �����ϱ�  
img = imread(uigetfile({'*.jpg;*.tif;*.png;*.gif','All Image Files';...
          '*.*','All Files' },'mytitle',...
          'C:\User\����'));

% RGB ���� -> GRAY SCALE ����
gray=rgb2gray(img);

% �ȼ��� �� (a X a) ����
%a=input('�� �Ǵ� ���� �� �Է� : '); 
a=7;
size=imresize(gray,[a,a]);

% �̹��� ����ȭ 
result=im2bw(size,0.8);  

% ���� �̹����� ó���� �̹��� â ������
figure(2),imshow(img),figure(3),imshow(result);

% ����ȭ�� �̹��� ��� ��� ������ 
result;

% ó���� �̹��� ��İ� �Ƶ��̳�� ������ , black:0 white:1 
for i=1:a
    for j=1:a
   
        fwrite(s,result(i,j));
    
    end
end
    
fclose(s); %��Ʈ�� �ݴ´�
delete(instrfindall) % �Ƶ��̳���� ����� ���� 