function Cg = constraints_g_simple_driving(sys,q,t)
Cg = zeros(length(sys.joints.simple_driving),1);
c_id = 0;

for j = sys.joints.simple_driving
    qi = q(j.body_qidx);
    Cg(c_id+1) = -j.coord_fun_ddt(t);
    c_id = c_id + 1;
end
    
end