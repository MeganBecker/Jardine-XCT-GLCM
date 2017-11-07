
% GLCM statistics calculation: Energy, Contrast, Correlation, Homogeneity.
% Created 2017 by Jardine, Miller & Becker in Computers and Geosciences.


clear all
clc

d = dir('*.png');
d = rmfield(d,'date');
d = rmfield(d, 'bytes');
d = rmfield(d, 'datenum');
d = rmfield(d, 'isdir');
 
Directory = d;
 
x = [];
   
    for i = 1:length(d);
        name = getfield(d(i), 'name');
        x = imread(name);
        GLCMStack(:,:,i) = x;
    end
GLCMStack;
 
[r,c,z] = size(GLCMStack);
Max = [max(GLCMStack(:))+1];
 
statsD1Contrast = [];
statsD1StructContrast = [];
statsD1StructHomogeneity = [];
statsD1StructEnergy = [];
statsD1StructCorrelation = [];
GLCM = [];
 
for ii = 1:z
    GLCM = GLCMStack(:,:,ii); 
    
    statsD1Contrast = graycoprops(GLCM,{'contrast'});
    statsD1StructContrast =[statsD1StructContrast, statsD1Contrast];
    
    statsD1Homogeneity = graycoprops(GLCM,{'homogeneity'});
    statsD1StructHomogeneity = [statsD1StructHomogeneity, statsD1Homogeneity];
        
    statsD1Energy = graycoprops(GLCM,{'energy'});
    statsD1StructEnergy = [statsD1StructEnergy, statsD1Energy];
       
    statsD1Correlation = graycoprops(GLCM,{'correlation'});
    statsD1StructCorrelation = [statsD1StructCorrelation, statsD1Correlation];
    
    ((100/z)*ii)
end


 
 
statsD1StructContrast2cell = struct2cell(statsD1StructContrast(:));
xlswrite('Stats.xls', statsD1StructContrast2cell(1:250), 'Contrast', 'A1');
xlswrite('Stats.xls', statsD1StructContrast2cell(251:500), 'Contrast', 'A2');
xlswrite('Stats.xls', statsD1StructContrast2cell(501:750), 'Contrast', 'A3');
xlswrite('Stats.xls', statsD1StructContrast2cell(751:1000), 'Contrast', 'A4');
 
statsD1structHomogeneity2cell = struct2cell(statsD1StructHomogeneity(:));
xlswrite('Stats.xls', statsD1structHomogeneity2cell(1:250), 'Homogeneity', 'A1');
xlswrite('Stats.xls', statsD1structHomogeneity2cell(251:500), 'Homogeneity', 'A2');
xlswrite('Stats.xls', statsD1structHomogeneity2cell(501:750), 'Homogeneity', 'A3');
xlswrite('Stats.xls', statsD1structHomogeneity2cell(751:1000), 'Homogeneity', 'A4');
 
statsD1structEnergy2cell = struct2cell(statsD1StructEnergy(:));
xlswrite('Stats.xls', statsD1structEnergy2cell(1:250), 'Energy', 'A1');
xlswrite('Stats.xls', statsD1structEnergy2cell(251:500), 'Energy', 'A2');
xlswrite('Stats.xls', statsD1structEnergy2cell(501:750), 'Energy', 'A3');
xlswrite('Stats.xls', statsD1structEnergy2cell(751:1000), 'Energy', 'A4');
 
statsD1structCorrelation2cell = struct2cell(statsD1StructCorrelation(:));
xlswrite('Stats.xls', statsD1structCorrelation2cell(1:250), 'Correlation', 'A1');
xlswrite('Stats.xls', statsD1structCorrelation2cell(251:500), 'Correlation', 'A2');
xlswrite('Stats.xls', statsD1structCorrelation2cell(501:750), 'Correlation', 'A3');
xlswrite('Stats.xls', statsD1structCorrelation2cell(751:1000), 'Correlation', 'A4');






