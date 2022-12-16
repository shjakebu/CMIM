function Cg = constraints_g_revolute(sys,q, qd)
%Compute constraints for revolute joints
Cg = zeros(2*length(sys.joints.revolute),length(q));
c_id = 0;


for j = sys.joints.revolute
    qi = q(j.body_i_qidx);
    qj = q(j.body_j_qidx);
    qid = qd(j.body_i_qidx);
    qjd = qd(j.body_j_qidx);
    phidot_i = qid(3);
    phidot_j = qjd(3);
    Ai = rot(qi(3));
    Aj = rot(qj(3));
    Cg(c_id+(1:2)) = Ai*j.s_i*phidot_i^2-Aj*j.s_j*phidot_j^2;
    c_id = c_id +2;
end
    
end

