function Cq = constraints_dq_translational(sys,q)
%Compute constraints for translational joints
Cq = zeros(2*length(sys.joints.translational),length(q));
c_id = 0;

O = omega();
I = eye(2);

for j = sys.joints.translational
    qi = q(j.body_i_qidx);
    qj = q(j.body_j_qidx);
    Ai = rot(qi(3));
    Aj = rot(qj(3));
    ni_ = flip(qi(1:2));
    ni_(1) = -ni_(1);
    ni = Ai*ni_;
    RA = [transpose(qj(1:2)-ni)*transpose(Aj)*I,transpose(qj(1:2)-ni)*transpose(Aj)*(O*Ai*j.s_i)];
    RB = -[transpose(qj(1:2)-ni)*transpose(Aj)*I,transpose(qj(1:2)-ni)*I*qi(1:2)];
    Cq(c_id+(1:2), j.body_i_qidx) = [RA;
        0 0 1];
    Cq(c_id+(1:2), j.body_j_qidx) = [RB;
        0 0 -1];
    c_id = c_id +2;
end

end