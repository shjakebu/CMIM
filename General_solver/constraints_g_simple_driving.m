function Cg = constraints_g_simple_driving(sys,q)
Cg = zeros(length(sys.joints.simple_driving),1);
c_id = 0;

for j = sys.joints.simple_driving
    qi = q(j.body_qidx);
    C(c_id+1) = 0;
    c_id = c_id + 1;
end
    
end