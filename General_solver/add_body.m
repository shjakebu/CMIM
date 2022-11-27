function sys = add_body(sys, name, location, orientation)
%Add_body add single body to our multibody system
    arguments
        sys (1,1) struct
        name (1,1) string
        location (2,1) double = [0; 0]
        orientation (1,1) double = 0;
    end
    body = struct("name",name);
    body.location = location;
    body.orientation = orientation;
    
    sys.bodies = [sys.bodies,body];
end