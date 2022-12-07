%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% 4th order SBP Finite differece Op.          %%%
%%%                                             %%%
%%%                                             %%%
%%% H           (Norm)                          %%%
%%% D1          (first derivative)              %%%
%%% D2          (second derivative)             %%%
%%%                                             %%%
%%% AD is the discretisation with Dirichlet BC  %%%
%%% AN is the discretisation with Neumann BC    %%%
%%% or Robin:                                   %%%
%%%                                             %%%
%%% b*u+u_x=0, x=x_l                            %%%
%%% b*u-u_x=0, x=x_r                            %%%
%%%                                             %%%
%%% here b <= 0 (b=0 is Neumann)                %%%
%%%                                             %%%
%%% m is the number opf grid-points, L is the   %%%
%%% width of the domain. Gris-space h=L/(m-1)   %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [AD, AN]=FSBP4(m,b)

x_l=-1; x_r=1; 

h=(x_r-x_l)/(m-1); % Grid space

if nargin == 1
    b=0;
end

% 

H=diag(ones(m,1),0);
H(1:4,1:4)=diag([17/48 59/48 43/48 49/48]);
H(m-3:m,m-3:m)=fliplr(flipud(diag([17/48 59/48 43/48 49/48])));
H=H*h;
HI=inv(H);

   
Q=(-1/12*diag(ones(m-2,1),2)+8/12*diag(ones(m-1,1),1)-8/12*diag(ones(m-1,1),-1)+1/12*diag(ones(m-2,1),-2));
Q_U = [0 0.59e2 / 0.96e2 -0.1e1 / 0.12e2 -0.1e1 / 0.32e2; -0.59e2 / 0.96e2 0 0.59e2 / 0.96e2 0; 0.1e1 / 0.12e2 -0.59e2 / 0.96e2 0 0.59e2 / 0.96e2; 0.1e1 / 0.32e2 0 -0.59e2 / 0.96e2 0;];
Q(1:4,1:4)=Q_U;
Q(m-3:m,m-3:m)=flipud( fliplr(-Q_U(1:4,1:4) ) );

e_1=zeros(m,1);e_1(1)=1;
e_m=zeros(m,1);e_m(m)=1;

D1=HI*(Q-1/2*e_1*e_1'+1/2*e_m*e_m') ;

M_U=[0.9e1 / 0.8e1 -0.59e2 / 0.48e2 0.1e1 / 0.12e2 0.1e1 / 0.48e2; -0.59e2 / 0.48e2 0.59e2 / 0.24e2 -0.59e2 / 0.48e2 0; 0.1e1 / 0.12e2 -0.59e2 / 0.48e2 0.55e2 / 0.24e2 -0.59e2 / 0.48e2; 0.1e1 / 0.48e2 0 -0.59e2 / 0.48e2 0.59e2 / 0.24e2;];
M=-(-1/12*diag(ones(m-2,1),2)+16/12*diag(ones(m-1,1),1)+16/12*diag(ones(m-1,1),-1)-1/12*diag(ones(m-2,1),-2)-30/12*diag(ones(m,1),0));

M(1:4,1:4)=M_U;

M(m-3:m,m-3:m)=flipud( fliplr( M_U ) );
M=M/h;

S_U=[-0.11e2 / 0.6e1 3 -0.3e1 / 0.2e1 0.1e1 / 0.3e1;]/h;
S_1=zeros(1,m);
S_1(1:4)=S_U;
S_m=zeros(1,m);
S_m(m-3:m)=fliplr(-S_U);

D2=HI*(-M-e_1*S_1+e_m*S_m);


alpha=.2508560249;     % How much we can borrow
penalty=1.2;             % must be >= 1, higher leads to stiffness
tau=-penalty/(h*alpha); % Needed for Dirichlet BC

AN=-HI*M+b*(e_1*e_1'+e_m*e_m');
AD=D2+HI*(-e_1*S_1+e_m*S_m)'+tau*HI*(e_1*e_1'+e_m*e_m');

