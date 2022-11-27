function sys = make_system()

sys = struct();
sys.bodies = struct([]);

sys.joints = struct('revolute', struct([]),...
    'simple', struct([]),'simple_driving', struct([]));

end