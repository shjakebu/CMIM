function Cdq = constraints_ddq_revolute(sys,dq)
%Compute constraints for revolute joints
Cdq = zeros(2*length(sys.joints.revolute),length(dq));
c_id = 0;

for j = sys.joints.revolute
    dqi = q(j.body_i_qidx);
    dqj = q(j.body_j_qidx);
    Ai = rot(dqi(3));
    Aj = rot(dqj(3));
    phi_i = dqi(3)
    phi_j = 

    Cq(c_id+(1:2), j.body_i_qidx) = [I, O*Ai*j.s_i];
    Cq(c_id+(1:2), j.body_j_qidx) = -[I, O*Aj*j.s_j];
    c_id = c_id +2;
end
    
end