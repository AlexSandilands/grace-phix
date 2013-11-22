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
static const char modulename[] = "test_Vector2";
Object module_StandardPrelude_init();
static char *originalSourceLines[] = {
  "import \"Vector2\" as vec2",
  "",
  "var v1 := vec2.setCoords(1.0, 2.0)",
  "var v2 := vec2.setVector(v1)",
  "",
  "print(v1)",
  "print(v2)",
  NULL
};
Object module_Vector2;
Object module_Vector2_init();
Object meth_test_Vector2_v14(Object self, int nparts, int *argcv, Object *args, int32_t flags) {
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
  gracedie("too many arguments for identifierNode[0x0x1f6fda8]");
  Object *selfslot = &(stackframe->slots[0]);
  *selfslot = self;
  setframeelementname(stackframe, 0, "self");
  if (methodInheritingObject) curarg++;
// Begin line 3
  setline(3);
  setmodule(modulename);
  setsource(originalSourceLines);
// compilenode returning *var_v1
  gc_frame_end(frame);
  return *var_v1;
}
Object meth_test_Vector2_v1_58__61_5(Object self, int nparts, int *argcv, Object *args, int32_t flags) {
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
  gracedie("too many arguments for identifierNode[0x0x2070168]");
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
Object meth_test_Vector2_v29(Object self, int nparts, int *argcv, Object *args, int32_t flags) {
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
  gracedie("too many arguments for identifierNode[0x0x1f80288]");
  Object *selfslot = &(stackframe->slots[0]);
  *selfslot = self;
  setframeelementname(stackframe, 0, "self");
  if (methodInheritingObject) curarg++;
// Begin line 4
  setline(4);
  setmodule(modulename);
  setsource(originalSourceLines);
// compilenode returning *var_v2
  gc_frame_end(frame);
  return *var_v2;
}
Object meth_test_Vector2_v2_58__61_10(Object self, int nparts, int *argcv, Object *args, int32_t flags) {
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
  gracedie("too many arguments for identifierNode[0x0x1f3aec8]");
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
Object module_test_Vector2_init() {
  int flags = 0;
  int frame = gc_frame_new();
  Object self = alloc_obj2(6, 6);
  gc_root(self);
  prelude = module_StandardPrelude_init();
  adddatum2(self, prelude, 0);
  addmethod2(self, "outer", &grace_userobj_outer);
  setline(1);
  setmodule(modulename);
  setsource(originalSourceLines);
  setclassname(self, "Module<test_Vector2>");
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
  struct StackFrameObject *stackframe = alloc_StackFrame(6, NULL);
  gc_root((Object)stackframe);
  pushstackframe(stackframe, "module scope");
  Object *selfslot = &(stackframe->slots[0]);
  *selfslot = self;
  setframeelementname(stackframe, 0, "self");
  Object params[2];
  int partcv[1];
Object *var_vec2 = alloc_var();
  Object *var_v1 = &(stackframe->slots[1]);
  setframeelementname(stackframe, 1, "v1");
  Object *var_v2 = &(stackframe->slots[2]);
  setframeelementname(stackframe, 2, "v2");
// Begin line 3
  setline(3);
  setmodule(modulename);
  setsource(originalSourceLines);
// Import of Vector2 as vec2
  if (module_Vector2 == NULL)
    module_Vector2 = module_Vector2_init();
  *var_vec2 = module_Vector2;
// compilenode returning done
// compilenode returning 
// Begin line 4
  setline(4);
  setmodule(modulename);
  setsource(originalSourceLines);
  int callframe0 = gc_frame_new();
// Begin line 3
  setline(3);
  setmodule(modulename);
  setsource(originalSourceLines);
  Object num1 = alloc_Float64(1.0);
// compilenode returning num1
  gc_frame_newslot(num1);
  Object num2 = alloc_Float64(2.0);
// compilenode returning num2
  gc_frame_newslot(num2);
// compilenode returning *var_vec2
  params[0] = num1;
  params[1] = num2;
  partcv[0] = 2;
  Object call3 = callmethod(*var_vec2, "setCoords",
    1, partcv, params);
  gc_frame_end(callframe0);
// compilenode returning call3
  *var_v1 = call3;
  if (call3 == undefined)
    callmethod(done, "assignment", 0, NULL, NULL);
// Begin line 7
  setline(7);
  setmodule(modulename);
  setsource(originalSourceLines);
  block_savedest(self);
  Object closure4 = createclosure(1, "v1");
setclosureframe(closure4, stackframe);
  addtoclosure(closure4, var_v1);
  struct UserObject *uo4 = (struct UserObject*)self;
  uo4->data[1] = (Object)closure4;
  Method *meth_meth_test_Vector2_v14 = addmethod2pos(self, "v1", &meth_test_Vector2_v14, 1);
int argcv_meth_test_Vector2_v14[] = {0};
meth_meth_test_Vector2_v14->type = alloc_MethodType(1, argcv_meth_test_Vector2_v14);
  meth_meth_test_Vector2_v14->definitionModule = modulename;
  meth_meth_test_Vector2_v14->definitionLine = 7;
// compilenode returning 
// Begin line 7
  setline(7);
  setmodule(modulename);
  setsource(originalSourceLines);
  block_savedest(self);
  Object closure5 = createclosure(1, "v1:=");
setclosureframe(closure5, stackframe);
  addtoclosure(closure5, var_v1);
  struct UserObject *uo5 = (struct UserObject*)self;
  uo5->data[2] = (Object)closure5;
  Method *meth_meth_test_Vector2_v1_58__61_5 = addmethod2pos(self, "v1:=", &meth_test_Vector2_v1_58__61_5, 2);
int argcv_meth_test_Vector2_v1_58__61_5[] = {1};
meth_meth_test_Vector2_v1_58__61_5->type = alloc_MethodType(1, argcv_meth_test_Vector2_v1_58__61_5);
  meth_meth_test_Vector2_v1_58__61_5->definitionModule = modulename;
  meth_meth_test_Vector2_v1_58__61_5->definitionLine = 7;
// compilenode returning 
// compilenode returning done
// Begin line 6
  setline(6);
  setmodule(modulename);
  setsource(originalSourceLines);
  int callframe7 = gc_frame_new();
// Begin line 4
  setline(4);
  setmodule(modulename);
  setsource(originalSourceLines);
// compilenode returning *var_v1
  gc_frame_newslot(*var_v1);
// compilenode returning *var_vec2
  params[0] = *var_v1;
  partcv[0] = 1;
  Object call8 = callmethod(*var_vec2, "setVector",
    1, partcv, params);
  gc_frame_end(callframe7);
// compilenode returning call8
  *var_v2 = call8;
  if (call8 == undefined)
    callmethod(done, "assignment", 0, NULL, NULL);
// Begin line 7
  setline(7);
  setmodule(modulename);
  setsource(originalSourceLines);
  block_savedest(self);
  Object closure9 = createclosure(1, "v2");
setclosureframe(closure9, stackframe);
  addtoclosure(closure9, var_v2);
  struct UserObject *uo9 = (struct UserObject*)self;
  uo9->data[3] = (Object)closure9;
  Method *meth_meth_test_Vector2_v29 = addmethod2pos(self, "v2", &meth_test_Vector2_v29, 3);
int argcv_meth_test_Vector2_v29[] = {0};
meth_meth_test_Vector2_v29->type = alloc_MethodType(1, argcv_meth_test_Vector2_v29);
  meth_meth_test_Vector2_v29->definitionModule = modulename;
  meth_meth_test_Vector2_v29->definitionLine = 7;
// compilenode returning 
// Begin line 7
  setline(7);
  setmodule(modulename);
  setsource(originalSourceLines);
  block_savedest(self);
  Object closure10 = createclosure(1, "v2:=");
setclosureframe(closure10, stackframe);
  addtoclosure(closure10, var_v2);
  struct UserObject *uo10 = (struct UserObject*)self;
  uo10->data[4] = (Object)closure10;
  Method *meth_meth_test_Vector2_v2_58__61_10 = addmethod2pos(self, "v2:=", &meth_test_Vector2_v2_58__61_10, 4);
int argcv_meth_test_Vector2_v2_58__61_10[] = {1};
meth_meth_test_Vector2_v2_58__61_10->type = alloc_MethodType(1, argcv_meth_test_Vector2_v2_58__61_10);
  meth_meth_test_Vector2_v2_58__61_10->definitionModule = modulename;
  meth_meth_test_Vector2_v2_58__61_10->definitionLine = 7;
// compilenode returning 
// compilenode returning done
// Begin line 6
  setline(6);
  setmodule(modulename);
  setsource(originalSourceLines);
// compilenode returning 
// Begin line 7
  setline(7);
  setmodule(modulename);
  setsource(originalSourceLines);
// Begin line 6
  setline(6);
  setmodule(modulename);
  setsource(originalSourceLines);
// compilenode returning *var_v1
  params[0] = *var_v1;
  Object call12 = gracelib_print(NULL, 1,  params);
// compilenode returning call12
// Begin line 7
  setline(7);
  setmodule(modulename);
  setsource(originalSourceLines);
// compilenode returning *var_v2
  params[0] = *var_v2;
  Object call13 = gracelib_print(NULL, 1,  params);
// compilenode returning call13
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
  module_test_Vector2_init();
  gracelib_stats();
  return 0;
}
