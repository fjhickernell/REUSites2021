%% Plot of IID and Sobol Points
function PlotPoints(bwcolor)
gail.InitializeDisplay %clean up 
format long

if ~nargin
   bwcolor = 'color';
end

if strcmp(bwcolor,'bw')
   black = [0 0 0];
   MATLABBlue = black;
   MATLABOrange = black;
   MATLABPurple = black;
   MATLABGreen = black;
   %MATLABCyan = black;
end

%% Plot IID Random Points
rng(2947)
n = 64;
d = 2;
tick = 0:1;
xIID = rand(n,d);
figure
plot(xIID(:,1),xIID(:,2),'.','color',MATLABBlue)
%xlabel('\(T_{i1}\)'); ylabel('\(T_{i2}\)')
xlabel('\(x_{i1}\)'); ylabel('\(x_{i2}\)')
title([int2str(n) ' IID ${\cal U}[0,1]^2$ Points'])
axis square
set(gca,'xtick',tick,'ytick',tick)
print -depsc IIDPoints.eps

% %% Plot Unscramled Sobol Points
% xUSobol = net(sobolset(d),n);
% figure
% plot(xUSobol(:,1),xUSobol(:,2),'.','color',MATLABOrange)
% xlabel('\(x_{i1}\)')
% ylabel('\(x_{i2}\)')
% title('Unscrambled Sobol'' Nodes')
% axis square
% set(gca,'xtick',tick,'ytick',tick)
% print -depsc USobolPoints.eps

% %% Plot Scramled Sobol Points
% xSSobol = net(scramble(sobolset(d),'MatousekAffineOwen'),n);
% figure
% plot(xSSobol(:,1),xSSobol(:,2),'.','color',MATLABPurple)
% %xlabel('\(X_{i1}\)'); ylabel('\(X_{i2}\)')
% xlabel('\(X_{i1}^{\mbox{LD}}\)'); ylabel('\(X_{i2}^{\mbox{LD}}\)')
% %title('Scrambled Sobol'' Nodes')
% axis square
% set(gca,'xtick',tick,'ytick',tick)
% print -depsc SSobolPoints.eps
% 
%% Plot Lattice Points
rng(47)
xlattice = gail.lattice_gen(1,n,d);
shift = rand(1,d);
sxlat = mod(bsxfun(@plus,xlattice,shift),1); 
figure
plot(sxlat(:,1),sxlat(:,2),'.','color',MATLABBlue)
xlabel('\(x_{i1}\)'); ylabel('\(x_{i2}\)')
title([int2str(n) ' LD Lattice ${\cal U}[0,1]^2$ Points'])
%title('Shifted Lattice Nodes')
axis square
set(gca,'xtick',tick,'ytick',tick)
print -depsc ShiftedLatticePoints.eps

