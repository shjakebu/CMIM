% Add two bodies to the system and verify they exist
sys = make_system();
sys = add_body(sys, "ground");
sys = add_body(sys, "slider");

try
    check_body_exists(sys,"ground")
catch exception
    assert(false,"Body ground not found")
end

try
    check_body_exists(sys,"slider")
catch exception
    assert(false,"Body slider not found")
end

try
    check_body_exists(sys,"slidar")
    assert(false,"Body slider not found")
catch exception
end