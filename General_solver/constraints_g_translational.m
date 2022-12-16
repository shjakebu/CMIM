function Cg = constraints_g_translational(sys,q, qd)
%Compute constraints for revolute joints
Cg = zeros(2*length(sys.joints.translational),length(qd));

O = omega();
I = eye(2);
c_id = 0;

for j = sys.joints.translational
    qi = q(j.body_i_qidx);
    qj = q(j.body_j_qidx);
    qid = q(j.body_i_qidx);
    qjd = q(j.body_j_qidx);
    Ai = rot(qi(3));
    Aj = rot(qj(3));
    ni_ = flip(qi(1:2));
    ni_(1) = -ni_(1);
    ni = Ai*ni_;
    Pi = qi(1:2);
    Qi = qi(1:2)+0.1*qi(1:2);   %Get a point on same line with Pi and Pj
    Pj = qj(1:2);
    xPi = Pi(1);
    yPi = Pi(2);
    xQi = Qi(1);
    yQi = Qi(2);
    xPj = Pj(1);
    yPj = Pj(2);
    xidot = qid(1);
    xjdot = qjd(1);
    yidot = qid(2);
    yjdot = qjd(2);
    phidot_i = qid(3);
    phidot_j = qjd(3);
    xi = qi(1);
    yi = qi(2);
    xj = qj(1);
    yj = qj(2);
    Cg(c_id+(1:2)) = [-2*((xPi-xQi)*(xidot-xjdot)+(yPi-yQi)*(yidot-yjdot))...
        *phidot_i-((xPi-xQi)*(yi-yj)-(yPi-yQi)*(xi-xj))*phidot_i^2;
        0];
    c_id = c_id +2;
end

end