%%PREPROCESSOR

% Bodies
%Describe: location, orientation, name
sys = make_system();

sys = add_body(sys,"ground");
sys = add_body(sys,"crank",[-0.1, 0.05], -deg2rad(30));
sys = add_body(sys,"link", [-0.5, 0.05], deg2rad(15));
sys = add_body(sys, "slider", [-0.7, 0]);

% Joints -kinematic (revolute and simple)
sys = add_joint_revolute(sys, "ground", "crank", [0; 0], [0.1; 0]);
sys = add_joint_revolute(sys, "crank", "link", [-0.1; 0], [0.3; 0]);
sys = add_joint_revolute(sys, "link", "slider", [-0.2; 0]);

%sys = add_joint_simple(sys, "slider", "y");
%sys = add_joint_simple(sys, "slider", "fi");

sys = add_joint_translational(sys, "slider", "ground", [0;0],[0;0]);

sys = add_joint_simple(sys, "ground", "x");
sys = add_joint_simple(sys, "ground", "y");
sys = add_joint_simple(sys, "ground", "fi");

sys = add_joint_simple_driving(sys, "crank", "fi",...
    @(t) -deg2rad(30)-1.2*t,...
    @(t) -1.2);

sys = set_solver_settings(sys, 10, 0.1);

%% SOLVER fsolve
% q0 = initial_coordinates(sys)
% q = fsolve(@(q) constraints(sys,q,0),q0)
%[Tf, Qf] = solve_kinematics_fsolve(sys);
% C = constraints(sys, Q, 0);
% fprintf('Constraints norm after fsolve %g\n', norm(C))
%% SOLVER NR
[T, Q, Qd] = solve_kinematics_NR(sys);
%Qd
%% POSTPROCESSING
pidx = 4;
plot(Tf, Qf(pidx,:))