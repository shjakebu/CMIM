function Cg = constraints_g_simple(sys,q)
Cg = zeros(length(sys.joints.simple),1);
c_id = 0;

for j = sys.joints.simple
    qi = q(j.body_qidx);
    C(c_id+1) = 0;
    c_id = c_id + 1;
end
    
end