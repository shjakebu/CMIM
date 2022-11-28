function sys = add_joint_simple_driving(sys, body_name, coord_name, coord_fun, coord_fun_dt)
    arguments
        sys (1,1) struct
        body_name (1,1) string
        coord_name (1,1) string
        coord_fun (1,1) function_handle
        coord_fun_dt (1,1) function_handle
    end
    check_body_exists(sys, body_name)

    if coord_name == "x"
        c_id = 1;
    elseif coord_name == "y"
        c_id = 2;
    elseif coord_name == "fi"
        c_id = 3;
    else
        error("Unknown coordinate name %s!", coord_name);
    end

    j = struct();
    j.body_qidx = body_name_to_qidx(sys, body_name);
    j.coord_id = c_id;
    j.coord_fun = coord_fun;
    j.coord_fun_dt = coord_fun_dt;

    sys.joints.simple_driving = [sys.joints.simple_driving, j];
end