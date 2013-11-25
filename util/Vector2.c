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
  "//CONSTRUCTOR METHODS",
  "//creates a new zero 2d vector",
  "method zero -> Vector2 {",
  "",
  "    Vector2.new(0, 0)",
  "}",
  "",
  "//creates a new 2d vector and initialises it with the given x and y values",
  "method setCoords(x : Number, y : Number) -> Vector2 {",
  "",
  "    Vector2.new(x, y)",
  "}",
  "",
  "//creates a new 2d vector and initialises it with the values of the given",
  "//2d vector",
  "method setVector2(v : Vector2) -> Vector2 {",
  "",
  "    Vector2.new(v.x, v.y)",
  "}",
  "",
  "//creates a new 2d vector and initialises it with the x and y values of the",
  "//given 3d vector and truncates the z value",
  "method setVector3(v : Vector3) -> Vector2 {",
  "",
  "    Vector2.new(v.x, v.y)",
  "}",
  "",
  "//creates a new 2d vector initialised with x: 1, y: 0",
  "method xAxis -> Vector2 {",
  "",
  "    Vector2.new(1, 0);",
  "}",
  "",
  "//creates a new 2d vector initialised with x: 0, y: 1",
  "method yAxis -> Vector2 {",
  "",
  "    Vector2.new(0, 1);",
  "}",
  "",
  "//VECTOR2 CLASS",
  "//constructs a new 2d vector with the given x' and y' values",
  "class Vector2.new(x' : Number, y' : Number) {",
  "",
  "    var x : Number is public := x'",
  "    var y : Number is public := y'",
  "",
  "    //PUBLIC METHODS",
  "    method asString -> String is public {",
  "",
  "        \"[\" ++ x ++ \", \" ++ y ++ \"]\"",
  "    }",
  "}",
  NULL
};
Object reader_Vector2_outer_34(Object self, int nparams, int *argcv, Object* args, int flags) {
  struct UserObject *uo = (struct UserObject*)self;
  return uo->data[0];
}
Object reader_Vector2_outer_37(Object self, int nparams, int *argcv, Object* args, int flags) {
  struct UserObject *uo = (struct UserObject*)self;
  return uo->data[0];
}
Object reader_Vector2_x_38(Object self, int nparams, int *argcv, Object* args, int flags) {
  struct UserObject *uo = (struct UserObject *)self;
  return uo->data[1];
}
Object writer_Vector2_x_38(Object self, int nparams, int *argcv, Object* args, int flags) {
  struct UserObject *uo = (struct UserObject *)self;
  uo->data[1] = args[0];
  return done;
}
Object reader_Vector2_y_39(Object self, int nparams, int *argcv, Object* args, int flags) {
  struct UserObject *uo = (struct UserObject *)self;
  return uo->data[2];
}
Object writer_Vector2_y_39(Object self, int nparams, int *argcv, Object* args, int flags) {
  struct UserObject *uo = (struct UserObject *)self;
  uo->data[2] = args[0];
  return done;
}
static ClassData objclass33;
static ClassData objclass36;
static Object strlit45;
static Object strlit50;
static Object strlit57;
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
// Begin line 6
  setline(6);
  setmodule(modulename);
  setsource(originalSourceLines);
  int callframe1 = gc_frame_new();
// Begin line 5
  setline(5);
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
// Begin line 12
  setline(12);
  setmodule(modulename);
  setsource(originalSourceLines);
  int callframe6 = gc_frame_new();
// Begin line 11
  setline(11);
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
Object meth_Vector2_setVector28(Object self, int nparts, int *argcv, Object *args, int32_t flags) {
  struct UserObject *uo = (struct UserObject*)self;
  Object closure = getdatum((Object)uo, 3, (flags>>24)&0xff);
  struct StackFrameObject *stackframe = alloc_StackFrame(2, getclosureframe(closure));
  pushclosure(closure);
  pushstackframe(stackframe, "setVector2");
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
    gracedie("missing argument list for setVector2 (probably reflection error): got %i lists, expected 1.", nparts);
  Object *var_v = &(stackframe->slots[0]);
  *var_v = args[curarg];
  curarg++;
if (argcv && argcv[0] > 1)
  gracedie("too many arguments for setVector2");
  Object *selfslot = &(stackframe->slots[1]);
  *selfslot = self;
  setframeelementname(stackframe, 0, "self");
  if (methodInheritingObject) curarg++;
// Begin line 19
  setline(19);
  setmodule(modulename);
  setsource(originalSourceLines);
  int callframe9 = gc_frame_new();
// Begin line 18
  setline(18);
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
Object meth_Vector2_setVector315(Object self, int nparts, int *argcv, Object *args, int32_t flags) {
  struct UserObject *uo = (struct UserObject*)self;
  Object closure = getdatum((Object)uo, 4, (flags>>24)&0xff);
  struct StackFrameObject *stackframe = alloc_StackFrame(2, getclosureframe(closure));
  pushclosure(closure);
  pushstackframe(stackframe, "setVector3");
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
    gracedie("missing argument list for setVector3 (probably reflection error): got %i lists, expected 1.", nparts);
  Object *var_v = &(stackframe->slots[0]);
  *var_v = args[curarg];
  curarg++;
if (argcv && argcv[0] > 1)
  gracedie("too many arguments for setVector3");
  Object *selfslot = &(stackframe->slots[1]);
  *selfslot = self;
  setframeelementname(stackframe, 0, "self");
  if (methodInheritingObject) curarg++;
// Begin line 26
  setline(26);
  setmodule(modulename);
  setsource(originalSourceLines);
  int callframe16 = gc_frame_new();
// Begin line 25
  setline(25);
  setmodule(modulename);
  setsource(originalSourceLines);
  int callframe17 = gc_frame_new();
// compilenode returning *var_v
  partcv[0] = 0;
  Object call18 = callmethod(*var_v, "x",
    1, partcv, params);
  gc_frame_end(callframe17);
// compilenode returning call18
// compilenode returning call18
  gc_frame_newslot(call18);
  int callframe19 = gc_frame_new();
// compilenode returning *var_v
  partcv[0] = 0;
  Object call20 = callmethod(*var_v, "y",
    1, partcv, params);
  gc_frame_end(callframe19);
// compilenode returning call20
// compilenode returning call20
  gc_frame_newslot(call20);
// compilenode returning *var_Vector2
  params[0] = call18;
  params[1] = call20;
  partcv[0] = 2;
  Object call21 = callmethod(*var_Vector2, "new",
    1, partcv, params);
  gc_frame_end(callframe16);
// compilenode returning call21
  gc_frame_end(frame);
  return call21;
}
Object meth_Vector2_xAxis22(Object self, int nparts, int *argcv, Object *args, int32_t flags) {
  struct UserObject *uo = (struct UserObject*)self;
  Object closure = getdatum((Object)uo, 5, (flags>>24)&0xff);
  struct StackFrameObject *stackframe = alloc_StackFrame(1, getclosureframe(closure));
  pushclosure(closure);
  pushstackframe(stackframe, "xAxis");
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
    gracedie("missing argument list for xAxis (probably reflection error): got %i lists, expected 1.", nparts);
if (argcv && argcv[0] > 0)
  gracedie("too many arguments for xAxis");
  Object *selfslot = &(stackframe->slots[0]);
  *selfslot = self;
  setframeelementname(stackframe, 0, "self");
  if (methodInheritingObject) curarg++;
// Begin line 31
  setline(31);
  setmodule(modulename);
  setsource(originalSourceLines);
  int callframe23 = gc_frame_new();
  Object num24 = alloc_Float64(1);
// compilenode returning num24
  gc_frame_newslot(num24);
  Object num25 = alloc_Float64(0);
// compilenode returning num25
  gc_frame_newslot(num25);
// compilenode returning *var_Vector2
  params[0] = num24;
  params[1] = num25;
  partcv[0] = 2;
  Object call26 = callmethod(*var_Vector2, "new",
    1, partcv, params);
  gc_frame_end(callframe23);
// compilenode returning call26
  gc_frame_end(frame);
  return call26;
}
Object meth_Vector2_yAxis27(Object self, int nparts, int *argcv, Object *args, int32_t flags) {
  struct UserObject *uo = (struct UserObject*)self;
  Object closure = getdatum((Object)uo, 6, (flags>>24)&0xff);
  struct StackFrameObject *stackframe = alloc_StackFrame(1, getclosureframe(closure));
  pushclosure(closure);
  pushstackframe(stackframe, "yAxis");
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
    gracedie("missing argument list for yAxis (probably reflection error): got %i lists, expected 1.", nparts);
if (argcv && argcv[0] > 0)
  gracedie("too many arguments for yAxis");
  Object *selfslot = &(stackframe->slots[0]);
  *selfslot = self;
  setframeelementname(stackframe, 0, "self");
  if (methodInheritingObject) curarg++;
// Begin line 37
  setline(37);
  setmodule(modulename);
  setsource(originalSourceLines);
  int callframe28 = gc_frame_new();
  Object num29 = alloc_Float64(0);
// compilenode returning num29
  gc_frame_newslot(num29);
  Object num30 = alloc_Float64(1);
// compilenode returning num30
  gc_frame_newslot(num30);
// compilenode returning *var_Vector2
  params[0] = num29;
  params[1] = num30;
  partcv[0] = 2;
  Object call31 = callmethod(*var_Vector2, "new",
    1, partcv, params);
  gc_frame_end(callframe28);
// compilenode returning call31
  gc_frame_end(frame);
  return call31;
}
Object meth_Vector2_Vector232(Object self, int nparts, int *argcv, Object *args, int32_t flags) {
  struct UserObject *uo = (struct UserObject*)self;
  Object closure = getdatum((Object)uo, 7, (flags>>24)&0xff);
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
// Begin line 42
  setline(42);
  setmodule(modulename);
  setsource(originalSourceLines);
// compilenode returning *var_Vector2
  gc_frame_end(frame);
  return *var_Vector2;
}
Object meth_Vector2_asString40(Object self, int nparts, int *argcv, Object *args, int32_t flags) {
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
// Begin line 51
  setline(51);
  setmodule(modulename);
  setsource(originalSourceLines);
// Begin line 50
  setline(50);
  setmodule(modulename);
  setsource(originalSourceLines);
  if (strlit45 == NULL) {
    strlit45 = alloc_String("[");
    gc_root(strlit45);
  }
// compilenode returning strlit45
  int op_slot_left_44 = gc_frame_newslot(strlit45);
  int callframe46 = gc_frame_new();
  partcv[0] = 0;
  Object call47 = callmethodflags(self, "x", 1, partcv, params, CFLAG_SELF);
  gc_frame_end(callframe46);
// compilenode returning call47
  int op_slot_right_44 = gc_frame_newslot(call47);
  params[0] = call47;
  partcv[0] = 1;
  Object opresult49 = callmethod(strlit45, "++", 1, partcv, params);
// compilenode returning opresult49
  int op_slot_left_43 = gc_frame_newslot(opresult49);
  if (strlit50 == NULL) {
    strlit50 = alloc_String(", ");
    gc_root(strlit50);
  }
// compilenode returning strlit50
  int op_slot_right_43 = gc_frame_newslot(strlit50);
  params[0] = strlit50;
  partcv[0] = 1;
  Object opresult52 = callmethod(opresult49, "++", 1, partcv, params);
// compilenode returning opresult52
  int op_slot_left_42 = gc_frame_newslot(opresult52);
  int callframe53 = gc_frame_new();
  partcv[0] = 0;
  Object call54 = callmethodflags(self, "y", 1, partcv, params, CFLAG_SELF);
  gc_frame_end(callframe53);
// compilenode returning call54
  int op_slot_right_42 = gc_frame_newslot(call54);
  params[0] = call54;
  partcv[0] = 1;
  Object opresult56 = callmethod(opresult52, "++", 1, partcv, params);
// compilenode returning opresult56
  int op_slot_left_41 = gc_frame_newslot(opresult56);
  if (strlit57 == NULL) {
    strlit57 = alloc_String("]");
    gc_root(strlit57);
  }
// compilenode returning strlit57
  int op_slot_right_41 = gc_frame_newslot(strlit57);
  params[0] = strlit57;
  partcv[0] = 1;
  Object opresult59 = callmethod(opresult56, "++", 1, partcv, params);
// compilenode returning opresult59
  gc_frame_end(frame);
  return opresult59;
}
Object meth_Vector2_new35(Object self, int nparts, int *argcv, Object *args, int32_t flags) {
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
  Object inheritingObject36 = inheritingObject;
  if (isTailObject) {
    isTailObject = 0;
    inheritingObject = NULL;
  }
  Object obj36 = alloc_userobj2(5,4, objclass36);
  gc_frame_newslot(obj36);
if (objclass36 == NULL) {
  glfree(obj36->class->name);
  obj36->class->name = "Vector2";
}
// OBJECT OUTER DEC outer
  adddatum2(obj36, self, 0);
  addmethodreal(obj36,"outer", &reader_Vector2_outer_37);
  Object oldself36 = self;
  struct StackFrameObject *oldstackframe36 = stackframe;
  stackframe = alloc_StackFrame(1, oldstackframe36);
  gc_frame_newslot((Object)stackframe);
  self = obj36;
  Object *oldselfslot36 = selfslot;
  selfslot = &stackframe->slots[0];
  *selfslot = self;
  setframeelementname(stackframe, 0, "self");
  if (inheritingObject36) {
    struct UserObject *inho36 = (struct UserObject *)inheritingObject36;
    while (inho36->super != GraceDefaultObject) inho36 = (struct UserObject *)inho36->super;
    inho36->super = obj36;
    self = inheritingObject36;
    *selfslot = self;
  }
if (objclass36 == NULL) {
  Method *reader38 = addmethodrealflags(obj36, "x",&reader_Vector2_x_38, 0);
  Method *writer38 = addmethodrealflags(obj36, "x:=",&writer_Vector2_x_38, 0);
  reader38->definitionModule = modulename;
  writer38->definitionModule = modulename;
  reader38->definitionLine = 45;
  writer38->definitionLine = 45;
}
obj36->flags |= OFLAG_MUTABLE;
adddatum2(obj36, alloc_Undefined(), 1);
if (objclass36 == NULL) {
  Method *reader39 = addmethodrealflags(obj36, "y",&reader_Vector2_y_39, 0);
  Method *writer39 = addmethodrealflags(obj36, "y:=",&writer_Vector2_y_39, 0);
  reader39->definitionModule = modulename;
  writer39->definitionModule = modulename;
  reader39->definitionLine = 48;
  writer39->definitionLine = 48;
}
obj36->flags |= OFLAG_MUTABLE;
adddatum2(obj36, alloc_Undefined(), 2);
  struct UserObject *uo40 = (struct UserObject*)obj36;
  uo40->data[3] = emptyclosure;
  Method *meth_meth_Vector2_asString40 = addmethod2pos(obj36, "asString", &meth_Vector2_asString40, 3);
int argcv_meth_Vector2_asString40[] = {0};
meth_meth_Vector2_asString40->type = alloc_MethodType(1, argcv_meth_Vector2_asString40);
  meth_meth_Vector2_asString40->definitionModule = modulename;
  meth_meth_Vector2_asString40->definitionLine = 48;
  sourceObject = obj36;
// Begin line 44
  setline(44);
  setmodule(modulename);
  setsource(originalSourceLines);
// compilenode returning *var_x_39_
  adddatum2(obj36, *var_x_39_, 1);
  sourceObject = obj36;
// Begin line 45
  setline(45);
  setmodule(modulename);
  setsource(originalSourceLines);
// compilenode returning *var_y_39_
  adddatum2(obj36, *var_y_39_, 2);
  sourceObject = obj36;
objclass36 = obj36->class;
  objclass36->definitionModule = modulename;
  objclass36->definitionLine = 25;
  self = oldself36;
  selfslot = oldselfslot36;
  stackframe = oldstackframe36;
  gc_frame_end(frame);
  return obj36;
}
Object meth_Vector2_new35_object(Object self, int nparts, int *argcv, Object *args, int32_t flags) {
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
  Object inheritingObject36 = inheritingObject;
  if (isTailObject) {
    isTailObject = 0;
    inheritingObject = NULL;
  }
  Object obj36 = alloc_userobj2(5,4, objclass36);
  gc_frame_newslot(obj36);
if (objclass36 == NULL) {
  glfree(obj36->class->name);
  obj36->class->name = "Vector2";
}
// OBJECT OUTER DEC outer
  adddatum2(obj36, self, 0);
  addmethodreal(obj36,"outer", &reader_Vector2_outer_37);
  Object oldself36 = self;
  struct StackFrameObject *oldstackframe36 = stackframe;
  stackframe = alloc_StackFrame(1, oldstackframe36);
  gc_frame_newslot((Object)stackframe);
  self = obj36;
  Object *oldselfslot36 = selfslot;
  selfslot = &stackframe->slots[0];
  *selfslot = self;
  setframeelementname(stackframe, 0, "self");
  if (inheritingObject36) {
    struct UserObject *inho36 = (struct UserObject *)inheritingObject36;
    while (inho36->super != GraceDefaultObject) inho36 = (struct UserObject *)inho36->super;
    inho36->super = obj36;
    self = inheritingObject36;
    *selfslot = self;
  }
if (objclass36 == NULL) {
  Method *reader38 = addmethodrealflags(obj36, "x",&reader_Vector2_x_38, 0);
  Method *writer38 = addmethodrealflags(obj36, "x:=",&writer_Vector2_x_38, 0);
  reader38->definitionModule = modulename;
  writer38->definitionModule = modulename;
  reader38->definitionLine = 45;
  writer38->definitionLine = 45;
}
obj36->flags |= OFLAG_MUTABLE;
adddatum2(obj36, alloc_Undefined(), 1);
if (objclass36 == NULL) {
  Method *reader39 = addmethodrealflags(obj36, "y",&reader_Vector2_y_39, 0);
  Method *writer39 = addmethodrealflags(obj36, "y:=",&writer_Vector2_y_39, 0);
  reader39->definitionModule = modulename;
  writer39->definitionModule = modulename;
  reader39->definitionLine = 48;
  writer39->definitionLine = 48;
}
obj36->flags |= OFLAG_MUTABLE;
adddatum2(obj36, alloc_Undefined(), 2);
  struct UserObject *uo40 = (struct UserObject*)obj36;
  uo40->data[3] = emptyclosure;
  Method *meth_meth_Vector2_asString40 = addmethod2pos(obj36, "asString", &meth_Vector2_asString40, 3);
int argcv_meth_Vector2_asString40[] = {0};
meth_meth_Vector2_asString40->type = alloc_MethodType(1, argcv_meth_Vector2_asString40);
  meth_meth_Vector2_asString40->definitionModule = modulename;
  meth_meth_Vector2_asString40->definitionLine = 48;
  sourceObject = obj36;
// Begin line 44
  setline(44);
  setmodule(modulename);
  setsource(originalSourceLines);
// compilenode returning *var_x_39_
  adddatum2(obj36, *var_x_39_, 1);
  sourceObject = obj36;
// Begin line 45
  setline(45);
  setmodule(modulename);
  setsource(originalSourceLines);
// compilenode returning *var_y_39_
  adddatum2(obj36, *var_y_39_, 2);
  sourceObject = obj36;
objclass36 = obj36->class;
  objclass36->definitionModule = modulename;
  objclass36->definitionLine = 25;
  self = oldself36;
  selfslot = oldselfslot36;
  stackframe = oldstackframe36;
  gc_frame_end(frame);
  return obj36;
}
Object module_Vector2_init() {
  int flags = 0;
  int frame = gc_frame_new();
  Object self = alloc_obj2(9, 9);
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
  struct StackFrameObject *stackframe = alloc_StackFrame(9, NULL);
  gc_root((Object)stackframe);
  pushstackframe(stackframe, "module scope");
  Object *selfslot = &(stackframe->slots[0]);
  *selfslot = self;
  setframeelementname(stackframe, 0, "self");
  Object params[1];
  int partcv[1];
  Object *var_Vector2 = &(stackframe->slots[1]);
  setframeelementname(stackframe, 1, "Vector2");
// Begin line 3
  setline(3);
  setmodule(modulename);
  setsource(originalSourceLines);
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
  meth_meth_Vector2_zero0->definitionLine = 3;
// compilenode returning 
// Begin line 9
  setline(9);
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
  meth_meth_Vector2_setCoords5->definitionLine = 9;
// compilenode returning 
// Begin line 16
  setline(16);
  setmodule(modulename);
  setsource(originalSourceLines);
  block_savedest(self);
  Object closure8 = createclosure(1, "setVector2");
setclosureframe(closure8, stackframe);
  addtoclosure(closure8, var_Vector2);
  struct UserObject *uo8 = (struct UserObject*)self;
  uo8->data[3] = (Object)closure8;
  Method *meth_meth_Vector2_setVector28 = addmethod2pos(self, "setVector2", &meth_Vector2_setVector28, 3);
int argcv_meth_Vector2_setVector28[] = {1};
meth_meth_Vector2_setVector28->type = alloc_MethodType(1, argcv_meth_Vector2_setVector28);
  meth_meth_Vector2_setVector28->definitionModule = modulename;
  meth_meth_Vector2_setVector28->definitionLine = 16;
// compilenode returning 
// Begin line 23
  setline(23);
  setmodule(modulename);
  setsource(originalSourceLines);
  block_savedest(self);
  Object closure15 = createclosure(1, "setVector3");
setclosureframe(closure15, stackframe);
  addtoclosure(closure15, var_Vector2);
  struct UserObject *uo15 = (struct UserObject*)self;
  uo15->data[4] = (Object)closure15;
  Method *meth_meth_Vector2_setVector315 = addmethod2pos(self, "setVector3", &meth_Vector2_setVector315, 4);
int argcv_meth_Vector2_setVector315[] = {1};
meth_meth_Vector2_setVector315->type = alloc_MethodType(1, argcv_meth_Vector2_setVector315);
  meth_meth_Vector2_setVector315->definitionModule = modulename;
  meth_meth_Vector2_setVector315->definitionLine = 23;
// compilenode returning 
// Begin line 29
  setline(29);
  setmodule(modulename);
  setsource(originalSourceLines);
  block_savedest(self);
  Object closure22 = createclosure(1, "xAxis");
setclosureframe(closure22, stackframe);
  addtoclosure(closure22, var_Vector2);
  struct UserObject *uo22 = (struct UserObject*)self;
  uo22->data[5] = (Object)closure22;
  Method *meth_meth_Vector2_xAxis22 = addmethod2pos(self, "xAxis", &meth_Vector2_xAxis22, 5);
int argcv_meth_Vector2_xAxis22[] = {0};
meth_meth_Vector2_xAxis22->type = alloc_MethodType(1, argcv_meth_Vector2_xAxis22);
  meth_meth_Vector2_xAxis22->definitionModule = modulename;
  meth_meth_Vector2_xAxis22->definitionLine = 29;
// compilenode returning 
// Begin line 35
  setline(35);
  setmodule(modulename);
  setsource(originalSourceLines);
  block_savedest(self);
  Object closure27 = createclosure(1, "yAxis");
setclosureframe(closure27, stackframe);
  addtoclosure(closure27, var_Vector2);
  struct UserObject *uo27 = (struct UserObject*)self;
  uo27->data[6] = (Object)closure27;
  Method *meth_meth_Vector2_yAxis27 = addmethod2pos(self, "yAxis", &meth_Vector2_yAxis27, 6);
int argcv_meth_Vector2_yAxis27[] = {0};
meth_meth_Vector2_yAxis27->type = alloc_MethodType(1, argcv_meth_Vector2_yAxis27);
  meth_meth_Vector2_yAxis27->definitionModule = modulename;
  meth_meth_Vector2_yAxis27->definitionLine = 35;
// compilenode returning 
// Begin line 3
  setline(3);
  setmodule(modulename);
  setsource(originalSourceLines);
// compilenode returning 
// Begin line 9
  setline(9);
  setmodule(modulename);
  setsource(originalSourceLines);
// compilenode returning 
// Begin line 16
  setline(16);
  setmodule(modulename);
  setsource(originalSourceLines);
// compilenode returning 
// Begin line 23
  setline(23);
  setmodule(modulename);
  setsource(originalSourceLines);
// compilenode returning 
// Begin line 29
  setline(29);
  setmodule(modulename);
  setsource(originalSourceLines);
// compilenode returning 
// Begin line 35
  setline(35);
  setmodule(modulename);
  setsource(originalSourceLines);
// compilenode returning 
// Begin line 42
  setline(42);
  setmodule(modulename);
  setsource(originalSourceLines);
// Begin line 25
  setline(25);
  setmodule(modulename);
  setsource(originalSourceLines);
  block_savedest(self);
  Object closure32 = createclosure(1, "Vector2");
setclosureframe(closure32, stackframe);
  addtoclosure(closure32, var_Vector2);
  struct UserObject *uo32 = (struct UserObject*)self;
  uo32->data[7] = (Object)closure32;
  Method *meth_meth_Vector2_Vector232 = addmethod2pos(self, "Vector2", &meth_Vector2_Vector232, 7);
int argcv_meth_Vector2_Vector232[] = {0};
meth_meth_Vector2_Vector232->type = alloc_MethodType(1, argcv_meth_Vector2_Vector232);
  meth_meth_Vector2_Vector232->definitionModule = modulename;
  meth_meth_Vector2_Vector232->definitionLine = 25;
// compilenode returning 
// Begin line 25
  setline(25);
  setmodule(modulename);
  setsource(originalSourceLines);
  Object inheritingObject33 = inheritingObject;
  if (isTailObject) {
    isTailObject = 0;
    inheritingObject = NULL;
  }
  Object obj33 = alloc_userobj2(2,4, objclass33);
  gc_frame_newslot(obj33);
// OBJECT OUTER DEC outer
  adddatum2(obj33, self, 0);
  addmethodreal(obj33,"outer", &reader_Vector2_outer_34);
  Object oldself33 = self;
  struct StackFrameObject *oldstackframe33 = stackframe;
  stackframe = alloc_StackFrame(1, oldstackframe33);
  gc_frame_newslot((Object)stackframe);
  self = obj33;
  Object *oldselfslot33 = selfslot;
  selfslot = &stackframe->slots[0];
  *selfslot = self;
  setframeelementname(stackframe, 0, "self");
  if (inheritingObject33) {
    struct UserObject *inho33 = (struct UserObject *)inheritingObject33;
    while (inho33->super != GraceDefaultObject) inho33 = (struct UserObject *)inho33->super;
    inho33->super = obj33;
    self = inheritingObject33;
    *selfslot = self;
  }
  struct UserObject *uo35 = (struct UserObject*)obj33;
  uo35->data[1] = emptyclosure;
  Method *meth_meth_Vector2_new35 = addmethod2pos(obj33, "new", &meth_Vector2_new35, 1);
int argcv_meth_Vector2_new35[] = {2};
meth_meth_Vector2_new35->type = alloc_MethodType(1, argcv_meth_Vector2_new35);
meth_meth_Vector2_new35->type->types[0] = type_Number;
meth_meth_Vector2_new35->type->names[0] = "x'";
meth_meth_Vector2_new35->type->types[1] = type_Number;
meth_meth_Vector2_new35->type->names[1] = "y'";
  meth_meth_Vector2_new35->definitionModule = modulename;
  meth_meth_Vector2_new35->definitionLine = 25;
  Method *meth_meth_Vector2_new35_object = addmethod2pos(obj33, "new()object", &meth_Vector2_new35_object, 1);
int argcv_meth_Vector2_new35_object[] = {2};
meth_meth_Vector2_new35_object->type = alloc_MethodType(1, argcv_meth_Vector2_new35_object);
meth_meth_Vector2_new35_object->type->types[0] = type_Number;
meth_meth_Vector2_new35_object->type->names[0] = "x'";
meth_meth_Vector2_new35_object->type->types[1] = type_Number;
meth_meth_Vector2_new35_object->type->names[1] = "y'";
  meth_meth_Vector2_new35_object->definitionModule = modulename;
  meth_meth_Vector2_new35_object->definitionLine = 25;
  sourceObject = obj33;
objclass33 = obj33->class;
  objclass33->definitionModule = modulename;
  objclass33->definitionLine = 25;
  self = oldself33;
  selfslot = oldselfslot33;
  stackframe = oldstackframe33;
// compilenode returning obj33
  *var_Vector2 = obj33;
  if (obj33 == undefined)
    callmethod(done, "assignment", 0, NULL, NULL);
// compilenode returning done
// compilenode returning done
  gc_frame_end(frame);
  return self;
}
