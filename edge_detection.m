% MATLAB code for convert RGB into Grayscale and to display edges.
% read the image.
k=imread("flower.jpg");
%Convert into double format.
k=double(k);
% take the average of R, G and B channels.
k1=(k(:,:,1)+k(:,:,2)+k(:,:,3))/3;
% display after converting into uint8 format.
imtool(uint8(k1),[]);
%Find edges using the Prewitt method.
BW1 = edge(k1,'Prewitt');
figure,imshow(BW1);title('Image 1');
% MATLAB code for convert RGB into HIS and find edges
%Represent the RGB image in [0 1] range
I=double(k)/255;
R=I(:,:,1);
G=I(:,:,2);
B=I(:,:,3);
%Hue
numi=1/2*((R-G)+(R-B));
denom=((R-G).^2+((R-B).*(G-B))).^0.5;
%To avoid divide by zero exception add a small number in the denominator
H=acosd(numi./(denom+0.000001));
%If B>G then H= 360-Theta
H(B>G)=360-H(B>G);
%Normalize to the range [0 1]
H=H/360;
%Saturation
S=1- (3./(sum(I,3)+0.000001)).*min(I,[],3);
%Intensity
I=sum(I,3)./3;
%HSI
HSI=zeros(size(k));
HSI(:,:,1)=H;
HSI(:,:,2)=S;
HSI(:,:,3)=I;
%display after converting into HSI image.
figure,imshow(HSI);title('HSI Image');
% find edges on the I component using Prewitt method
BW2 = edge(I,'Prewitt');
figure,imshow(BW2);title('Image 2');
% find edges on the H component using Prewitt method
BW3 = edge(H,'Prewitt');
figure,imshow(BW3);title('Image 3');
