pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b~unit05.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b~unit05.adb");

package body ada_main is
   pragma Warnings (Off);

   E054 : Short_Integer; pragma Import (Ada, E054, "ada__tags_E");
   E077 : Short_Integer; pragma Import (Ada, E077, "system__bb__timing_events_E");
   E099 : Short_Integer; pragma Import (Ada, E099, "system__tasking__protected_objects_E");
   E101 : Short_Integer; pragma Import (Ada, E101, "system__tasking__restricted__stages_E");
   E095 : Short_Integer; pragma Import (Ada, E095, "ada__real_time_E");
   E006 : Short_Integer; pragma Import (Ada, E006, "dfp_test_procedure_E");
   E103 : Short_Integer; pragma Import (Ada, E103, "system_time_E");
   E004 : Short_Integer; pragma Import (Ada, E004, "dfp_data_struct01_E");

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure adafinal is
      procedure s_stalib_adafinal;
      pragma Import (C, s_stalib_adafinal, "system__standard_library__adafinal");
   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      s_stalib_adafinal;
   end adafinal;

   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Zero_Cost_Exceptions : Integer;
      pragma Import (C, Zero_Cost_Exceptions, "__gl_zero_cost_exceptions");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Leap_Seconds_Support : Integer;
      pragma Import (C, Leap_Seconds_Support, "__gl_leap_seconds_support");

      procedure Install_Handler;
      pragma Import (C, Install_Handler, "__gnat_install_handler");

      Handler_Installed : Integer;
      pragma Import (C, Handler_Installed, "__gnat_handler_installed");
   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
      Main_Priority := 0;
      Time_Slice_Value := 0;
      WC_Encoding := 'b';
      Locking_Policy := 'C';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := 'F';
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Zero_Cost_Exceptions := 0;
      Detect_Blocking := 1;
      Default_Stack_Size := -1;
      Leap_Seconds_Support := 0;

      if Handler_Installed = 0 then
         Install_Handler;
      end if;

      System.Bb.Timing_Events'Elab_Spec;
      E077 := E077 + 1;
      Ada.Tags'Elab_Body;
      E054 := E054 + 1;
      System.Tasking.Protected_Objects'Elab_Body;
      E099 := E099 + 1;
      System.Tasking.Restricted.Stages'Elab_Body;
      E101 := E101 + 1;
      Ada.Real_Time'Elab_Spec;
      Ada.Real_Time'Elab_Body;
      E095 := E095 + 1;
      Dfp_Test_Procedure'Elab_Spec;
      System_Time'Elab_Spec;
      E103 := E103 + 1;
      Dfp_Test_Procedure'Elab_Body;
      E006 := E006 + 1;
      Dfp_Data_Struct01'Elab_Spec;
      E004 := E004 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_unit05");

   procedure main is
      procedure Initialize (Addr : System.Address);
      pragma Import (C, Initialize, "__gnat_initialize");

      procedure Finalize;
      pragma Import (C, Finalize, "__gnat_finalize");
      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
   end;

--  BEGIN Object file/option list
   --   ./s-bbdebu.o
   --   ./s-bbstat.o
   --   ./s-bcprmu.o
   --   ./s-bbthqu.o
   --   ./s-bbprot.o
   --   ./s-osinte.o
   --   ./s-mufalo.o
   --   ./s-bbthre.o
   --   ./s-bbinte.o
   --   ./s-bbcppr.o
   --   ./s-bbtiev.o
   --   ./s-bbtime.o
   --   ./s-taspri.o
   --   ./s-soflin.o
   --   ./s-tasdeb.o
   --   ./s-taprop.o
   --   ./s-bbsule.o
   --   ./s-bbbosu.o
   --   ./s-wchstw.o
   --   ./s-memory.o
   --   ./s-stalib.o
   --   ./s-taskin.o
   --   ./a-tags.o
   --   ./a-exctra.o
   --   ./s-taprob.o
   --   ./s-tasres.o
   --   ./s-tarest.o
   --   ./a-except.o
   --   ./s-traceb.o
   --   ./a-reatim.o
   --   ./a-retide.o
   --   ./system_time.o
   --   ./dfp_test_procedure.o
   --   ./dfp_data_struct01.o
   --   ./unit05.o
   --   -L./
   --   -L./raven-prio/
   --   -L/usr/gnat-rvs/lib/gcc/leon-elf/4.5.4/rts-ravenscar/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
