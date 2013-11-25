#include <gracelib.h>
#include <stdlib.h>
#ifndef __CYGWIN__
#pragma weak main
#endif
static char compilerRevision[] = "91d01c0ec8028bc0c8f310808f1b94540456dfd0";
static Object undefined;
extern Object done;
extern Object _prelude;
extern Object String;
extern Object Number;
extern Object Boolean;
extern Object Dynamic;
extern Object List;
extern Object Block;
extern Object Done;
extern Object Type;
extern Object GraceDefaultObject;
extern Object sourceObject;
static Object type_String;
static Object type_Number;
static Object type_Boolean;
static Object type_Block;
static Object type_Done;
static Object argv;
static Object emptyclosure;
static Object prelude;
static int isTailObject = 0;
static Object inheritingObject = NULL;
static const char modulename[] = "test_Vector4";
Object module_StandardPrelude_init();
static char *originalSourceLines[] = {
  "import \"Vector2\" as vec2",
  "import \"Vector3\" as vec3",
  "import \"Vector4\" as vec4",
  "",
  "var v1 := vec4.setCoords(1, 2, 3, 4)",
  "var v2 := vec2.setCoords(1, 2)",
  "var v3 := vec4.setVector2(v2)",
  "var v4 := vec3.setCoords(1, 2, 3)",
  "var v5 := vec4.setVector3(v4)",
  "",
  "print(v1)",
  "print(v3)",
  "print(v5)",
  NULL
};
Object module_Vector2;
Object module_Vector2_init();
Object module_Vector3;
Object module_Vector3_init();
Object module_Vector4;
Object module_Vector4_init();
Object meth_test_Vector4_v16(Object self, int nparts, int *argcv, Object *args, int32_t flags) {
  struct UserObject *uo = (struct UserObject*)self;
  Object closure = getdatum((Object)uo, 1, (flags>>24)&0xff);
  struct StackFrameObject *stackframe = alloc_StackFrame(1, getclosureframe(closure));
  pushclosure(closure);
  pushstackframe(stackframe, "v1");
  int frame = gc_frame_new();
  gc_frame_newslot((Object)stackframe);
  Object methodInheritingObject = NULL;
  Object params[1];
  int partcv[1];
  Object *var_v1 = getfromclosure(closure, 0);
  int i;
  int curarg = 0;
  int pushcv[] = {1};
  if (nparts < 1 && args)
    gracedie("missing argument list for v1 (probably reflection error): got %i lists, expected 1.", nparts);
if (argcv && argcv[0] > 0)
  gracedie("too many arguments for identifierNode[0x0x27f08b8]");
  Object *selfslot = &(stackframe->slots[0]);
  *selfslot = self;
  setframeelementname(stackframe, 0, "self");
  if (methodInheritingObject) curarg++;
// Begin line 5
  setline(5);
  setmodule(modulename);
  setsource(originalSourceLines);
// compilenode returning *var_v1
  gc_frame_end(frame);
  return *var_v1;
}
Object meth_test_Vector4_v1_58__61_7(Object self, int nparts, int *argcv, Object *args, int32_t flags) {
  struct UserObject *uo = (struct UserObject*)self;
  Object closure = getdatum((Object)uo, 2, (flags>>24)&0xff);
  struct StackFrameObject *stackframe = alloc_StackFrame(2, getclosureframe(closure));
  pushclosure(closure);
  pushstackframe(stackframe, "v1:=");
  int frame = gc_frame_new();
  gc_frame_newslot((Object)stackframe);
  Object methodInheritingObject = NULL;
  if (nparts > 0 && argcv[0] < 1)
    gracedie("insufficient arguments to method");
  Object params[1];
  int partcv[1];
  Object *var_v1 = getfromclosure(closure, 0);
  int i;
  int curarg = 0;
  int pushcv[] = {1};
  if (nparts < 1 && args)
    gracedie("missing argument list for v1:= (probably reflection error): got %i lists, expected 1.", nparts);
  Object *var__var_assign_tmp = &(stackframe->slots[0]);
  *var__var_assign_tmp = args[curarg];
  curarg++;
if (argcv && argcv[0] > 1)
  gracedie("too many arguments for identifierNode[0x0x2897388]");
  Object *selfslot = &(stackframe->slots[1]);
  *selfslot = self;
  setframeelementname(stackframe, 0, "self");
  if (methodInheritingObject) curarg++;
// compilenode returning *var__var_assign_tmp
  *var_v1 = *var__var_assign_tmp;
  if (*var__var_assign_tmp == undefined)
    callmethod(done, "assignment", 0, NULL, NULL);
// compilenode returning done
  gc_frame_end(frame);
  return done;
}
Object meth_test_Vector4_v213(Object self, int nparts, int *argcv, Object *args, int32_t flags) {
  struct UserObject *uo = (struct UserObject*)self;
  Object closure = getdatum((Object)uo, 3, (flags>>24)&0xff);
  struct StackFrameObject *stackframe = alloc_StackFrame(1, getclosureframe(closure));
  pushclosure(closure);
  pushstackframe(stackframe, "v2");
  int frame = gc_frame_new();
  gc_frame_newslot((Object)stackframe);
  Object methodInheritingObject = NULL;
  Object params[1];
  int partcv[1];
  Object *var_v2 = getfromclosure(closure, 0);
  int i;
  int curarg = 0;
  int pushcv[] = {1};
  if (nparts < 1 && args)
    gracedie("missing argument list for v2 (probably reflection error): got %i lists, expected 1.", nparts);
if (argcv && argcv[0] > 0)
  gracedie("too many arguments for identifierNode[0x0x280fa68]");
  Object *selfslot = &(stackframe->slots[0]);
  *selfslot = self;
  setframeelementname(stackframe, 0, "self");
  if (methodInheritingObject) curarg++;
// Begin line 6
  setline(6);
  setmodule(modulename);
  setsource(originalSourceLines);
// compilenode returning *var_v2
  gc_frame_end(frame);
  return *var_v2;
}
Object meth_test_Vector4_v2_58__61_14(Object self, int nparts, int *argcv, Object *args, int32_t flags) {
  struct UserObject *uo = (struct UserObject*)self;
  Object closure = getdatum((Object)uo, 4, (flags>>24)&0xff);
  struct StackFrameObject *stackframe = alloc_StackFrame(2, getclosureframe(closure));
  pushclosure(closure);
  pushstackframe(stackframe, "v2:=");
  int frame = gc_frame_new();
  gc_frame_newslot((Object)stackframe);
  Object methodInheritingObject = NULL;
  if (nparts > 0 && argcv[0] < 1)
    gracedie("insufficient arguments to method");
  Object params[1];
  int partcv[1];
  Object *var_v2 = getfromclosure(closure, 0);
  int i;
  int curarg = 0;
  int pushcv[] = {1};
  if (nparts < 1 && args)
    gracedie("missing argument list for v2:= (probably reflection error): got %i lists, expected 1.", nparts);
  Object *var__var_assign_tmp = &(stackframe->slots[0]);
  *var__var_assign_tmp = args[curarg];
  curarg++;
if (argcv && argcv[0] > 1)
  gracedie("too many arguments for identifierNode[0x0x27905e8]");
  Object *selfslot = &(stackframe->slots[1]);
  *selfslot = self;
  setframeelementname(stackframe, 0, "self");
  if (methodInheritingObject) curarg++;
// compilenode returning *var__var_assign_tmp
  *var_v2 = *var__var_assign_tmp;
  if (*var__var_assign_tmp == undefined)
    callmethod(done, "assignment", 0, NULL, NULL);
// compilenode returning done
  gc_frame_end(frame);
  return done;
}
Object meth_test_Vector4_v318(Object self, int nparts, int *argcv, Object *args, int32_t flags) {
  struct UserObject *uo = (struct UserObject*)self;
  Object closure = getdatum((Object)uo, 5, (flags>>24)&0xff);
  struct StackFrameObject *stackframe = alloc_StackFrame(1, getclosureframe(closure));
  pushclosure(closure);
  pushstackframe(stackframe, "v3");
  int frame = gc_frame_new();
  gc_frame_newslot((Object)stackframe);
  Object methodInheritingObject = NULL;
  Object params[1];
  int partcv[1];
  Object *var_v3 = getfromclosure(closure, 0);
  int i;
  int curarg = 0;
  int pushcv[] = {1};
  if (nparts < 1 && args)
    gracedie("missing argument list for v3 (probably reflection error): got %i lists, expected 1.", nparts);
if (argcv && argcv[0] > 0)
  gracedie("too many arguments for identifierNode[0x0x27b9c38]");
  Object *selfslot = &(stackframe->slots[0]);
  *selfslot = self;
  setframeelementname(stackframe, 0, "self");
  if (methodInheritingObject) curarg++;
// Begin line 7
  setline(7);
  setmodule(modulename);
  setsource(originalSourceLines);
// compilenode returning *var_v3
  gc_frame_end(frame);
  return *var_v3;
}
Object meth_test_Vector4_v3_58__61_19(Object self, int nparts, int *argcv, Object *args, int32_t flags) {
  struct UserObject *uo = (struct UserObject*)self;
  Object closure = getdatum((Object)uo, 6, (flags>>24)&0xff);
  struct StackFrameObject *stackframe = alloc_StackFrame(2, getclosureframe(closure));
  pushclosure(closure);
  pushstackframe(stackframe, "v3:=");
  int frame = gc_frame_new();
  gc_frame_newslot((Object)stackframe);
  Object methodInheritingObject = NULL;
  if (nparts > 0 && argcv[0] < 1)
    gracedie("insufficient arguments to method");
  Object params[1];
  int partcv[1];
  Object *var_v3 = getfromclosure(closure, 0);
  int i;
  int curarg = 0;
  int pushcv[] = {1};
  if (nparts < 1 && args)
    gracedie("missing argument list for v3:= (probably reflection error): got %i lists, expected 1.", nparts);
  Object *var__var_assign_tmp = &(stackframe->slots[0]);
  *var__var_assign_tmp = args[curarg];
  curarg++;
if (argcv && argcv[0] > 1)
  gracedie("too many arguments for identifierNode[0x0x2910648]");
  Object *selfslot = &(stackframe->slots[1]);
  *selfslot = self;
  setframeelementname(stackframe, 0, "self");
  if (methodInheritingObject) curarg++;
// compilenode returning *var__var_assign_tmp
  *var_v3 = *var__var_assign_tmp;
  if (*var__var_assign_tmp == undefined)
    callmethod(done, "assignment", 0, NULL, NULL);
// compilenode returning done
  gc_frame_end(frame);
  return done;
}
Object meth_test_Vector4_v426(Object self, int nparts, int *argcv, Object *args, int32_t flags) {
  struct UserObject *uo = (struct UserObject*)self;
  Object closure = getdatum((Object)uo, 7, (flags>>24)&0xff);
  struct StackFrameObject *stackframe = alloc_StackFrame(1, getclosureframe(closure));
  pushclosure(closure);
  pushstackframe(stackframe, "v4");
  int frame = gc_frame_new();
  gc_frame_newslot((Object)stackframe);
  Object methodInheritingObject = NULL;
  Object params[1];
  int partcv[1];
  Object *var_v4 = getfromclosure(closure, 0);
  int i;
  int curarg = 0;
  int pushcv[] = {1};
  if (nparts < 1 && args)
    gracedie("missing argument list for v4 (probably reflection error): got %i lists, expected 1.", nparts);
if (argcv && argcv[0] > 0)
  gracedie("too many arguments for identifierNode[0x0x278b848]");
  Object *selfslot = &(stackframe->slots[0]);
  *selfslot = self;
  setframeelementname(stackframe, 0, "self");
  if (methodInheritingObject) curarg++;
// Begin line 8
  setline(8);
  setmodule(modulename);
  setsource(originalSourceLines);
// compilenode returning *var_v4
  gc_frame_end(frame);
  return *var_v4;
}
Object meth_test_Vector4_v4_58__61_27(Object self, int nparts, int *argcv, Object *args, int32_t flags) {
  struct UserObject *uo = (struct UserObject*)self;
  Object closure = getdatum((Object)uo, 8, (flags>>24)&0xff);
  struct StackFrameObject *stackframe = alloc_StackFrame(2, getclosureframe(closure));
  pushclosure(closure);
  pushstackframe(stackframe, "v4:=");
  int frame = gc_frame_new();
  gc_frame_newslot((Object)stackframe);
  Object methodInheritingObject = NULL;
  if (nparts > 0 && argcv[0] < 1)
    gracedie("insufficient arguments to method");
  Object params[1];
  int partcv[1];
  Object *var_v4 = getfromclosure(closure, 0);
  int i;
  int curarg = 0;
  int pushcv[] = {1};
  if (nparts < 1 && args)
    gracedie("missing argument list for v4:= (probably reflection error): got %i lists, expected 1.", nparts);
  Object *var__var_assign_tmp = &(stackframe->slots[0]);
  *var__var_assign_tmp = args[curarg];
  curarg++;
if (argcv && argcv[0] > 1)
  gracedie("too many arguments for identifierNode[0x0x28fa628]");
  Object *selfslot = &(stackframe->slots[1]);
  *selfslot = self;
  setframeelementname(stackframe, 0, "self");
  if (methodInheritingObject) curarg++;
// compilenode returning *var__var_assign_tmp
  *var_v4 = *var__var_assign_tmp;
  if (*var__var_assign_tmp == undefined)
    callmethod(done, "assignment", 0, NULL, NULL);
// compilenode returning done
  gc_frame_end(frame);
  return done;
}
Object meth_test_Vector4_v531(Object self, int nparts, int *argcv, Object *args, int32_t flags) {
  struct UserObject *uo = (struct UserObject*)self;
  Object closure = getdatum((Object)uo, 9, (flags>>24)&0xff);
  struct StackFrameObject *stackframe = alloc_StackFrame(1, getclosureframe(closure));
  pushclosure(closure);
  pushstackframe(stackframe, "v5");
  int frame = gc_frame_new();
  gc_frame_newslot((Object)stackframe);
  Object methodInheritingObject = NULL;
  Object params[1];
  int partcv[1];
  Object *var_v5 = getfromclosure(closure, 0);
  int i;
  int curarg = 0;
  int pushcv[] = {1};
  if (nparts < 1 && args)
    gracedie("missing argument list for v5 (probably reflection error): got %i lists, expected 1.", nparts);
if (argcv && argcv[0] > 0)
  gracedie("too many arguments for identifierNode[0x0x273a4a8]");
  Object *selfslot = &(stackframe->slots[0]);
  *selfslot = self;
  setframeelementname(stackframe, 0, "self");
  if (methodInheritingObject) curarg++;
// Begin line 9
  setline(9);
  setmodule(modulename);
  setsource(originalSourceLines);
// compilenode returning *var_v5
  gc_frame_end(frame);
  return *var_v5;
}
Object meth_test_Vector4_v5_58__61_32(Object self, int nparts, int *argcv, Object *args, int32_t flags) {
  struct UserObject *uo = (struct UserObject*)self;
  Object closure = getdatum((Object)uo, 10, (flags>>24)&0xff);
  struct StackFrameObject *stackframe = alloc_StackFrame(2, getclosureframe(closure));
  pushclosure(closure);
  pushstackframe(stackframe, "v5:=");
  int frame = gc_frame_new();
  gc_frame_newslot((Object)stackframe);
  Object methodInheritingObject = NULL;
  if (nparts > 0 && argcv[0] < 1)
    gracedie("insufficient arguments to method");
  Object params[1];
  int partcv[1];
  Object *var_v5 = getfromclosure(closure, 0);
  int i;
  int curarg = 0;
  int pushcv[] = {1};
  if (nparts < 1 && args)
    gracedie("missing argument list for v5:= (probably reflection error): got %i lists, expected 1.", nparts);
  Object *var__var_assign_tmp = &(stackframe->slots[0]);
  *var__var_assign_tmp = args[curarg];
  curarg++;
if (argcv && argcv[0] > 1)
  gracedie("too many arguments for identifierNode[0x0x28d0d48]");
  Object *selfslot = &(stackframe->slots[1]);
  *selfslot = self;
  setframeelementname(stackframe, 0, "self");
  if (methodInheritingObject) curarg++;
// compilenode returning *var__var_assign_tmp
  *var_v5 = *var__var_assign_tmp;
  if (*var__var_assign_tmp == undefined)
    callmethod(done, "assignment", 0, NULL, NULL);
// compilenode returning done
  gc_frame_end(frame);
  return done;
}
Object module_test_Vector4_init() {
  int flags = 0;
  int frame = gc_frame_new();
  Object self = alloc_obj2(12, 12);
  gc_root(self);
  prelude = module_StandardPrelude_init();
  adddatum2(self, prelude, 0);
  addmethod2(self, "outer", &grace_userobj_outer);
  setline(1);
  setmodule(modulename);
  setsource(originalSourceLines);
  setclassname(self, "Module<test_Vector4>");
  Object *var_MatchFailed = alloc_var();
  *var_MatchFailed = alloc_MatchFailed();
  Object *var_noSuchValue = alloc_var();
  *var_noSuchValue = done;
  Object *var_done = alloc_var();
  *var_done = done;
  Object *var_String = alloc_var();
  *var_String = String;
  type_String = String;
  Object *var_Block = alloc_var();
  *var_Block = Block;
  type_Block = Block;
  Object *var_Done = alloc_var();
  *var_Done = Done;
  type_Done = Done;
  Object *var_Number = alloc_var();
  *var_Number = Number;
  type_Number = Number;
  Object *var_Boolean = alloc_var();
  *var_Boolean = Boolean;
  type_Boolean = Boolean;
  Object *var_Dynamic = alloc_var();
  *var_Dynamic = Dynamic;
  Object *var_List = alloc_var();
  *var_List = List;
  Object *var_Type = alloc_var();
  *var_Type = Type;
  Object *var__prelude = alloc_var();
  *var__prelude = grace_prelude();
  gc_root(*var_MatchFailed);
  emptyclosure = createclosure(0, "empty");
  gc_root(emptyclosure);
  struct StackFrameObject *stackframe = alloc_StackFrame(12, NULL);
  gc_root((Object)stackframe);
  pushstackframe(stackframe, "module scope");
  Object *selfslot = &(stackframe->slots[0]);
  *selfslot = self;
  setframeelementname(stackframe, 0, "self");
  Object params[4];
  int partcv[1];
Object *var_vec2 = alloc_var();
Object *var_vec3 = alloc_var();
Object *var_vec4 = alloc_var();
  Object *var_v1 = &(stackframe->slots[1]);
  setframeelementname(stackframe, 1, "v1");
  Object *var_v2 = &(stackframe->slots[2]);
  setframeelementname(stackframe, 2, "v2");
  Object *var_v3 = &(stackframe->slots[3]);
  setframeelementname(stackframe, 3, "v3");
  Object *var_v4 = &(stackframe->slots[4]);
  setframeelementname(stackframe, 4, "v4");
  Object *var_v5 = &(stackframe->slots[5]);
  setframeelementname(stackframe, 5, "v5");
// Begin line 2
  setline(2);
  setmodule(modulename);
  setsource(originalSourceLines);
// Import of Vector2 as vec2
  if (module_Vector2 == NULL)
    module_Vector2 = module_Vector2_init();
  *var_vec2 = module_Vector2;
// compilenode returning done
// Begin line 3
  setline(3);
  setmodule(modulename);
  setsource(originalSourceLines);
// Import of Vector3 as vec3
  if (module_Vector3 == NULL)
    module_Vector3 = module_Vector3_init();
  *var_vec3 = module_Vector3;
// compilenode returning done
// Begin line 5
  setline(5);
  setmodule(modulename);
  setsource(originalSourceLines);
// Import of Vector4 as vec4
  if (module_Vector4 == NULL)
    module_Vector4 = module_Vector4_init();
  *var_vec4 = module_Vector4;
// compilenode returning done
// compilenode returning 
// Begin line 6
  setline(6);
  setmodule(modulename);
  setsource(originalSourceLines);
  int callframe0 = gc_frame_new();
// Begin line 5
  setline(5);
  setmodule(modulename);
  setsource(originalSourceLines);
  Object num1 = alloc_Float64(1);
// compilenode returning num1
  gc_frame_newslot(num1);
  Object num2 = alloc_Float64(2);
// compilenode returning num2
  gc_frame_newslot(num2);
  Object num3 = alloc_Float64(3);
// compilenode returning num3
  gc_frame_newslot(num3);
  Object num4 = alloc_Float64(4);
// compilenode returning num4
  gc_frame_newslot(num4);
// compilenode returning *var_vec4
  params[0] = num1;
  params[1] = num2;
  params[2] = num3;
  params[3] = num4;
  partcv[0] = 4;
  Object call5 = callmethod(*var_vec4, "setCoords",
    1, partcv, params);
  gc_frame_end(callframe0);
// compilenode returning call5
  *var_v1 = call5;
  if (call5 == undefined)
    callmethod(done, "assignment", 0, NULL, NULL);
// Begin line 13
  setline(13);
  setmodule(modulename);
  setsource(originalSourceLines);
  block_savedest(self);
  Object closure6 = createclosure(1, "v1");
setclosureframe(closure6, stackframe);
  addtoclosure(closure6, var_v1);
  struct UserObject *uo6 = (struct UserObject*)self;
  uo6->data[1] = (Object)closure6;
  Method *meth_meth_test_Vector4_v16 = addmethod2pos(self, "v1", &meth_test_Vector4_v16, 1);
int argcv_meth_test_Vector4_v16[] = {0};
meth_meth_test_Vector4_v16->type = alloc_MethodType(1, argcv_meth_test_Vector4_v16);
  meth_meth_test_Vector4_v16->definitionModule = modulename;
  meth_meth_test_Vector4_v16->definitionLine = 13;
// compilenode returning 
// Begin line 13
  setline(13);
  setmodule(modulename);
  setsource(originalSourceLines);
  block_savedest(self);
  Object closure7 = createclosure(1, "v1:=");
setclosureframe(closure7, stackframe);
  addtoclosure(closure7, var_v1);
  struct UserObject *uo7 = (struct UserObject*)self;
  uo7->data[2] = (Object)closure7;
  Method *meth_meth_test_Vector4_v1_58__61_7 = addmethod2pos(self, "v1:=", &meth_test_Vector4_v1_58__61_7, 2);
int argcv_meth_test_Vector4_v1_58__61_7[] = {1};
meth_meth_test_Vector4_v1_58__61_7->type = alloc_MethodType(1, argcv_meth_test_Vector4_v1_58__61_7);
  meth_meth_test_Vector4_v1_58__61_7->definitionModule = modulename;
  meth_meth_test_Vector4_v1_58__61_7->definitionLine = 13;
// compilenode returning 
// compilenode returning done
// Begin line 7
  setline(7);
  setmodule(modulename);
  setsource(originalSourceLines);
  int callframe9 = gc_frame_new();
// Begin line 6
  setline(6);
  setmodule(modulename);
  setsource(originalSourceLines);
  Object num10 = alloc_Float64(1);
// compilenode returning num10
  gc_frame_newslot(num10);
  Object num11 = alloc_Float64(2);
// compilenode returning num11
  gc_frame_newslot(num11);
// compilenode returning *var_vec2
  params[0] = num10;
  params[1] = num11;
  partcv[0] = 2;
  Object call12 = callmethod(*var_vec2, "setCoords",
    1, partcv, params);
  gc_frame_end(callframe9);
// compilenode returning call12
  *var_v2 = call12;
  if (call12 == undefined)
    callmethod(done, "assignment", 0, NULL, NULL);
// Begin line 13
  setline(13);
  setmodule(modulename);
  setsource(originalSourceLines);
  block_savedest(self);
  Object closure13 = createclosure(1, "v2");
setclosureframe(closure13, stackframe);
  addtoclosure(closure13, var_v2);
  struct UserObject *uo13 = (struct UserObject*)self;
  uo13->data[3] = (Object)closure13;
  Method *meth_meth_test_Vector4_v213 = addmethod2pos(self, "v2", &meth_test_Vector4_v213, 3);
int argcv_meth_test_Vector4_v213[] = {0};
meth_meth_test_Vector4_v213->type = alloc_MethodType(1, argcv_meth_test_Vector4_v213);
  meth_meth_test_Vector4_v213->definitionModule = modulename;
  meth_meth_test_Vector4_v213->definitionLine = 13;
// compilenode returning 
// Begin line 13
  setline(13);
  setmodule(modulename);
  setsource(originalSourceLines);
  block_savedest(self);
  Object closure14 = createclosure(1, "v2:=");
setclosureframe(closure14, stackframe);
  addtoclosure(closure14, var_v2);
  struct UserObject *uo14 = (struct UserObject*)self;
  uo14->data[4] = (Object)closure14;
  Method *meth_meth_test_Vector4_v2_58__61_14 = addmethod2pos(self, "v2:=", &meth_test_Vector4_v2_58__61_14, 4);
int argcv_meth_test_Vector4_v2_58__61_14[] = {1};
meth_meth_test_Vector4_v2_58__61_14->type = alloc_MethodType(1, argcv_meth_test_Vector4_v2_58__61_14);
  meth_meth_test_Vector4_v2_58__61_14->definitionModule = modulename;
  meth_meth_test_Vector4_v2_58__61_14->definitionLine = 13;
// compilenode returning 
// compilenode returning done
// Begin line 8
  setline(8);
  setmodule(modulename);
  setsource(originalSourceLines);
  int callframe16 = gc_frame_new();
// Begin line 7
  setline(7);
  setmodule(modulename);
  setsource(originalSourceLines);
// compilenode returning *var_v2
  gc_frame_newslot(*var_v2);
// compilenode returning *var_vec4
  params[0] = *var_v2;
  partcv[0] = 1;
  Object call17 = callmethod(*var_vec4, "setVector2",
    1, partcv, params);
  gc_frame_end(callframe16);
// compilenode returning call17
  *var_v3 = call17;
  if (call17 == undefined)
    callmethod(done, "assignment", 0, NULL, NULL);
// Begin line 13
  setline(13);
  setmodule(modulename);
  setsource(originalSourceLines);
  block_savedest(self);
  Object closure18 = createclosure(1, "v3");
setclosureframe(closure18, stackframe);
  addtoclosure(closure18, var_v3);
  struct UserObject *uo18 = (struct UserObject*)self;
  uo18->data[5] = (Object)closure18;
  Method *meth_meth_test_Vector4_v318 = addmethod2pos(self, "v3", &meth_test_Vector4_v318, 5);
int argcv_meth_test_Vector4_v318[] = {0};
meth_meth_test_Vector4_v318->type = alloc_MethodType(1, argcv_meth_test_Vector4_v318);
  meth_meth_test_Vector4_v318->definitionModule = modulename;
  meth_meth_test_Vector4_v318->definitionLine = 13;
// compilenode returning 
// Begin line 13
  setline(13);
  setmodule(modulename);
  setsource(originalSourceLines);
  block_savedest(self);
  Object closure19 = createclosure(1, "v3:=");
setclosureframe(closure19, stackframe);
  addtoclosure(closure19, var_v3);
  struct UserObject *uo19 = (struct UserObject*)self;
  uo19->data[6] = (Object)closure19;
  Method *meth_meth_test_Vector4_v3_58__61_19 = addmethod2pos(self, "v3:=", &meth_test_Vector4_v3_58__61_19, 6);
int argcv_meth_test_Vector4_v3_58__61_19[] = {1};
meth_meth_test_Vector4_v3_58__61_19->type = alloc_MethodType(1, argcv_meth_test_Vector4_v3_58__61_19);
  meth_meth_test_Vector4_v3_58__61_19->definitionModule = modulename;
  meth_meth_test_Vector4_v3_58__61_19->definitionLine = 13;
// compilenode returning 
// compilenode returning done
// Begin line 9
  setline(9);
  setmodule(modulename);
  setsource(originalSourceLines);
  int callframe21 = gc_frame_new();
// Begin line 8
  setline(8);
  setmodule(modulename);
  setsource(originalSourceLines);
  Object num22 = alloc_Float64(1);
// compilenode returning num22
  gc_frame_newslot(num22);
  Object num23 = alloc_Float64(2);
// compilenode returning num23
  gc_frame_newslot(num23);
  Object num24 = alloc_Float64(3);
// compilenode returning num24
  gc_frame_newslot(num24);
// compilenode returning *var_vec3
  params[0] = num22;
  params[1] = num23;
  params[2] = num24;
  partcv[0] = 3;
  Object call25 = callmethod(*var_vec3, "setCoords",
    1, partcv, params);
  gc_frame_end(callframe21);
// compilenode returning call25
  *var_v4 = call25;
  if (call25 == undefined)
    callmethod(done, "assignment", 0, NULL, NULL);
// Begin line 13
  setline(13);
  setmodule(modulename);
  setsource(originalSourceLines);
  block_savedest(self);
  Object closure26 = createclosure(1, "v4");
setclosureframe(closure26, stackframe);
  addtoclosure(closure26, var_v4);
  struct UserObject *uo26 = (struct UserObject*)self;
  uo26->data[7] = (Object)closure26;
  Method *meth_meth_test_Vector4_v426 = addmethod2pos(self, "v4", &meth_test_Vector4_v426, 7);
int argcv_meth_test_Vector4_v426[] = {0};
meth_meth_test_Vector4_v426->type = alloc_MethodType(1, argcv_meth_test_Vector4_v426);
  meth_meth_test_Vector4_v426->definitionModule = modulename;
  meth_meth_test_Vector4_v426->definitionLine = 13;
// compilenode returning 
// Begin line 13
  setline(13);
  setmodule(modulename);
  setsource(originalSourceLines);
  block_savedest(self);
  Object closure27 = createclosure(1, "v4:=");
setclosureframe(closure27, stackframe);
  addtoclosure(closure27, var_v4);
  struct UserObject *uo27 = (struct UserObject*)self;
  uo27->data[8] = (Object)closure27;
  Method *meth_meth_test_Vector4_v4_58__61_27 = addmethod2pos(self, "v4:=", &meth_test_Vector4_v4_58__61_27, 8);
int argcv_meth_test_Vector4_v4_58__61_27[] = {1};
meth_meth_test_Vector4_v4_58__61_27->type = alloc_MethodType(1, argcv_meth_test_Vector4_v4_58__61_27);
  meth_meth_test_Vector4_v4_58__61_27->definitionModule = modulename;
  meth_meth_test_Vector4_v4_58__61_27->definitionLine = 13;
// compilenode returning 
// compilenode returning done
// Begin line 11
  setline(11);
  setmodule(modulename);
  setsource(originalSourceLines);
  int callframe29 = gc_frame_new();
// Begin line 9
  setline(9);
  setmodule(modulename);
  setsource(originalSourceLines);
// compilenode returning *var_v4
  gc_frame_newslot(*var_v4);
// compilenode returning *var_vec4
  params[0] = *var_v4;
  partcv[0] = 1;
  Object call30 = callmethod(*var_vec4, "setVector3",
    1, partcv, params);
  gc_frame_end(callframe29);
// compilenode returning call30
  *var_v5 = call30;
  if (call30 == undefined)
    callmethod(done, "assignment", 0, NULL, NULL);
// Begin line 13
  setline(13);
  setmodule(modulename);
  setsource(originalSourceLines);
  block_savedest(self);
  Object closure31 = createclosure(1, "v5");
setclosureframe(closure31, stackframe);
  addtoclosure(closure31, var_v5);
  struct UserObject *uo31 = (struct UserObject*)self;
  uo31->data[9] = (Object)closure31;
  Method *meth_meth_test_Vector4_v531 = addmethod2pos(self, "v5", &meth_test_Vector4_v531, 9);
int argcv_meth_test_Vector4_v531[] = {0};
meth_meth_test_Vector4_v531->type = alloc_MethodType(1, argcv_meth_test_Vector4_v531);
  meth_meth_test_Vector4_v531->definitionModule = modulename;
  meth_meth_test_Vector4_v531->definitionLine = 13;
// compilenode returning 
// Begin line 13
  setline(13);
  setmodule(modulename);
  setsource(originalSourceLines);
  block_savedest(self);
  Object closure32 = createclosure(1, "v5:=");
setclosureframe(closure32, stackframe);
  addtoclosure(closure32, var_v5);
  struct UserObject *uo32 = (struct UserObject*)self;
  uo32->data[10] = (Object)closure32;
  Method *meth_meth_test_Vector4_v5_58__61_32 = addmethod2pos(self, "v5:=", &meth_test_Vector4_v5_58__61_32, 10);
int argcv_meth_test_Vector4_v5_58__61_32[] = {1};
meth_meth_test_Vector4_v5_58__61_32->type = alloc_MethodType(1, argcv_meth_test_Vector4_v5_58__61_32);
  meth_meth_test_Vector4_v5_58__61_32->definitionModule = modulename;
  meth_meth_test_Vector4_v5_58__61_32->definitionLine = 13;
// compilenode returning 
// compilenode returning done
// Begin line 11
  setline(11);
  setmodule(modulename);
  setsource(originalSourceLines);
// compilenode returning 
// Begin line 12
  setline(12);
  setmodule(modulename);
  setsource(originalSourceLines);
// Begin line 11
  setline(11);
  setmodule(modulename);
  setsource(originalSourceLines);
// compilenode returning *var_v1
  params[0] = *var_v1;
  Object call34 = gracelib_print(NULL, 1,  params);
// compilenode returning call34
// Begin line 13
  setline(13);
  setmodule(modulename);
  setsource(originalSourceLines);
// Begin line 12
  setline(12);
  setmodule(modulename);
  setsource(originalSourceLines);
// compilenode returning *var_v3
  params[0] = *var_v3;
  Object call35 = gracelib_print(NULL, 1,  params);
// compilenode returning call35
// Begin line 13
  setline(13);
  setmodule(modulename);
  setsource(originalSourceLines);
// compilenode returning *var_v5
  params[0] = *var_v5;
  Object call36 = gracelib_print(NULL, 1,  params);
// compilenode returning call36
  gc_frame_end(frame);
  return self;
}
int main(int argc, char **argv) {
  initprofiling();
  setCompilerModulePath("/home/david/Dropbox/Programming/Grace/minigrace");
  gracelib_argv(argv);
  Object params[1];
  undefined = alloc_Undefined();
  done = alloc_done();
  Object tmp_argv = alloc_BuiltinList();
  gc_root(tmp_argv);
  int partcv_push[] = {1};
  int i; for (i=0; i<argc; i++) {
    params[0] = alloc_String(argv[i]);
    callmethod(tmp_argv, "push", 1, partcv_push, params);
  }
  module_sys_init_argv(tmp_argv);
  module_test_Vector4_init();
  gracelib_stats();
  return 0;
}
