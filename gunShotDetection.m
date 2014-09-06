% Person has a Gun
%% Let Gunshot fired  X=1
%% Let Gunshot not fired X=0
% Mic. --> Acq. Sys. --> DetectionAlgorithm --> DetectionOutput 
%% Let Gunshot Detected Y=1
%% Let Gunshot not Detected Y=0

% Failures / Errors: 
%% 1) Missed Detection Y=0|X=1  
%% 2) False Positive   Y=1|X=0
% Given

PX1=0.05;    % Prob(X=1)=0.1
PY0_X1=0.01;    %Prob(Y=0|X=1)=0.01 % Prob. of Missed Detection
PY1_X0=0.1;     %Prob(Y=1|X=0)=0.1  % Prob. of False Positive

%Q: Find the probability of 'Gunshot detected' P(Y=1)?
%% Using Theorem of Total Probability: P(Y)= P(Y,X)+P(Y,Xc)    where X & Xc partition the sample space 
%here P(Y,X)= Prob(Y intersection with X) and P(Y,Xc)=Prob(Y intersection with X complement)
PY1_X1=1-PY0_X1;
PX0=1-PX1;    % Prob(X=0)=0.9
disp('Probability of ''Detection Sys. has detected Gunshot'' = ')
PY1=(PY1_X0*PX0)+(PY1_X1*PX1) % Result
%Q Find the probability of 'Gunshot fired' given that 'Gunshot detected'
% P(X=1|Y=1)?
%% Using Baye's Rule: P(X=1|Y=1)  =  P(X=1,Y=1)/P(Y=1) =  (P(Y=1|X=1)*P(X=1))/P(Y=1)
disp('Probability of ''Gunshot fired'' given that ''Gunshot detected'' = ')
PX1_Y1=(PY1_X1*PX1)/PY1
PY0=1-PY1;
disp('Probability of ''Gunshot fired'' given that ''Gunshot not detected'' = ')
PX1_Y0=(PY0_X1*PX1)/PY0



