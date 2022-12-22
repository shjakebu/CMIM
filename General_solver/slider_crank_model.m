%%PREPROCESSOR
clc;
close all;
clear all;
% Bodies
%Describe: location, orientation, name
sys = make_system();

sys = add_body(sys,"shaft");
sys = add_body(sys, "cylinder", [0, 0.2])
sys = add_body(sys,"crank",[0, 0.05], deg2rad(0));
sys = add_body(sys,"rod", [0, 0.15], deg2rad(0));
sys = add_body(sys, "piston", [0, 0.175]);

% Joints -kinematic (revolute and simple)
sys = add_joint_revolute(sys, "shaft", "crank", [0; 0], [0; -0.05]);
sys = add_joint_revolute(sys, "crank", "rod", [0; 0.05], [0; -0.1]);
sys = add_joint_revolute(sys, "rod", "piston", [0; 0.2], [0; -0.025]);
sys = add_joint_translational(sys, "piston", "cylinder",[0; 0], [0; 0.1]);

sys = add_joint_simple(sys, "shaft", "x");
sys = add_joint_simple(sys, "shaft", "y");
sys = add_joint_simple(sys, "shaft", "fi");

% sys = add_joint_simple(sys, "slider", "y");
% sys = add_joint_simple(sys, "slider", "fi");



sys = add_joint_simple(sys, "cylinder", "x");
sys = add_joint_simple(sys, "cylinder", "y");
sys = add_joint_simple(sys, "cylinder", "fi");

sys = add_joint_simple_driving(sys, "crank", "fi",...
    @(t) -deg2rad(30)-1.2*t,...
    @(t) -1.2, @(t) 0);

sys = set_solver_settings(sys, 10, 0.1);

%% SOLVER fsolve
% q0 = initial_coordinates(sys)
% q = fsolve(@(q) constraints(sys,q,0),q0)
%[Tf, Qf] = solve_kinematics_fsolve(sys);
% C = constraints(sys, Q, 0);
% fprintf('Constraints norm after fsolve %g\n', norm(C))
%% SOLVER NR
[T, Q, Qd, Qdd] = solve_kinematics_NR(sys);
%Qd
%% POSTPROCESSING
pidx = 14;
hold on
plot(T, Q(pidx,:))
plot(T, Qd(pidx,:))
plot(T, Qdd(pidx,:))
legend({'position','velocity', 'acceleration'})
xlabel("Time")
ylabel("Position")