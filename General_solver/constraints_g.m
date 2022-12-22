function Cg = constraints_g(sys,q,dq,t)
 Cg = [
     constraints_g_revolute(sys,q,dq)
     constraints_g_simple(sys,q)
     constraints_g_translational(sys,q,dq)
     constraints_g_simple_driving(sys,q,t)
     ];