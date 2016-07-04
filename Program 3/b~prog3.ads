pragma Ada_95;
with System;
package ada_main is
   pragma Warnings (Off);

   gnat_argc : Integer;
   gnat_argv : System.Address;
   gnat_envp : System.Address;

   pragma Import (C, gnat_argc);
   pragma Import (C, gnat_argv);
   pragma Import (C, gnat_envp);

   gnat_exit_status : Integer;
   pragma Import (C, gnat_exit_status);

   GNAT_Version : constant String :=
                    "GNAT Version: GPL 2010 (20100603)" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   Ada_Main_Program_Name : constant String := "_ada_prog3" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adafinal;
   pragma Export (C, adafinal, "adafinal");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure Break_Start;
   pragma Import (C, Break_Start, "__gnat_break_start");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer;
   pragma Export (C, main, "main");

   type Version_32 is mod 2 ** 32;
   u00001 : constant Version_32 := 16#f40f1d64#;
   pragma Export (C, u00001, "prog3B");
   u00002 : constant Version_32 := 16#6385d640#;
   pragma Export (C, u00002, "system__standard_libraryB");
   u00003 : constant Version_32 := 16#7dfbfff3#;
   pragma Export (C, u00003, "system__standard_libraryS");
   u00004 : constant Version_32 := 16#9c7dd3ea#;
   pragma Export (C, u00004, "adaS");
   u00005 : constant Version_32 := 16#03bc737c#;
   pragma Export (C, u00005, "ada__integer_text_ioB");
   u00006 : constant Version_32 := 16#efa41264#;
   pragma Export (C, u00006, "ada__integer_text_ioS");
   u00007 : constant Version_32 := 16#6c2d7d44#;
   pragma Export (C, u00007, "ada__exceptionsB");
   u00008 : constant Version_32 := 16#1f4e534f#;
   pragma Export (C, u00008, "ada__exceptionsS");
   u00009 : constant Version_32 := 16#ba011fb9#;
   pragma Export (C, u00009, "ada__exceptions__last_chance_handlerB");
   u00010 : constant Version_32 := 16#62eb6abe#;
   pragma Export (C, u00010, "ada__exceptions__last_chance_handlerS");
   u00011 : constant Version_32 := 16#b0a7514b#;
   pragma Export (C, u00011, "systemS");
   u00012 : constant Version_32 := 16#fc53e595#;
   pragma Export (C, u00012, "system__soft_linksB");
   u00013 : constant Version_32 := 16#ad25662d#;
   pragma Export (C, u00013, "system__soft_linksS");
   u00014 : constant Version_32 := 16#155c2ca5#;
   pragma Export (C, u00014, "system__parametersB");
   u00015 : constant Version_32 := 16#dc79bc6e#;
   pragma Export (C, u00015, "system__parametersS");
   u00016 : constant Version_32 := 16#873439f6#;
   pragma Export (C, u00016, "system__secondary_stackB");
   u00017 : constant Version_32 := 16#c6b17a96#;
   pragma Export (C, u00017, "system__secondary_stackS");
   u00018 : constant Version_32 := 16#2ce209da#;
   pragma Export (C, u00018, "system__storage_elementsB");
   u00019 : constant Version_32 := 16#14722d6d#;
   pragma Export (C, u00019, "system__storage_elementsS");
   u00020 : constant Version_32 := 16#892f4d5b#;
   pragma Export (C, u00020, "system__stack_checkingB");
   u00021 : constant Version_32 := 16#5c6db3f0#;
   pragma Export (C, u00021, "system__stack_checkingS");
   u00022 : constant Version_32 := 16#2f60aa04#;
   pragma Export (C, u00022, "system__exception_tableB");
   u00023 : constant Version_32 := 16#6764b71c#;
   pragma Export (C, u00023, "system__exception_tableS");
   u00024 : constant Version_32 := 16#e43c4f3d#;
   pragma Export (C, u00024, "system__htableB");
   u00025 : constant Version_32 := 16#e8128b73#;
   pragma Export (C, u00025, "system__htableS");
   u00026 : constant Version_32 := 16#cc0e9903#;
   pragma Export (C, u00026, "system__string_hashB");
   u00027 : constant Version_32 := 16#d842fc5d#;
   pragma Export (C, u00027, "system__string_hashS");
   u00028 : constant Version_32 := 16#88c8686c#;
   pragma Export (C, u00028, "system__exceptionsB");
   u00029 : constant Version_32 := 16#f4f81e8f#;
   pragma Export (C, u00029, "system__exceptionsS");
   u00030 : constant Version_32 := 16#6997f8be#;
   pragma Export (C, u00030, "system__tracebackB");
   u00031 : constant Version_32 := 16#33e0b901#;
   pragma Export (C, u00031, "system__tracebackS");
   u00032 : constant Version_32 := 16#705eabae#;
   pragma Export (C, u00032, "system__unsigned_typesS");
   u00033 : constant Version_32 := 16#08a5f9f2#;
   pragma Export (C, u00033, "system__wch_conB");
   u00034 : constant Version_32 := 16#8063dc8a#;
   pragma Export (C, u00034, "system__wch_conS");
   u00035 : constant Version_32 := 16#776b72d1#;
   pragma Export (C, u00035, "system__wch_stwB");
   u00036 : constant Version_32 := 16#0414937b#;
   pragma Export (C, u00036, "system__wch_stwS");
   u00037 : constant Version_32 := 16#906233be#;
   pragma Export (C, u00037, "system__wch_cnvB");
   u00038 : constant Version_32 := 16#2b839b61#;
   pragma Export (C, u00038, "system__wch_cnvS");
   u00039 : constant Version_32 := 16#a69cad5c#;
   pragma Export (C, u00039, "interfacesS");
   u00040 : constant Version_32 := 16#093802d2#;
   pragma Export (C, u00040, "system__wch_jisB");
   u00041 : constant Version_32 := 16#a310dddb#;
   pragma Export (C, u00041, "system__wch_jisS");
   u00042 : constant Version_32 := 16#fe5e1c6e#;
   pragma Export (C, u00042, "system__traceback_entriesB");
   u00043 : constant Version_32 := 16#16c9a32b#;
   pragma Export (C, u00043, "system__traceback_entriesS");
   u00044 : constant Version_32 := 16#8b4d300d#;
   pragma Export (C, u00044, "ada__tagsB");
   u00045 : constant Version_32 := 16#37af8ac1#;
   pragma Export (C, u00045, "ada__tagsS");
   u00046 : constant Version_32 := 16#5056e8dd#;
   pragma Export (C, u00046, "system__val_lluB");
   u00047 : constant Version_32 := 16#8c05b9a9#;
   pragma Export (C, u00047, "system__val_lluS");
   u00048 : constant Version_32 := 16#0d0a8d0c#;
   pragma Export (C, u00048, "system__val_utilB");
   u00049 : constant Version_32 := 16#ea892c27#;
   pragma Export (C, u00049, "system__val_utilS");
   u00050 : constant Version_32 := 16#895f8c1e#;
   pragma Export (C, u00050, "system__case_utilB");
   u00051 : constant Version_32 := 16#ae247bd1#;
   pragma Export (C, u00051, "system__case_utilS");
   u00052 : constant Version_32 := 16#22e6f3e8#;
   pragma Export (C, u00052, "ada__text_ioB");
   u00053 : constant Version_32 := 16#bd8f93fb#;
   pragma Export (C, u00053, "ada__text_ioS");
   u00054 : constant Version_32 := 16#a8d17654#;
   pragma Export (C, u00054, "ada__streamsS");
   u00055 : constant Version_32 := 16#62e56d2b#;
   pragma Export (C, u00055, "interfaces__c_streamsB");
   u00056 : constant Version_32 := 16#5ac694a5#;
   pragma Export (C, u00056, "interfaces__c_streamsS");
   u00057 : constant Version_32 := 16#c1c3e13e#;
   pragma Export (C, u00057, "system__crtlS");
   u00058 : constant Version_32 := 16#af90b312#;
   pragma Export (C, u00058, "system__file_ioB");
   u00059 : constant Version_32 := 16#d3a29cd0#;
   pragma Export (C, u00059, "system__file_ioS");
   u00060 : constant Version_32 := 16#1a3a7ed3#;
   pragma Export (C, u00060, "ada__finalizationB");
   u00061 : constant Version_32 := 16#37a7e042#;
   pragma Export (C, u00061, "ada__finalizationS");
   u00062 : constant Version_32 := 16#6d0998e1#;
   pragma Export (C, u00062, "system__finalization_rootB");
   u00063 : constant Version_32 := 16#c1e390d6#;
   pragma Export (C, u00063, "system__finalization_rootS");
   u00064 : constant Version_32 := 16#9801f8ef#;
   pragma Export (C, u00064, "system__finalization_implementationB");
   u00065 : constant Version_32 := 16#c167d1d8#;
   pragma Export (C, u00065, "system__finalization_implementationS");
   u00066 : constant Version_32 := 16#d4614e59#;
   pragma Export (C, u00066, "system__restrictionsB");
   u00067 : constant Version_32 := 16#be07cc11#;
   pragma Export (C, u00067, "system__restrictionsS");
   u00068 : constant Version_32 := 16#bf6c093b#;
   pragma Export (C, u00068, "system__stream_attributesB");
   u00069 : constant Version_32 := 16#0aa29e81#;
   pragma Export (C, u00069, "system__stream_attributesS");
   u00070 : constant Version_32 := 16#b9796a38#;
   pragma Export (C, u00070, "ada__io_exceptionsS");
   u00071 : constant Version_32 := 16#59507545#;
   pragma Export (C, u00071, "interfaces__cB");
   u00072 : constant Version_32 := 16#767cb61b#;
   pragma Export (C, u00072, "interfaces__cS");
   u00073 : constant Version_32 := 16#7c3c6ade#;
   pragma Export (C, u00073, "interfaces__c__stringsB");
   u00074 : constant Version_32 := 16#6c09f761#;
   pragma Export (C, u00074, "interfaces__c__stringsS");
   u00075 : constant Version_32 := 16#7c698ebf#;
   pragma Export (C, u00075, "system__crtl__runtimeS");
   u00076 : constant Version_32 := 16#0255db5c#;
   pragma Export (C, u00076, "system__img_intB");
   u00077 : constant Version_32 := 16#47da4277#;
   pragma Export (C, u00077, "system__img_intS");
   u00078 : constant Version_32 := 16#16bc7b43#;
   pragma Export (C, u00078, "system__os_libB");
   u00079 : constant Version_32 := 16#77f99f4f#;
   pragma Export (C, u00079, "system__os_libS");
   u00080 : constant Version_32 := 16#cc47afb0#;
   pragma Export (C, u00080, "system__stringsB");
   u00081 : constant Version_32 := 16#781851aa#;
   pragma Export (C, u00081, "system__stringsS");
   u00082 : constant Version_32 := 16#b80dff09#;
   pragma Export (C, u00082, "system__file_control_blockS");
   u00083 : constant Version_32 := 16#4be846ff#;
   pragma Export (C, u00083, "ada__finalization__list_controllerB");
   u00084 : constant Version_32 := 16#e42a19e8#;
   pragma Export (C, u00084, "ada__finalization__list_controllerS");
   u00085 : constant Version_32 := 16#6ffd7991#;
   pragma Export (C, u00085, "ada__text_io__integer_auxB");
   u00086 : constant Version_32 := 16#56404473#;
   pragma Export (C, u00086, "ada__text_io__integer_auxS");
   u00087 : constant Version_32 := 16#f346ff5c#;
   pragma Export (C, u00087, "ada__text_io__generic_auxB");
   u00088 : constant Version_32 := 16#a1d04422#;
   pragma Export (C, u00088, "ada__text_io__generic_auxS");
   u00089 : constant Version_32 := 16#d9f6bc78#;
   pragma Export (C, u00089, "system__img_biuB");
   u00090 : constant Version_32 := 16#a4026f20#;
   pragma Export (C, u00090, "system__img_biuS");
   u00091 : constant Version_32 := 16#8ab10de5#;
   pragma Export (C, u00091, "system__img_llbB");
   u00092 : constant Version_32 := 16#421f43ab#;
   pragma Export (C, u00092, "system__img_llbS");
   u00093 : constant Version_32 := 16#17c88cd6#;
   pragma Export (C, u00093, "system__img_lliB");
   u00094 : constant Version_32 := 16#50fffdd3#;
   pragma Export (C, u00094, "system__img_lliS");
   u00095 : constant Version_32 := 16#76b10c12#;
   pragma Export (C, u00095, "system__img_llwB");
   u00096 : constant Version_32 := 16#b82f18de#;
   pragma Export (C, u00096, "system__img_llwS");
   u00097 : constant Version_32 := 16#91b7530a#;
   pragma Export (C, u00097, "system__img_wiuB");
   u00098 : constant Version_32 := 16#f2d3989b#;
   pragma Export (C, u00098, "system__img_wiuS");
   u00099 : constant Version_32 := 16#294c3b74#;
   pragma Export (C, u00099, "system__val_intB");
   u00100 : constant Version_32 := 16#62955899#;
   pragma Export (C, u00100, "system__val_intS");
   u00101 : constant Version_32 := 16#647de85b#;
   pragma Export (C, u00101, "system__val_unsB");
   u00102 : constant Version_32 := 16#9161e690#;
   pragma Export (C, u00102, "system__val_unsS");
   u00103 : constant Version_32 := 16#3131a464#;
   pragma Export (C, u00103, "system__val_lliB");
   u00104 : constant Version_32 := 16#fb6c9388#;
   pragma Export (C, u00104, "system__val_lliS");
   u00105 : constant Version_32 := 16#f4435486#;
   pragma Export (C, u00105, "system__memoryB");
   u00106 : constant Version_32 := 16#762457f8#;
   pragma Export (C, u00106, "system__memoryS");

   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  interfaces%s
   --  system%s
   --  system.case_util%s
   --  system.case_util%b
   --  system.htable%s
   --  system.img_int%s
   --  system.img_int%b
   --  system.img_lli%s
   --  system.img_lli%b
   --  system.parameters%s
   --  system.parameters%b
   --  system.crtl%s
   --  interfaces.c_streams%s
   --  interfaces.c_streams%b
   --  system.restrictions%s
   --  system.restrictions%b
   --  system.standard_library%s
   --  system.exceptions%s
   --  system.exceptions%b
   --  system.storage_elements%s
   --  system.storage_elements%b
   --  system.stack_checking%s
   --  system.stack_checking%b
   --  system.string_hash%s
   --  system.string_hash%b
   --  system.htable%b
   --  system.strings%s
   --  system.strings%b
   --  system.traceback_entries%s
   --  system.traceback_entries%b
   --  ada.exceptions%s
   --  system.soft_links%s
   --  system.unsigned_types%s
   --  system.img_biu%s
   --  system.img_biu%b
   --  system.img_llb%s
   --  system.img_llb%b
   --  system.img_llw%s
   --  system.img_llw%b
   --  system.img_wiu%s
   --  system.img_wiu%b
   --  system.val_int%s
   --  system.val_lli%s
   --  system.val_llu%s
   --  system.val_uns%s
   --  system.val_util%s
   --  system.val_util%b
   --  system.val_uns%b
   --  system.val_llu%b
   --  system.val_lli%b
   --  system.val_int%b
   --  system.wch_con%s
   --  system.wch_con%b
   --  system.wch_cnv%s
   --  system.wch_jis%s
   --  system.wch_jis%b
   --  system.wch_cnv%b
   --  system.wch_stw%s
   --  system.wch_stw%b
   --  ada.exceptions.last_chance_handler%s
   --  ada.exceptions.last_chance_handler%b
   --  system.exception_table%s
   --  system.exception_table%b
   --  ada.io_exceptions%s
   --  ada.tags%s
   --  ada.streams%s
   --  interfaces.c%s
   --  interfaces.c.strings%s
   --  system.crtl.runtime%s
   --  system.stream_attributes%s
   --  system.stream_attributes%b
   --  system.memory%s
   --  system.memory%b
   --  system.standard_library%b
   --  system.secondary_stack%s
   --  interfaces.c.strings%b
   --  interfaces.c%b
   --  ada.tags%b
   --  system.soft_links%b
   --  system.secondary_stack%b
   --  system.finalization_root%s
   --  system.finalization_root%b
   --  system.finalization_implementation%s
   --  system.finalization_implementation%b
   --  ada.finalization%s
   --  ada.finalization%b
   --  ada.finalization.list_controller%s
   --  ada.finalization.list_controller%b
   --  system.file_control_block%s
   --  system.file_io%s
   --  system.os_lib%s
   --  system.os_lib%b
   --  system.file_io%b
   --  system.traceback%s
   --  ada.exceptions%b
   --  system.traceback%b
   --  ada.text_io%s
   --  ada.text_io%b
   --  ada.text_io.generic_aux%s
   --  ada.text_io.generic_aux%b
   --  ada.text_io.integer_aux%s
   --  ada.text_io.integer_aux%b
   --  ada.integer_text_io%s
   --  ada.integer_text_io%b
   --  prog3%b
   --  END ELABORATION ORDER

end ada_main;
