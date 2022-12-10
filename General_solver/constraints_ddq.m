function Cdq = constraints_ddq(sys,dq)
 Cdq = [
     constraints_ddq_revolute(sys,dq)
     constraints_ddq_simple(sys,dq)
     constraints_ddq_simple_driving(sys,dq)
     ];
