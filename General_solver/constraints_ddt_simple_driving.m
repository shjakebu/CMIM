function Ctt = constraints_ddt_simple_driving(sys,t)


Ctt = zeros(length(sys.joints.simple_driving),1);
c_id = 0;

for j = sys.joints.simple_driving
    Ctt(c_id+1) = -j.coord_fun_ddt(t);
    c_id = c_id + 1;
end
    
end