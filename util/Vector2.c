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
static const char modulename[] = "Vector2";
Object module_StandardPrelude_init();
static char *originalSourceLines[] = {
  "method zero -> Vector2 {",
  "",
  "    Vector2.new(0, 0)",
  "}",
  "",
  "method setCoords(x : Number, y : Number) -> Vector2 {",
  "",
  "    Vector2.new(x, y)",
  "}",
  "",
  "method setVector(v : Vector2) -> Vector2 {",
  "",
  "    Vector2.new(v.x, v.y)",
  "}",
  "",
  "class Vector2.new(x' : Number, y' : Number) {",
  "",
  "    var x : Number is public := x'",
  "    var y : Number is public := y'",
  "",
  "    method asString -> String is public {",
  "",
  "        \"[\" ++ x ++ \", \" ++ y ++ \"]\"",
  "    }",
  "}",
  NULL
};
Object reader_Vector2_outer_17(Object self, int nparams, int *argcv, Object* args, int flags) {
  struct UserObject *uo = (struct UserObject*)self;
  return uo->data[0];
}
Object reader_Vector2_outer_20(Object self, int nparams, int *argcv, Object* args, int flags) {
  struct UserObject *uo = (struct UserObject*)self;
  return uo->data[0];
}
Object reader_Vector2_x_21(Object self, int nparams, int *argcv, Object* args, int flags) {
  struct UserObject *uo = (struct UserObject *)self;
  return uo->data[1];
}
Object writer_Vector2_x_21(Object self, int nparams, int *argcv, Object* args, int flags) {
  struct UserObject *uo = (struct UserObject *)self;
  uo->data[1] = args[0];
  return done;
}
Object reader_Vector2_y_22(Object self, int nparams, int *argcv, Object* args, int flags) {
  struct UserObject *uo = (struct UserObject *)self;
  return uo->data[2];
}
Object writer_Vector2_y_22(Object self, int nparams, int *argcv, Object* args, int flags) {
  struct UserObject *uo = (struct UserObject *)self;
  uo->data[2] = args[0];
  return done;
}
static ClassData objclass16;
static ClassData objclass19;
static Object strlit28;
static Object strlit33;
static Object strlit40;
Object meth_Vector2_zero0(Object self, int nparts, int *argcv, Object *args, int32_t flags) {
  struct UserObject *uo = (struct UserObject*)self;
  Object closure = getdatum((Object)uo, 1, (flags>>24)&0xff);
  struct StackFrameObject *stackframe = alloc_StackFrame(1, getclosureframe(closure));
  pushclosure(closure);
  pushstackframe(stackframe, "zero");
  int frame = gc_frame_new();
  gc_frame_newslot((Object)stackframe);
  Object methodInheritingObject = NULL;
  Object params[2];
  int partcv[1];
  Object *var_Vector2 = getfromclosure(closure, 0);
  int i;
  int curarg = 0;
  int pushcv[] = {1};
  if (nparts < 1 && args)
    gracedie("missing argument list for zero (probably reflection error): got %i lists, expected 1.", nparts);
if (argcv && argcv[0] > 0)
  gracedie("too many arguments for zero");
  Object *selfslot = &(stackframe->slots[0]);
  *selfslot = self;
  setframeelementname(stackframe, 0, "self");
  if (methodInheritingObject) curarg++;
// Begin line 4
  setline(4);
  setmodule(modulename);
  setsource(originalSourceLines);
  int callframe1 = gc_frame_new();
// Begin line 3
  setline(3);
  setmodule(modulename);
  setsource(originalSourceLines);
  Object num2 = alloc_Float64(0);
// compilenode returning num2
  gc_frame_newslot(num2);
  Object num3 = alloc_Float64(0);
// compilenode returning num3
  gc_frame_newslot(num3);
// compilenode returning *var_Vector2
  params[0] = num2;
  params[1] = num3;
  partcv[0] = 2;
  Object call4 = callmethod(*var_Vector2, "new",
    1, partcv, params);
  gc_frame_end(callframe1);
// compilenode returning call4
  gc_frame_end(frame);
  return call4;
}
Object meth_Vector2_setCoords5(Object self, int nparts, int *argcv, Object *args, int32_t flags) {
  struct UserObject *uo = (struct UserObject*)self;
  Object closure = getdatum((Object)uo, 2, (flags>>24)&0xff);
  struct StackFrameObject *stackframe = alloc_StackFrame(3, getclosureframe(closure));
  pushclosure(closure);
  pushstackframe(stackframe, "setCoords");
  int frame = gc_frame_new();
  gc_frame_newslot((Object)stackframe);
  Object methodInheritingObject = NULL;
  if (nparts > 0 && argcv[0] < 2)
    gracedie("insufficient arguments to method");
  Object params[2];
  int partcv[1];
  Object *var_Vector2 = getfromclosure(closure, 0);
  int i;
  int curarg = 0;
  int pushcv[] = {1};
  if (nparts < 1 && args)
    gracedie("missing argument list for setCoords (probably reflection error): got %i lists, expected 1.", nparts);
  Object *var_x = &(stackframe->slots[0]);
  *var_x = args[curarg];
  curarg++;
  Object *var_y = &(stackframe->slots[1]);
  *var_y = args[curarg];
  curarg++;
if (argcv && argcv[0] > 2)
  gracedie("too many arguments for setCoords");
  Object *selfslot = &(stackframe->slots[2]);
  *selfslot = self;
  setframeelementname(stackframe, 0, "self");
  if (methodInheritingObject) curarg++;
// Begin line 9
  setline(9);
  setmodule(modulename);
  setsource(originalSourceLines);
  int callframe6 = gc_frame_new();
// Begin line 8
  setline(8);
  setmodule(modulename);
  setsource(originalSourceLines);
// compilenode returning *var_x
  gc_frame_newslot(*var_x);
// compilenode returning *var_y
  gc_frame_newslot(*var_y);
// compilenode returning *var_Vector2
  params[0] = *var_x;
  params[1] = *var_y;
  partcv[0] = 2;
  Object call7 = callmethod(*var_Vector2, "new",
    1, partcv, params);
  gc_frame_end(callframe6);
// compilenode returning call7
  gc_frame_end(frame);
  return call7;
}
Object meth_Vector2_setVector8(Object self, int nparts, int *argcv, Object *args, int32_t flags) {
  struct UserObject *uo = (struct UserObject*)self;
  Object closure = getdatum((Object)uo, 3, (flags>>24)&0xff);
  struct StackFrameObject *stackframe = alloc_StackFrame(2, getclosureframe(closure));
  pushclosure(closure);
  pushstackframe(stackframe, "setVector");
  int frame = gc_frame_new();
  gc_frame_newslot((Object)stackframe);
  Object methodInheritingObject = NULL;
  if (nparts > 0 && argcv[0] < 1)
    gracedie("insufficient arguments to method");
  Object params[2];
  int partcv[1];
  Object *var_Vector2 = getfromclosure(closure, 0);
  int i;
  int curarg = 0;
  int pushcv[] = {1};
  if (nparts < 1 && args)
    gracedie("missing argument list for setVector (probably reflection error): got %i lists, expected 1.", nparts);
  Object *var_v = &(stackframe->slots[0]);
  *var_v = args[curarg];
  curarg++;
if (argcv && argcv[0] > 1)
  gracedie("too many arguments for setVector");
  Object *selfslot = &(stackframe->slots[1]);
  *selfslot = self;
  setframeelementname(stackframe, 0, "self");
  if (methodInheritingObject) curarg++;
// Begin line 14
  setline(14);
  setmodule(modulename);
  setsource(originalSourceLines);
  int callframe9 = gc_frame_new();
// Begin line 13
  setline(13);
  setmodule(modulename);
  setsource(originalSourceLines);
  int callframe10 = gc_frame_new();
// compilenode returning *var_v
  partcv[0] = 0;
  Object call11 = callmethod(*var_v, "x",
    1, partcv, params);
  gc_frame_end(callframe10);
// compilenode returning call11
// compilenode returning call11
  gc_frame_newslot(call11);
  int callframe12 = gc_frame_new();
// compilenode returning *var_v
  partcv[0] = 0;
  Object call13 = callmethod(*var_v, "y",
    1, partcv, params);
  gc_frame_end(callframe12);
// compilenode returning call13
// compilenode returning call13
  gc_frame_newslot(call13);
// compilenode returning *var_Vector2
  params[0] = call11;
  params[1] = call13;
  partcv[0] = 2;
  Object call14 = callmethod(*var_Vector2, "new",
    1, partcv, params);
  gc_frame_end(callframe9);
// compilenode returning call14
  gc_frame_end(frame);
  return call14;
}
Object meth_Vector2_Vector215(Object self, int nparts, int *argcv, Object *args, int32_t flags) {
  struct UserObject *uo = (struct UserObject*)self;
  Object closure = getdatum((Object)uo, 4, (flags>>24)&0xff);
  struct StackFrameObject *stackframe = alloc_StackFrame(1, getclosureframe(closure));
  pushclosure(closure);
  pushstackframe(stackframe, "Vector2");
  int frame = gc_frame_new();
  gc_frame_newslot((Object)stackframe);
  Object methodInheritingObject = NULL;
  Object params[1];
  int partcv[1];
  Object *var_Vector2 = getfromclosure(closure, 0);
  int i;
  int curarg = 0;
  int pushcv[] = {1};
  if (nparts < 1 && args)
    gracedie("missing argument list for Vector2 (probably reflection error): got %i lists, expected 1.", nparts);
if (argcv && argcv[0] > 0)
  gracedie("too many arguments for Vector2");
  Object *selfslot = &(stackframe->slots[0]);
  *selfslot = self;
  setframeelementname(stackframe, 0, "self");
  if (methodInheritingObject) curarg++;
// Begin line 16
  setline(16);
  setmodule(modulename);
  setsource(originalSourceLines);
// compilenode returning *var_Vector2
  gc_frame_end(frame);
  return *var_Vector2;
}
Object meth_Vector2_asString23(Object self, int nparts, int *argcv, Object *args, int32_t flags) {
  struct StackFrameObject *stackframe = alloc_StackFrame(1, NULL);
  pushclosure(NULL);
  pushstackframe(stackframe, "asString");
  int frame = gc_frame_new();
  gc_frame_newslot((Object)stackframe);
  Object methodInheritingObject = NULL;
  Object params[1];
  int partcv[1];
  int i;
  int curarg = 0;
  int pushcv[] = {1};
  if (nparts < 1 && args)
    gracedie("missing argument list for asString (probably reflection error): got %i lists, expected 1.", nparts);
if (argcv && argcv[0] > 0)
  gracedie("too many arguments for asString");
  Object *selfslot = &(stackframe->slots[0]);
  *selfslot = self;
  setframeelementname(stackframe, 0, "self");
  if (methodInheritingObject) curarg++;
// Begin line 24
  setline(24);
  setmodule(modulename);
  setsource(originalSourceLines);
// Begin line 23
  setline(23);
  setmodule(modulename);
  setsource(originalSourceLines);
  if (strlit28 == NULL) {
    strlit28 = alloc_String("[");
    gc_root(strlit28);
  }
// compilenode returning strlit28
  int op_slot_left_27 = gc_frame_newslot(strlit28);
  int callframe29 = gc_frame_new();
  partcv[0] = 0;
  Object call30 = callmethodflags(self, "x", 1, partcv, params, CFLAG_SELF);
  gc_frame_end(callframe29);
// compilenode returning call30
  int op_slot_right_27 = gc_frame_newslot(call30);
  params[0] = call30;
  partcv[0] = 1;
  Object opresult32 = callmethod(strlit28, "++", 1, partcv, params);
// compilenode returning opresult32
  int op_slot_left_26 = gc_frame_newslot(opresult32);
  if (strlit33 == NULL) {
    strlit33 = alloc_String(", ");
    gc_root(strlit33);
  }
// compilenode returning strlit33
  int op_slot_right_26 = gc_frame_newslot(strlit33);
  params[0] = strlit33;
  partcv[0] = 1;
  Object opresult35 = callmethod(opresult32, "++", 1, partcv, params);
// compilenode returning opresult35
  int op_slot_left_25 = gc_frame_newslot(opresult35);
  int callframe36 = gc_frame_new();
  partcv[0] = 0;
  Object call37 = callmethodflags(self, "y", 1, partcv, params, CFLAG_SELF);
  gc_frame_end(callframe36);
// compilenode returning call37
  int op_slot_right_25 = gc_frame_newslot(call37);
  params[0] = call37;
  partcv[0] = 1;
  Object opresult39 = callmethod(opresult35, "++", 1, partcv, params);
// compilenode returning opresult39
  int op_slot_left_24 = gc_frame_newslot(opresult39);
  if (strlit40 == NULL) {
    strlit40 = alloc_String("]");
    gc_root(strlit40);
  }
// compilenode returning strlit40
  int op_slot_right_24 = gc_frame_newslot(strlit40);
  params[0] = strlit40;
  partcv[0] = 1;
  Object opresult42 = callmethod(opresult39, "++", 1, partcv, params);
// compilenode returning opresult42
  gc_frame_end(frame);
  return opresult42;
}
Object meth_Vector2_new18(Object self, int nparts, int *argcv, Object *args, int32_t flags) {
  struct StackFrameObject *stackframe = alloc_StackFrame(3, NULL);
  pushclosure(NULL);
  pushstackframe(stackframe, "new");
  int frame = gc_frame_new();
  gc_frame_newslot((Object)stackframe);
  Object methodInheritingObject = NULL;
  if (nparts > 0 && argcv[0] < 2)
    gracedie("insufficient arguments to method");
  Object params[1];
  int partcv[1];
  int i;
  int curarg = 0;
  int pushcv[] = {1};
  if (nparts < 1 && args)
    gracedie("missing argument list for new (probably reflection error): got %i lists, expected 1.", nparts);
  Object *var_x_39_ = &(stackframe->slots[0]);
  *var_x_39_ = args[curarg];
  curarg++;
  Object *var_y_39_ = &(stackframe->slots[1]);
  *var_y_39_ = args[curarg];
  curarg++;
if (argcv && argcv[0] > 2)
  gracedie("too many arguments for new");
  Object *selfslot = &(stackframe->slots[2]);
  *selfslot = self;
  setframeelementname(stackframe, 0, "self");
  if (methodInheritingObject) curarg++;
  isTailObject = 1;
  inheritingObject = methodInheritingObject;
  Object inheritingObject19 = inheritingObject;
  if (isTailObject) {
    isTailObject = 0;
    inheritingObject = NULL;
  }
  Object obj19 = alloc_userobj2(5,4, objclass19);
  gc_frame_newslot(obj19);
if (objclass19 == NULL) {
  glfree(obj19->class->name);
  obj19->class->name = "Vector2";
}
// OBJECT OUTER DEC outer
  adddatum2(obj19, self, 0);
  addmethodreal(obj19,"outer", &reader_Vector2_outer_20);
  Object oldself19 = self;
  struct StackFrameObject *oldstackframe19 = stackframe;
  stackframe = alloc_StackFrame(1, oldstackframe19);
  gc_frame_newslot((Object)stackframe);
  self = obj19;
  Object *oldselfslot19 = selfslot;
  selfslot = &stackframe->slots[0];
  *selfslot = self;
  setframeelementname(stackframe, 0, "self");
  if (inheritingObject19) {
    struct UserObject *inho19 = (struct UserObject *)inheritingObject19;
    while (inho19->super != GraceDefaultObject) inho19 = (struct UserObject *)inho19->super;
    inho19->super = obj19;
    self = inheritingObject19;
    *selfslot = self;
  }
if (objclass19 == NULL) {
  Method *reader21 = addmethodrealflags(obj19, "x",&reader_Vector2_x_21, 0);
  Method *writer21 = addmethodrealflags(obj19, "x:=",&writer_Vector2_x_21, 0);
  reader21->definitionModule = modulename;
  writer21->definitionModule = modulename;
  reader21->definitionLine = 19;
  writer21->definitionLine = 19;
}
obj19->flags |= OFLAG_MUTABLE;
adddatum2(obj19, alloc_Undefined(), 1);
if (objclass19 == NULL) {
  Method *reader22 = addmethodrealflags(obj19, "y",&reader_Vector2_y_22, 0);
  Method *writer22 = addmethodrealflags(obj19, "y:=",&writer_Vector2_y_22, 0);
  reader22->definitionModule = modulename;
  writer22->definitionModule = modulename;
  reader22->definitionLine = 21;
  writer22->definitionLine = 21;
}
obj19->flags |= OFLAG_MUTABLE;
adddatum2(obj19, alloc_Undefined(), 2);
  struct UserObject *uo23 = (struct UserObject*)obj19;
  uo23->data[3] = emptyclosure;
  Method *meth_meth_Vector2_asString23 = addmethod2pos(obj19, "asString", &meth_Vector2_asString23, 3);
int argcv_meth_Vector2_asString23[] = {0};
meth_meth_Vector2_asString23->type = alloc_MethodType(1, argcv_meth_Vector2_asString23);
  meth_meth_Vector2_asString23->definitionModule = modulename;
  meth_meth_Vector2_asString23->definitionLine = 21;
  sourceObject = obj19;
// Begin line 18
  setline(18);
  setmodule(modulename);
  setsource(originalSourceLines);
// compilenode returning *var_x_39_
  adddatum2(obj19, *var_x_39_, 1);
  sourceObject = obj19;
// Begin line 19
  setline(19);
  setmodule(modulename);
  setsource(originalSourceLines);
// compilenode returning *var_y_39_
  adddatum2(obj19, *var_y_39_, 2);
  sourceObject = obj19;
objclass19 = obj19->class;
  objclass19->definitionModule = modulename;
  objclass19->definitionLine = 13;
  self = oldself19;
  selfslot = oldselfslot19;
  stackframe = oldstackframe19;
  gc_frame_end(frame);
  return obj19;
}
Object meth_Vector2_new18_object(Object self, int nparts, int *argcv, Object *args, int32_t flags) {
  struct StackFrameObject *stackframe = alloc_StackFrame(3, NULL);
  pushclosure(NULL);
  pushstackframe(stackframe, "new()object");
  int frame = gc_frame_new();
  gc_frame_newslot((Object)stackframe);
  Object methodInheritingObject = args[0 + argcv[0]];
  if (nparts > 0 && argcv[0] < 2)
    gracedie("insufficient arguments to method");
  Object params[1];
  int partcv[1];
  int i;
  int curarg = 0;
  int pushcv[] = {1};
  if (nparts < 1 && args)
    gracedie("missing argument list for new (probably reflection error): got %i lists, expected 1.", nparts);
  Object *var_x_39_ = &(stackframe->slots[0]);
  *var_x_39_ = args[curarg];
  curarg++;
  Object *var_y_39_ = &(stackframe->slots[1]);
  *var_y_39_ = args[curarg];
  curarg++;
if (argcv && argcv[0] > 2)
  gracedie("too many arguments for new");
  Object *selfslot = &(stackframe->slots[2]);
  *selfslot = self;
  setframeelementname(stackframe, 0, "self");
  if (methodInheritingObject) curarg++;
  isTailObject = 1;
  inheritingObject = methodInheritingObject;
  Object inheritingObject19 = inheritingObject;
  if (isTailObject) {
    isTailObject = 0;
    inheritingObject = NULL;
  }
  Object obj19 = alloc_userobj2(5,4, objclass19);
  gc_frame_newslot(obj19);
if (objclass19 == NULL) {
  glfree(obj19->class->name);
  obj19->class->name = "Vector2";
}
// OBJECT OUTER DEC outer
  adddatum2(obj19, self, 0);
  addmethodreal(obj19,"outer", &reader_Vector2_outer_20);
  Object oldself19 = self;
  struct StackFrameObject *oldstackframe19 = stackframe;
  stackframe = alloc_StackFrame(1, oldstackframe19);
  gc_frame_newslot((Object)stackframe);
  self = obj19;
  Object *oldselfslot19 = selfslot;
  selfslot = &stackframe->slots[0];
  *selfslot = self;
  setframeelementname(stackframe, 0, "self");
  if (inheritingObject19) {
    struct UserObject *inho19 = (struct UserObject *)inheritingObject19;
    while (inho19->super != GraceDefaultObject) inho19 = (struct UserObject *)inho19->super;
    inho19->super = obj19;
    self = inheritingObject19;
    *selfslot = self;
  }
if (objclass19 == NULL) {
  Method *reader21 = addmethodrealflags(obj19, "x",&reader_Vector2_x_21, 0);
  Method *writer21 = addmethodrealflags(obj19, "x:=",&writer_Vector2_x_21, 0);
  reader21->definitionModule = modulename;
  writer21->definitionModule = modulename;
  reader21->definitionLine = 19;
  writer21->definitionLine = 19;
}
obj19->flags |= OFLAG_MUTABLE;
adddatum2(obj19, alloc_Undefined(), 1);
if (objclass19 == NULL) {
  Method *reader22 = addmethodrealflags(obj19, "y",&reader_Vector2_y_22, 0);
  Method *writer22 = addmethodrealflags(obj19, "y:=",&writer_Vector2_y_22, 0);
  reader22->definitionModule = modulename;
  writer22->definitionModule = modulename;
  reader22->definitionLine = 21;
  writer22->definitionLine = 21;
}
obj19->flags |= OFLAG_MUTABLE;
adddatum2(obj19, alloc_Undefined(), 2);
  struct UserObject *uo23 = (struct UserObject*)obj19;
  uo23->data[3] = emptyclosure;
  Method *meth_meth_Vector2_asString23 = addmethod2pos(obj19, "asString", &meth_Vector2_asString23, 3);
int argcv_meth_Vector2_asString23[] = {0};
meth_meth_Vector2_asString23->type = alloc_MethodType(1, argcv_meth_Vector2_asString23);
  meth_meth_Vector2_asString23->definitionModule = modulename;
  meth_meth_Vector2_asString23->definitionLine = 21;
  sourceObject = obj19;
// Begin line 18
  setline(18);
  setmodule(modulename);
  setsource(originalSourceLines);
// compilenode returning *var_x_39_
  adddatum2(obj19, *var_x_39_, 1);
  sourceObject = obj19;
// Begin line 19
  setline(19);
  setmodule(modulename);
  setsource(originalSourceLines);
// compilenode returning *var_y_39_
  adddatum2(obj19, *var_y_39_, 2);
  sourceObject = obj19;
objclass19 = obj19->class;
  objclass19->definitionModule = modulename;
  objclass19->definitionLine = 13;
  self = oldself19;
  selfslot = oldselfslot19;
  stackframe = oldstackframe19;
  gc_frame_end(frame);
  return obj19;
}
Object module_Vector2_init() {
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
  setclassname(self, "Module<Vector2>");
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
  Object params[1];
  int partcv[1];
  Object *var_Vector2 = &(stackframe->slots[1]);
  setframeelementname(stackframe, 1, "Vector2");
  block_savedest(self);
  Object closure0 = createclosure(1, "zero");
setclosureframe(closure0, stackframe);
  addtoclosure(closure0, var_Vector2);
  struct UserObject *uo0 = (struct UserObject*)self;
  uo0->data[1] = (Object)closure0;
  Method *meth_meth_Vector2_zero0 = addmethod2pos(self, "zero", &meth_Vector2_zero0, 1);
int argcv_meth_Vector2_zero0[] = {0};
meth_meth_Vector2_zero0->type = alloc_MethodType(1, argcv_meth_Vector2_zero0);
  meth_meth_Vector2_zero0->definitionModule = modulename;
  meth_meth_Vector2_zero0->definitionLine = 1;
// compilenode returning 
// Begin line 6
  setline(6);
  setmodule(modulename);
  setsource(originalSourceLines);
  block_savedest(self);
  Object closure5 = createclosure(1, "setCoords");
setclosureframe(closure5, stackframe);
  addtoclosure(closure5, var_Vector2);
  struct UserObject *uo5 = (struct UserObject*)self;
  uo5->data[2] = (Object)closure5;
  Method *meth_meth_Vector2_setCoords5 = addmethod2pos(self, "setCoords", &meth_Vector2_setCoords5, 2);
int argcv_meth_Vector2_setCoords5[] = {2};
meth_meth_Vector2_setCoords5->type = alloc_MethodType(1, argcv_meth_Vector2_setCoords5);
meth_meth_Vector2_setCoords5->type->types[0] = type_Number;
meth_meth_Vector2_setCoords5->type->names[0] = "x";
meth_meth_Vector2_setCoords5->type->types[1] = type_Number;
meth_meth_Vector2_setCoords5->type->names[1] = "y";
  meth_meth_Vector2_setCoords5->definitionModule = modulename;
  meth_meth_Vector2_setCoords5->definitionLine = 6;
// compilenode returning 
// Begin line 11
  setline(11);
  setmodule(modulename);
  setsource(originalSourceLines);
  block_savedest(self);
  Object closure8 = createclosure(1, "setVector");
setclosureframe(closure8, stackframe);
  addtoclosure(closure8, var_Vector2);
  struct UserObject *uo8 = (struct UserObject*)self;
  uo8->data[3] = (Object)closure8;
  Method *meth_meth_Vector2_setVector8 = addmethod2pos(self, "setVector", &meth_Vector2_setVector8, 3);
int argcv_meth_Vector2_setVector8[] = {1};
meth_meth_Vector2_setVector8->type = alloc_MethodType(1, argcv_meth_Vector2_setVector8);
  meth_meth_Vector2_setVector8->definitionModule = modulename;
  meth_meth_Vector2_setVector8->definitionLine = 11;
// compilenode returning 
// Begin line 1
  setline(1);
  setmodule(modulename);
  setsource(originalSourceLines);
// compilenode returning 
// Begin line 6
  setline(6);
  setmodule(modulename);
  setsource(originalSourceLines);
// compilenode returning 
// Begin line 11
  setline(11);
  setmodule(modulename);
  setsource(originalSourceLines);
// compilenode returning 
// Begin line 16
  setline(16);
  setmodule(modulename);
  setsource(originalSourceLines);
// Begin line 13
  setline(13);
  setmodule(modulename);
  setsource(originalSourceLines);
  block_savedest(self);
  Object closure15 = createclosure(1, "Vector2");
setclosureframe(closure15, stackframe);
  addtoclosure(closure15, var_Vector2);
  struct UserObject *uo15 = (struct UserObject*)self;
  uo15->data[4] = (Object)closure15;
  Method *meth_meth_Vector2_Vector215 = addmethod2pos(self, "Vector2", &meth_Vector2_Vector215, 4);
int argcv_meth_Vector2_Vector215[] = {0};
meth_meth_Vector2_Vector215->type = alloc_MethodType(1, argcv_meth_Vector2_Vector215);
  meth_meth_Vector2_Vector215->definitionModule = modulename;
  meth_meth_Vector2_Vector215->definitionLine = 13;
// compilenode returning 
// Begin line 13
  setline(13);
  setmodule(modulename);
  setsource(originalSourceLines);
  Object inheritingObject16 = inheritingObject;
  if (isTailObject) {
    isTailObject = 0;
    inheritingObject = NULL;
  }
  Object obj16 = alloc_userobj2(2,4, objclass16);
  gc_frame_newslot(obj16);
// OBJECT OUTER DEC outer
  adddatum2(obj16, self, 0);
  addmethodreal(obj16,"outer", &reader_Vector2_outer_17);
  Object oldself16 = self;
  struct StackFrameObject *oldstackframe16 = stackframe;
  stackframe = alloc_StackFrame(1, oldstackframe16);
  gc_frame_newslot((Object)stackframe);
  self = obj16;
  Object *oldselfslot16 = selfslot;
  selfslot = &stackframe->slots[0];
  *selfslot = self;
  setframeelementname(stackframe, 0, "self");
  if (inheritingObject16) {
    struct UserObject *inho16 = (struct UserObject *)inheritingObject16;
    while (inho16->super != GraceDefaultObject) inho16 = (struct UserObject *)inho16->super;
    inho16->super = obj16;
    self = inheritingObject16;
    *selfslot = self;
  }
  struct UserObject *uo18 = (struct UserObject*)obj16;
  uo18->data[1] = emptyclosure;
  Method *meth_meth_Vector2_new18 = addmethod2pos(obj16, "new", &meth_Vector2_new18, 1);
int argcv_meth_Vector2_new18[] = {2};
meth_meth_Vector2_new18->type = alloc_MethodType(1, argcv_meth_Vector2_new18);
meth_meth_Vector2_new18->type->types[0] = type_Number;
meth_meth_Vector2_new18->type->names[0] = "x'";
meth_meth_Vector2_new18->type->types[1] = type_Number;
meth_meth_Vector2_new18->type->names[1] = "y'";
  meth_meth_Vector2_new18->definitionModule = modulename;
  meth_meth_Vector2_new18->definitionLine = 13;
  Method *meth_meth_Vector2_new18_object = addmethod2pos(obj16, "new()object", &meth_Vector2_new18_object, 1);
int argcv_meth_Vector2_new18_object[] = {2};
meth_meth_Vector2_new18_object->type = alloc_MethodType(1, argcv_meth_Vector2_new18_object);
meth_meth_Vector2_new18_object->type->types[0] = type_Number;
meth_meth_Vector2_new18_object->type->names[0] = "x'";
meth_meth_Vector2_new18_object->type->types[1] = type_Number;
meth_meth_Vector2_new18_object->type->names[1] = "y'";
  meth_meth_Vector2_new18_object->definitionModule = modulename;
  meth_meth_Vector2_new18_object->definitionLine = 13;
  sourceObject = obj16;
objclass16 = obj16->class;
  objclass16->definitionModule = modulename;
  objclass16->definitionLine = 13;
  self = oldself16;
  selfslot = oldselfslot16;
  stackframe = oldstackframe16;
// compilenode returning obj16
  *var_Vector2 = obj16;
  if (obj16 == undefined)
    callmethod(done, "assignment", 0, NULL, NULL);
// compilenode returning done
// compilenode returning done
  gc_frame_end(frame);
  return self;
}
