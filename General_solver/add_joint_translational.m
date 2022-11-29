function sys = add_joint_translational(sys, body_i, body_j, Q_i,P_i,P_j, phi0_i, phi0_j)
    arguments
        sys (1,1) struct
        body_i (1,1) string
        body_j (1,1) string
        Q_i (2,1) double = [0; 0]
        P_i (2,1) double = [0; 0]
        P_j (2,1) double = [0; 0]
        phi0_i (1,1) double = 0
        phi0_j (1,1) double = pi/2
        
    end

    joint = struct();
    joint.body_i_qidx = body_name_to_qidx(sys, body_i);
    joint.body_j_qidx = body_name_to_qidx(sys, body_j);
    joint.Q_i = Q_i;
    joint.P_i = P_i;
    joint.P_j = P_j;
    joint.phi0_i = phi0_i;
    joint.phi0_j = phi0_j;

    sys.joints.translational = [sys.joints.translational, joint];
end