function [T,Q] = solve_kinematics_fsolve(sys)
%Solve the multibody system sys on kinematics using fsolve method
q0 = initial_coordinates(sys);

%C = constraints(sys,q0,0);
%fprintf('Constraints norm before fsolve %g\n', norm(C))

q = fsolve(@(q) constraints(sys,q,0),q0);
T = 0;
Q = q;
end

