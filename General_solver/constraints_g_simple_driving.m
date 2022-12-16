function Cg = constraints_g_simple_driving(sys,q)
Cg = zeros(length(sys.joints.simple_driving),length(q));
c_id = 0;

for j = sys.joints.simple_driving
    Cg(c_id+1, j.body_qidx(j.coord_id)) = 0;
    c_id = c_id + 1;
end
    
end