% Heat map projection of GLCM’s.
% Created 2017 by Jardine, Miller & Becker in Computers and Geosciences.

clear all

d = dir('*.png');
d = rmfield(d,'date');
d = rmfield(d, 'bytes');
d = rmfield(d, 'datenum');
d = rmfield(d, 'isdir');
 
 
Directory = d;
 
   
    for i = 1:length(d);
        name = getfield(d(i), 'name');
        x = imread(name);
%         bwx = rgb2gray(x);
        imageStack(:,:,i) = x;
    end
imageStack;
 
% scaledimagestack = 
I = imageStack(:,:,792);
II = (I<1)
III = (I<30)
IV = III-II
Add = uint8(IV)
Slice = I+(Add*10)
 
% determine the plots and plot possitions in the figure window
yhistAxes = axes('position',    [0.05 0.085 0.15  0.85]);
mainDataAxes = axes('position', [0.30 0.085 0.69  0.85]);
% imAxes = axes('position',       [0.60 0.05 0.80  0.85]);
 
%plot map
axes(mainDataAxes);
h = imagesc(Slice);
%each data point is exactly what it is without interpolation.
 
%Change colour map(makes the backgroud white)
j = jet; %colormap is an array of colours coded in RGD triplet
j(1,:) = [ 1 1 1 ]; %set the lowest colour form blue to white
colormap(j);
colorbar;
% use data cursor to check out the points on the map
 
%set the range that the data will be coloured
axHdl = get(h, 'Parent'); %get the axes parent handle of the surface
get(axHdl, 'CLim'); %check out the range of the coloured data
set(axHdl, 'CLim', [1,255]) %use the j colourmap to cover data values {
 
%Best option is;
data_max = max(max(Slice)); % D1 is 2D matrix, so it has a amx value
data_min = min(min(Slice)); %
set(axHdl,'CLim',[data_min, data_max]);
 
% both x and y range from 1 to 255
line([127.5 127.5],[0 255],'linewidth',0.5,'Color',[0.7 0.7 0.7]);
line([0 255],[127.5 127.5],'linewidth',0.5,'Color',[0.7 0.7 0.7]);
 
% labeling
ylabel('Reference Pixel Value')
xlabel('Neighbouring Pixel Value')
title(['GLCM D1 Heat Map'],'FontSize', 13)
 
% %Display average of each row on the left hand side
% for j=1:255
%     ave(j)=mean(Slice(j,find(Slice(j,:)~=0)));
% end
 
%Display total of each row on the left hand side
for j=1:255
    SUM(j)=sum(Slice(j,find(Slice(j,:)~=0)));
end
 
axes(yhistAxes); % move focus to this axes
barh(1:255,SUM,'facecolor',[0. 0.7 0.7], 'edgecolor',[1 1 1]);
 
set(gca,'xdir','reverse');
set(gca,'ydir','reverse');
ylim([0.5 255.5]);
 
% %get what you see in the window
% set(gcf,'position',[100 100 800 500]); % undock the figure window first
% figure_size = get(gcf,'position')
% set(gcf,'PaperPosition',figure_size/100);
% print(gcf,'-dpng','-r100',['./2D_heatmap'])
