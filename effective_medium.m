clc
clear all
close all

% --- Step 1 ---
% Maxwell Garnett Theory

% epsi = 10;
% epsh = 1; 
% f = linspace(0,0.9,200); % fill factor
% 
% for j=1:200
%     epsMG(j) = epsh*(1 + 3*f(j)*(epsi-epsh)/(epsi+2*epsh-f(j)*(epsi-epsh)));
% end
% 
% plot(f,epsMG)

% --- Step 2 ---
% hyperbolic permittivity mediums 

ff = 0.4; %fill factor
c = 299792458;
lambda = linspace(0.2e-6,2e-6,10000);
w = 2*pi*(c./lambda);
wp = 2*pi*2.18*10^15;
gamma = 2*pi*4.35*10^12;

epsh = 2.25; % permittivity of dielectric
epsi = 1 - wp^2./(w.^2-1i*gamma.*w); 

eps_parallel = ff.*epsi + (1-ff)*epsh;
eps_orthogonal = (epsi.*epsh)/(ff*epsh+(1-ff).*epsi);

condition = real(eps_orthogonal)*real(eps_parallel);
figure
plot(lambda,condition)


% --- Step 3 ---
% hyperbolic permittivity mediums with wire structure 

% ff = 0.3;
% 
% eps_parallel = ff.*epsi + (1-ff)*epsh;
% eps_orthogonal = epsh*(1 + 2*ff*(epsi-epsh)/(epsi+epsh-ff*(epsi-epsh)));
% 
% condition = real(eps_orthogonal)*real(eps_parallel);
% 
% plot(lambda,condition)