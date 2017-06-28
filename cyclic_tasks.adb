with System.IO; use System.IO;
with Ada.Real_Time; use Ada.Real_Time;

with System.BB.Threads;
with System.Address_Image;
with System_Time;

package body Cyclic_Tasks is

  task body Cyclic is
      Task_Static_Offset : constant Time_Span :=
               Ada.Real_Time.Microseconds (0);

      Next_Period : Ada.Real_Time.Time := System_Time.System_Start_Time
            + System_Time.Task_Activation_Delay + Task_Static_Offset;

      Period : constant Ada.Real_Time.Time_Span :=
               Ada.Real_Time.Microseconds (Cycle_Time);
      -- Other declarations
      type Proc_Access is access procedure(X : in out Integer);
      function Time_It(Action : Proc_Access; Arg : Integer) return Duration is
         Start_Time : Time := Clock;
         Finis_Time : Time;
         Func_Arg : Integer := Arg;
      begin
         Action(Func_Arg);
         Finis_Time := Clock;
         return To_Duration (Finis_Time - Start_Time);
      end Time_It;
      procedure Gauss(Times : in out Integer) is
         Num : Integer := 0;
      begin
         for I in 1..Times loop
            Num := Num + I;
         end loop;
      end Gauss;
      Gauss_Access : Proc_Access := Gauss'access;

      --  Self : System.BB.Threads.Thread_Id := System.BB.Threads.Thread_Self;
      Temp : Integer;
  begin
     -- Initialization code
     -- Setting artificial deadline: it forces system to read deadlines and use
     -- it as main ordering
      Put_Line ("---> Setting Prio;" & Integer'Image (Pri)
                & ";Task;" & Integer'Image (T_Num) &
       ";" & System.Address_Image (System.BB.Threads.Get_ATCB));

      loop
        delay until Next_Period;

        --  System.IO.Put_Line ("Gauss(" & Integer'Image(Gauss_Num) & ") takes"
        --      & Duration'Image(Time_It(Gauss_Access, Gauss_Num))
        --            & " seconds");

        Temp := Gauss_Num;
        Gauss (Temp);

        -- wait one whole period before executing
        -- Non-suspending periodic response code
        -- May include calls to protected procedures
        Next_Period := Next_Period + Period;
     end loop;
  end Cyclic;


  procedure Init is
  begin
     loop
        null;
     end loop;
  end Init;

end Cyclic_Tasks;
