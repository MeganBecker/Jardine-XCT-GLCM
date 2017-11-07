% 3D GLCM calculation by manipulation of image XCT image stack.
% Created 2017 by Jardine, Miller & Becker in Computers and Geosciences.

clear all
clc

d = dir('*.png');
d = rmfield(d,'date');
d = rmfield(d, 'bytes');
d = rmfield(d, 'datenum');
d = rmfield(d, 'isdir');

%--------------------------------------------------------------------------
    for i = 1:250;
        Name = getfield(d(i), 'name');
        x = imread(Name);
%         bwx = rgb2gray(x);
        imageStack(:,:,i) = x;
        (25)/(250)*i
    end
    
Name = [];    
x = [];
i = []; 

[r,c,z] = size(imageStack);
 
Max = [max(imageStack(:))+1];


    for ii = 1:z
        D1 = graycomatrix(imageStack(:,:,ii), 'offset', [0 1], 'GrayLimits', [], 'NumLevels', Max);
        imageStackGLCMsD1(:,:,ii)= D1;
    end
    
for iii = 1:z
    imwrite(uint8(255 * mat2gray(imageStackGLCMsD1(:,:,iii))),['a_', num2str(iii), '.png'])
end

imageStack = []
imageStackGLCMsD1 = []
D1 = []
iii = []   

%--------------------------------------------------------------------------
for i = 251:500;
        Name = getfield(d(i), 'name');
        x = imread(Name);
%         bwx = rgb2gray(x);
        imageStack(:,:,(i-250)) = x;
        (25)/(250)*i
end
   
Directory = []; 
Name = [];    
x = [];
i = []; 

[r,c,z] = size(imageStack);
 
Max = [max(imageStack(:))+1];

    for ii = 1:z
        D1 = graycomatrix(imageStack(:,:,ii), 'offset', [0 1], 'GrayLimits', [], 'NumLevels', Max);
        imageStackGLCMsD1(:,:,ii)= D1;
    end
    
    
for iii = 1:z
    imwrite(uint8(255 * mat2gray(imageStackGLCMsD1(:,:,iii))),['b_', num2str(iii), '.png'])
end

imageStack = []
imageStackGLCMsD1 = []
D1 = []
       
%--------------------------------------------------------------------------    
  for i = 501:750;
        Name = getfield(d(i), 'name');
        x = imread(Name);
%         bwx = rgb2gray(x);
        imageStack(:,:,(i-500)) = x;
        25/(250)*i
  end
     
Directory = []; 
Name = [];    
x = [];
i = []; 

[r,c,z] = size(imageStack);
 
Max = [max(imageStack(:))+1];


    for ii = 1:z
        D1 = graycomatrix(imageStack(:,:,ii), 'offset', [0 1], 'GrayLimits', [], 'NumLevels', Max);
        imageStackGLCMsD1(:,:,ii)= D1;
    end
    
for iii = 1:z
    imwrite(uint8(255 * mat2gray(imageStackGLCMsD1(:,:,iii))),['c_', num2str(iii), '.png'])
end

imageStack = []
imageStackGLCMsD1 = []
D1 = []
   
%--------------------------------------------------------------------------    
    for i = 751:1000;
        Name = getfield(d(i), 'name');
        x = imread(Name);
%         bwx = rgb2gray(x);
        imageStack(:,:,(i-750)) = x;
        25/(250)*i
    end
        
        
[r,c,z] = size(imageStack);
 
Max = [max(imageStack(:))+1];
 

    for ii = 1:z
        D1 = graycomatrix(imageStack(:,:,ii), 'offset', [0 1], 'GrayLimits', [], 'NumLevels', Max);
        imageStackGLCMsD1(:,:,ii)= D1;
    end
    
for iii = 1:z
    imwrite(uint8(255 * mat2gray(imageStackGLCMsD1(:,:,iii))),['d_', num2str(iii), '.png'])
end

imageStack = []
imageStackGLCMsD1 = []
D1 = []
   
% 
 
%------------------- Image stack 1 (original) -------------------- 

        
        D2 = graycomatrix(imageStack(:,:,ii), 'offset', [-1 1], 'GrayLimits', [], 'NumLevels', Max);
        imageStackGLCMsD2(:,:,ii)= D2;
        
        D3 = graycomatrix(imageStack(:,:,ii), 'offset', [-1 0], 'GrayLimits', [], 'NumLevels', Max);
        imageStackGLCMsD3(:,:,ii)= D3;
        
        D4 = graycomatrix(imageStack(:,:,ii), 'offset', [-1 -1], 'GrayLimits', [], 'NumLevels', Max);
        imageStackGLCMsD4(:,:,ii)= D4;
    
 
imageStackGLCMsD1;
imageStackGLCMsD2;
imageStackGLCMsD3;
imageStackGLCMsD4;
 
 
for iii = 1:z
    imwrite(uint8(255 * mat2gray(imageStackGLCMsD1(:,:,iii))),['D1_', num2str(iii), '.png'])
    
    imwrite(uint8(255 * mat2gray(imageStackGLCMsD2(:,:,iii))),['D2_', num2str(iii), '.png'])
    
    imwrite(uint8(255 * mat2gray(imageStackGLCMsD3(:,:,iii))),['D3_', num2str(iii), '.png'])
    
    imwrite(uint8(255 * mat2gray(imageStackGLCMsD4(:,:,iii))),['D4_', num2str(iii), '.png'])
end
        
 
 
imageStackGLCMsD1 = [];
imageStackGLCMsD2 = [];
imageStackGLCMsD3 = [];
imageStackGLCMsD4 = [];
 
% % _________________________________________________________________________
%  %------------------- Image stack 2 (regenerated) --------------------
%  
newImageVertical = [];
 
for c2 = 1:c  
    for z2 = 1:z                                                            %Creates a string of pixel values along a defined vetcor.
        columnPixel = imageStack(:,c2,z2);
        newImageVertical = [newImageVertical, columnPixel];
    end
    newImageVerticalMultiMatrix(:,:,c2) = newImageVertical;                 %the number of new images in this image stack depend on the number of pixel columns in the original images.
    newImageVertical = [];
end
newImageVerticalMultiMatrix;
                                                                            %Above for loop creates new image stack along a defined plane through
                                                                            %the original image stack. In this case a vertical trending 
                                                                            %plane.
 
[Nr,Nc,Nz] = size(newImageVerticalMultiMatrix);
                                                                            %N denotes a vertical trending plane through the original image
                                                                            %stack                                                                    
                                                                            
Max2 = [max(newImageVerticalMultiMatrix(:))+1];
 
    for iii = 1:Nz                                                         %(Nc)dependened on the number of colums in the original image stack
        D5 = graycomatrix(newImageVerticalMultiMatrix(:,:,iii), 'offset', [0 -1], 'GrayLimits', [], 'NumLevels', Max2);
        newImageVerticalMultiMatrixGLCMsD5(:,:,iii)= D5;   
 
        D6 = graycomatrix(newImageVerticalMultiMatrix(:,:,iii), 'offset', [-1 -1], 'GrayLimits', [], 'NumLevels', Max2);
        newImageVerticalMultiMatrixGLCMsD6(:,:,iii)= D6;
 
        D7 = graycomatrix(newImageVerticalMultiMatrix(:,:,iii), 'offset', [1 -1], 'GrayLimits', [], 'NumLevels', Max2);
        newImageVerticalMultiMatrixGLCMsD7(:,:,iii)= D7;
    end
 
newImageVerticalMultiMatrixGLCMsD5;
newImageVerticalMultiMatrixGLCMsD6;
newImageVerticalMultiMatrixGLCMsD7;
 
 
for iii = 1:z
    imwrite(uint8(255 * mat2gray(newImageVerticalMultiMatrixGLCMsD5(:,:,iii))),['D5_', num2str(iii), '.png'])
    
    imwrite(uint8(255 * mat2gray(newImageVerticalMultiMatrixGLCMsD6(:,:,iii))),['D6_', num2str(iii), '.png'])
    
    imwrite(uint8(255 * mat2gray(newImageVerticalMultiMatrixGLCMsD7(:,:,iii))),['D7_', num2str(iii), '.png'])
end
 
 
         
newImageVerticalMultiMatrixGLCMsD5 = [];
newImageVerticalMultiMatrixGLCMsD6 = [];
newImageVerticalMultiMatrixGLCMsD7 = [];
 
newImageVerticalMultiMatrix = [];
 
%  
% %__________________________________________________________________________
% %------------------- Image stack 3 (regenerated) --------------------
% 
newImageHorizontal = [];
 
for r2 = 1:r
    for z2 = 1:z
        rowPixel = imageStack(r2,:,z2);
        newImageHorizontal = [newImageHorizontal; rowPixel];
    end
    newImageHorizontal;
    newImageHorizontalMultiMatrix(:,:,r2) = newImageHorizontal;
    
    newImageHorizontal = [];
end
newImageHorizontalMultiMatrix;
 
[Mr,Mc,Mz] = size(newImageHorizontalMultiMatrix);
                                                                            %N denotes a North/South trending Vertical plane through the original image
                                                                            %stack
 
    for iiii = 1:Mz
                                                                            
        D8 = graycomatrix(newImageHorizontalMultiMatrix(:,:,iiii), 'offset', [1 -1], 'GrayLimits', [], 'NumLevels', Max2);
        newImageHorizontalMultiMatrixGLCMsD8(:,:,iiii)= D8;
        
        D9 = graycomatrix(newImageHorizontalMultiMatrix(:,:,iiii), 'offset', [1 1], 'GrayLimits', [], 'NumLevels', Max2);
        newImageHorizontalMultiMatrixGLCMsD9(:,:,iiii)= D9;
        
    end
 
newImageHorizontalMultiMatrixGLCMsD8;
newImageHorizontalMultiMatrixGLCMsD9;
 
 
for iii = 1:z
    imwrite(uint8(255 * mat2gray(newImageHorizontalMultiMatrixGLCMsD8(:,:,iii))),['D8_', num2str(iii), '.png'])
    
    imwrite(uint8(255 * mat2gray(newImageHorizontalMultiMatrixGLCMsD9(:,:,iii))),['D9_', num2str(iii), '.png'])
end
 
 
newImageHorizontalMultiMatrixGLCMsD8 = [];
newImageHorizontalMultiMatrixGLCMsD9 = [];
 
newImageHorizontalMultiMatrix = [];
 
% % _________________________________________________________________________
%   %------------------- Image stack 4 (regenerated) --------------------
% 
max3 = [max(imageStack(:))+2];
 
newImage45 = [];
newImage45shift = [];
 
 
for iv = 1:z
    newImage45 = zeros(r+(c-1),c)-1;
    newImage45shiftMultiMatrix(:,:,iv) = newImage45;
    newImage45 = [];
end
 
for vii = 1:z
    for a = 1:c;
        b = a+(r-1);
        newImage45shiftMultiMatrix(a:b,a,vii) = imageStack(:,a,vii);
    end
end
 
newImage45shiftMultiMatrix;
 
newImage45 = [];
newImage45shift = [];
 
 
[R,C,Z] = size(newImage45shiftMultiMatrix);
 
newImage45shiftHorizontal = [];
 
for r3 = 1:R
    for z3 = 1:Z
        RowPixel = newImage45shiftMultiMatrix(r3,:,z3);
        newImage45shiftHorizontal = [newImage45shiftHorizontal; RowPixel];
    end
    newImage45shiftHorizontal;
    newImage45shiftHorizontalMultiMatrix(:,:,r3) = newImage45shiftHorizontal;
    
    newImage45shiftHorizontal = [];
end
 
newImage45shiftHorizontalMultiMatrix;
 
[NR,NC,NZ] = size(newImage45shiftHorizontalMultiMatrix);
 
 for iiiii = 1:NZ
                                                                            
     D10 = graycomatrix(newImage45shiftHorizontalMultiMatrix(:,:,iiiii), 'offset', [1 -1], 'GrayLimits', [-1 (max(newImage45shiftHorizontalMultiMatrix(:)))], 'NumLevels', max3);
     newImageShift45HorizontalMultiMatrixGLCMsD10MinusOnes(:,:,iiiii)= D10;
     
     D11 = graycomatrix(newImage45shiftHorizontalMultiMatrix(:,:,iiiii), 'offset', [1 1], 'GrayLimits', [-1 (max(newImage45shiftHorizontalMultiMatrix(:)))], 'NumLevels', max3);
     newImageShift45HorizontalMultiMatrixGLCMsD11MinusOnes(:,:,iiiii)= D11;
    
    end
 
newImageShift45HorizontalMultiMatrixGLCMsD10MinusOnes(2:end,2:end,:);
newImageShift45HorizontalMultiMatrixGLCMsD11MinusOnes(2:end,2:end,:);
 
newImageShift45HorizontalMultiMatrixGLCMsD10MinusOnesFinal = newImageShift45HorizontalMultiMatrixGLCMsD10MinusOnes(2:end,2:end,:);
newImageShift45HorizontalMultiMatrixGLCMsD11MinusOnesFinal = newImageShift45HorizontalMultiMatrixGLCMsD11MinusOnes(2:end,2:end,:);
 
newImageShift45HorizontalMultiMatrixGLCMsD10 = newImageShift45HorizontalMultiMatrixGLCMsD10MinusOnes(2:end,2:end,:);
newImageShift45HorizontalMultiMatrixGLCMsD10;
newImageShift45HorizontalMultiMatrixGLCMsD11 = newImageShift45HorizontalMultiMatrixGLCMsD11MinusOnes(2:end,2:end,:);
newImageShift45HorizontalMultiMatrixGLCMsD11;
 
for iii = 1:z
    imwrite(uint8(255 * mat2gray(newImageShift45HorizontalMultiMatrixGLCMsD10MinusOnesFinal(:,:,iii))),['D10_', num2str(iii), '.png'])
    
    imwrite(uint8(255 * mat2gray(newImageShift45HorizontalMultiMatrixGLCMsD11MinusOnesFinal(:,:,iii))),['D11_', num2str(iii), '.png'])
end
 
newImageShift45HorizontalMultiMatrixGLCMsD10 = [];
newImageShift45HorizontalMultiMatrixGLCMsD11 = [];
 
newImageShift45HorizontalMultiMatrixGLCMsD10MinusOnesFinal = [];
newImageShift45HorizontalMultiMatrixGLCMsD11MinusOnesFinal = [];
 
newImageShift45HorizontalMultiMatrixGLCMsD10MinusOnes = [];
newImageShift45HorizontalMultiMatrixGLCMsD11MinusOnes = [];
 
newImage45shiftHorizontalMultiMatrix = [];
newImage45shiftMultiMatrix = [];
% % _________________________________________________________________________
%   %------------------- Image stack 5 (regenerated) --------------------
% 
newImage135 = [];
newImage135shift = [];
 
 
for iv = 1:z
    newImage135 = zeros(1300,700)-1;
    newImage135shiftMultiMatrix(:,:,iv) = newImage135;
    newImage135 = [];
end
 
 
for vii = 1:z;
    for a = 1:c;
        j = (c+1)-a;
          k = (r+c)-a;
%          k = (r*2)-a;
        newImage135shiftMultiMatrix(j:k,a,vii) = imageStack(:,a,vii);
    end
end
 
newImage135shiftMultiMatrix;
 
newImage135shiftHorizontal = [];
 
for r3 = 1:R
    for z3 = 1:Z
        RowPixel = newImage135shiftMultiMatrix(r3,:,z3);
        newImage135shiftHorizontal = [newImage135shiftHorizontal; RowPixel];
    end
    newImage135shiftHorizontal;
    newImage135shiftHorizontalMultiMatrix(:,:,r3) = newImage135shiftHorizontal;
    
    newImage135shiftHorizontal = [];
end
newImage135shiftHorizontalMultiMatrix;
 
[MR,MC,MZ] = size(newImage135shiftHorizontalMultiMatrix);
 
 for iiiiii = 1:MZ
                                                                            
    D12 = graycomatrix(newImage135shiftHorizontalMultiMatrix(:,:,iiiiii), 'offset', [1 -1], 'GrayLimits', [-1 (max(newImage135shiftHorizontalMultiMatrix(:)))], 'NumLevels', max3);
    newImageShift135HorizontalMultiMatrixGLCMsD12MinusOnes(:,:,iiiiii)= D12;
    
    D13 = graycomatrix(newImage135shiftHorizontalMultiMatrix(:,:,iiiiii), 'offset', [1 1], 'GrayLimits', [-1 (max(newImage135shiftHorizontalMultiMatrix(:)))], 'NumLevels', max3);
    newImageShift135HorizontalMultiMatrixGLCMsD13MinusOnes(:,:,iiiiii)= D13;
 end
 
newImage135shiftHorizontalMultiMatrix = [];
newImage135shiftMultiMatrix = [];
 
 
newImageShift135HorizontalMultiMatrixGLCMsD12MinusOnes(2:end,2:end,:);
newImageShift135HorizontalMultiMatrixGLCMsD13MinusOnes(2:end,2:end,:);
 
newImageShift135HorizontalMultiMatrixGLCMsD12MinusOnesFinal = newImageShift135HorizontalMultiMatrixGLCMsD12MinusOnes(2:end,2:end,:);
newImageShift135HorizontalMultiMatrixGLCMsD13MinusOnesFinal = newImageShift135HorizontalMultiMatrixGLCMsD13MinusOnes(2:end,2:end,:);
 
 
newImageShift135HorizontalMultiMatrixGLCMsD12 = newImageShift135HorizontalMultiMatrixGLCMsD12MinusOnes(2:end,2:end,:);
newImageShift135HorizontalMultiMatrixGLCMsD12;
newImageShift135HorizontalMultiMatrixGLCMsD13 = newImageShift135HorizontalMultiMatrixGLCMsD13MinusOnes(2:end,2:end,:);
newImageShift135HorizontalMultiMatrixGLCMsD13;
 
newImageShift135HorizontalMultiMatrixGLCMsD12MinusOnes = [];
newImageShift135HorizontalMultiMatrixGLCMsD13MinusOnes = [];
 
newImageShift135HorizontalMultiMatrixGLCMsD12MinusOnesFinal = [];
newImageShift135HorizontalMultiMatrixGLCMsD13MinusOnesFinal = [];
 
for iii = 1:MZ
    imwrite(uint8(255 * mat2gray(newImageShift135HorizontalMultiMatrixGLCMsD12(:,:,iii))),['D12_', num2str(iii), '.png'])
    
    imwrite(uint8(255 * mat2gray(newImageShift135HorizontalMultiMatrixGLCMsD13(:,:,iii))),['D13_', num2str(iii), '.png'])
end
 
newImage135 = [];
newImage135shift = [];
 
newImageShift135HorizontalMultiMatrixGLCMsD12 = [];
newImageShift135HorizontalMultiMatrixGLCMsD13 = [];
