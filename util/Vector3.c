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
static const char modulename[] = "Vector3";
Object module_StandardPrelude_init();
static char *originalSourceLines[] = {
  "//CONSTRUCTOR METHODS",
  "//creates a new zero 3d vector",
  "method zero -> Vector3 {",
  "",
  "    Vector3.new(0, 0, 0)",
  "}",
  "",
  "//creates a new 3d vector and initialises it with the given x, y and z values",
  "method setCoords(x : Number, y : Number, z : Number) -> Vector3 {",
  "",
  "    Vector3.new(x, y, z)",
  "}",
  "",
  "//creates a new 3d vector and initialises it the x and y values of the given",
  "//2d vector's x and y values and sets the z value to zero",
  "method setVector2(v : Vector2) -> Vector3 {",
  "",
  "    Vector3.new(v.x, v.y, 0)",
  "}",
  "",
  "//creates a new 3d vector and initialises it with the values of the given",
  "//3d vector",
  "method setVector3(v : Vector3) -> Vector3 {",
  "",
  "    Vector3.new(v.x, v.y, v.z)",
  "}",
  "",
  "//creates a new 3d vector and initialises the x and y values with the given",
  "//2d vector's x and y values, and initialises the z value with the given z value",
  "method setVector2(v : Vector2)Coords(z : Number) -> Vector3 {",
  "",
  "    Vector3.new(v.x, v.y, z)",
  "}",
  "",
  "//creates a new 3d vector and initialises the x value with the given x value",
  "//and initialises the y and z values with the given 2d vectors x and y values",
  "method setCoords(x : Number)Vector2(v : Vector2) -> Vector3 {",
  "",
  "    Vector3.new(x, v.x, v.y)",
  "}",
  "",
  "//creates a new 3d vector initialised with x: 1, y: 0 z:0",
  "method xAxis -> Vector3 {",
  "",
  "    Vector3.new(1, 0, 0)",
  "}",
  "",
  "//creates a new 3d vector initialised with x: 0, y: 1 z:0",
  "method yAxis -> Vector3 {",
  "",
  "    Vector3.new(0, 1, 0)",
  "}",
  "",
  "//creates a new 3d vector initialised with x: 0, y: 0 z:1",
  "method zAxis -> Vector3 {",
  "",
  "    Vector3.new(0, 0, 1)",
  "}",
  "",
  "//wow",
  "method doge -> Vector3 {",
  "",
  "    Vector3.new(119, 111, 119)",
  "}",
  "",
  "//VECTOR3 CLASS",
  "//constructs a new 3d vector with the given x', y', and z' values",
  "class Vector3.new(x' : Number, y' : Number, z' : Number) {",
  "    ",
  "    var x : Number is public := x'",
  "    var y : Number is public := y'",
  "    var z : Number is public := z'",
  "",
  "    //PUBLIC METHODS",
  "    method asString -> String is public {",
  "",
  "        \"[\" ++ x ++ \", \" ++ y ++ \", \" ++ z ++ \"]\"",
  "    }",
  "}",
  NULL
};
Object reader_Vector3_outer_66(Object self, int nparams, int *argcv, Object* args, int flags) {
  struct UserObject *uo = (struct UserObject*)self;
  return uo->data[0];
}
Object reader_Vector3_outer_69(Object self, int nparams, int *argcv, Object* args, int flags) {
  struct UserObject *uo = (struct UserObject*)self;
  return uo->data[0];
}
Object reader_Vector3_x_70(Object self, int nparams, int *argcv, Object* args, int flags) {
  struct UserObject *uo = (struct UserObject *)self;
  return uo->data[1];
}
Object writer_Vector3_x_70(Object self, int nparams, int *argcv, Object* args, int flags) {
  struct UserObject *uo = (struct UserObject *)self;
  uo->data[1] = args[0];
  return done;
}
Object reader_Vector3_y_71(Object self, int nparams, int *argcv, Object* args, int flags) {
  struct UserObject *uo = (struct UserObject *)self;
  return uo->data[2];
}
Object writer_Vector3_y_71(Object self, int nparams, int *argcv, Object* args, int flags) {
  struct UserObject *uo = (struct UserObject *)self;
  uo->data[2] = args[0];
  return done;
}
Object reader_Vector3_z_72(Object self, int nparams, int *argcv, Object* args, int flags) {
  struct UserObject *uo = (struct UserObject *)self;
  return uo->data[3];
}
Object writer_Vector3_z_72(Object self, int nparams, int *argcv, Object* args, int flags) {
  struct UserObject *uo = (struct UserObject *)self;
  uo->data[3] = args[0];
  return done;
}
static ClassData objclass65;
static ClassData objclass68;
static Object strlit80;
static Object strlit85;
static Object strlit92;
static Object strlit99;
Object meth_Vector3_zero0(Object self, int nparts, int *argcv, Object *args, int32_t flags) {
  struct UserObject *uo = (struct UserObject*)self;
  Object closure = getdatum((Object)uo, 1, (flags>>24)&0xff);
  struct StackFrameObject *stackframe = alloc_StackFrame(1, getclosureframe(closure));
  pushclosure(closure);
  pushstackframe(stackframe, "zero");
  int frame = gc_frame_new();
  gc_frame_newslot((Object)stackframe);
  Object methodInheritingObject = NULL;
  Object params[3];
  int partcv[1];
  Object *var_Vector3 = getfromclosure(closure, 0);
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
  Object num4 = alloc_Float64(0);
// compilenode returning num4
  gc_frame_newslot(num4);
// compilenode returning *var_Vector3
  params[0] = num2;
  params[1] = num3;
  params[2] = num4;
  partcv[0] = 3;
  Object call5 = callmethod(*var_Vector3, "new",
    1, partcv, params);
  gc_frame_end(callframe1);
// compilenode returning call5
  gc_frame_end(frame);
  return call5;
}
Object meth_Vector3_setCoords6(Object self, int nparts, int *argcv, Object *args, int32_t flags) {
  struct UserObject *uo = (struct UserObject*)self;
  Object closure = getdatum((Object)uo, 2, (flags>>24)&0xff);
  struct StackFrameObject *stackframe = alloc_StackFrame(4, getclosureframe(closure));
  pushclosure(closure);
  pushstackframe(stackframe, "setCoords");
  int frame = gc_frame_new();
  gc_frame_newslot((Object)stackframe);
  Object methodInheritingObject = NULL;
  if (nparts > 0 && argcv[0] < 3)
    gracedie("insufficient arguments to method");
  Object params[3];
  int partcv[1];
  Object *var_Vector3 = getfromclosure(closure, 0);
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
  Object *var_z = &(stackframe->slots[2]);
  *var_z = args[curarg];
  curarg++;
if (argcv && argcv[0] > 3)
  gracedie("too many arguments for setCoords");
  Object *selfslot = &(stackframe->slots[3]);
  *selfslot = self;
  setframeelementname(stackframe, 0, "self");
  if (methodInheritingObject) curarg++;
// Begin line 12
  setline(12);
  setmodule(modulename);
  setsource(originalSourceLines);
  int callframe7 = gc_frame_new();
// Begin line 11
  setline(11);
  setmodule(modulename);
  setsource(originalSourceLines);
// compilenode returning *var_x
  gc_frame_newslot(*var_x);
// compilenode returning *var_y
  gc_frame_newslot(*var_y);
// compilenode returning *var_z
  gc_frame_newslot(*var_z);
// compilenode returning *var_Vector3
  params[0] = *var_x;
  params[1] = *var_y;
  params[2] = *var_z;
  partcv[0] = 3;
  Object call8 = callmethod(*var_Vector3, "new",
    1, partcv, params);
  gc_frame_end(callframe7);
// compilenode returning call8
  gc_frame_end(frame);
  return call8;
}
Object meth_Vector3_setVector29(Object self, int nparts, int *argcv, Object *args, int32_t flags) {
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
  Object params[3];
  int partcv[1];
  Object *var_Vector3 = getfromclosure(closure, 0);
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
  int callframe10 = gc_frame_new();
// Begin line 18
  setline(18);
  setmodule(modulename);
  setsource(originalSourceLines);
  int callframe11 = gc_frame_new();
// compilenode returning *var_v
  partcv[0] = 0;
  Object call12 = callmethod(*var_v, "x",
    1, partcv, params);
  gc_frame_end(callframe11);
// compilenode returning call12
// compilenode returning call12
  gc_frame_newslot(call12);
  int callframe13 = gc_frame_new();
// compilenode returning *var_v
  partcv[0] = 0;
  Object call14 = callmethod(*var_v, "y",
    1, partcv, params);
  gc_frame_end(callframe13);
// compilenode returning call14
// compilenode returning call14
  gc_frame_newslot(call14);
  Object num15 = alloc_Float64(0);
// compilenode returning num15
  gc_frame_newslot(num15);
// compilenode returning *var_Vector3
  params[0] = call12;
  params[1] = call14;
  params[2] = num15;
  partcv[0] = 3;
  Object call16 = callmethod(*var_Vector3, "new",
    1, partcv, params);
  gc_frame_end(callframe10);
// compilenode returning call16
  gc_frame_end(frame);
  return call16;
}
Object meth_Vector3_setVector317(Object self, int nparts, int *argcv, Object *args, int32_t flags) {
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
  Object params[3];
  int partcv[1];
  Object *var_Vector3 = getfromclosure(closure, 0);
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
  int callframe18 = gc_frame_new();
// Begin line 25
  setline(25);
  setmodule(modulename);
  setsource(originalSourceLines);
  int callframe19 = gc_frame_new();
// compilenode returning *var_v
  partcv[0] = 0;
  Object call20 = callmethod(*var_v, "x",
    1, partcv, params);
  gc_frame_end(callframe19);
// compilenode returning call20
// compilenode returning call20
  gc_frame_newslot(call20);
  int callframe21 = gc_frame_new();
// compilenode returning *var_v
  partcv[0] = 0;
  Object call22 = callmethod(*var_v, "y",
    1, partcv, params);
  gc_frame_end(callframe21);
// compilenode returning call22
// compilenode returning call22
  gc_frame_newslot(call22);
  int callframe23 = gc_frame_new();
// compilenode returning *var_v
  partcv[0] = 0;
  Object call24 = callmethod(*var_v, "z",
    1, partcv, params);
  gc_frame_end(callframe23);
// compilenode returning call24
// compilenode returning call24
  gc_frame_newslot(call24);
// compilenode returning *var_Vector3
  params[0] = call20;
  params[1] = call22;
  params[2] = call24;
  partcv[0] = 3;
  Object call25 = callmethod(*var_Vector3, "new",
    1, partcv, params);
  gc_frame_end(callframe18);
// compilenode returning call25
  gc_frame_end(frame);
  return call25;
}
Object meth_Vector3_setVector2_40__41_Coords26(Object self, int nparts, int *argcv, Object *args, int32_t flags) {
  struct UserObject *uo = (struct UserObject*)self;
  Object closure = getdatum((Object)uo, 5, (flags>>24)&0xff);
  struct StackFrameObject *stackframe = alloc_StackFrame(3, getclosureframe(closure));
  pushclosure(closure);
  pushstackframe(stackframe, "setVector2()Coords");
  int frame = gc_frame_new();
  gc_frame_newslot((Object)stackframe);
  Object methodInheritingObject = NULL;
  if (nparts > 0 && argcv[0] < 1)
    gracedie("insufficient arguments to method");
  if (nparts > 0 && argcv[1] < 1)
    gracedie("insufficient arguments to method");
  Object params[3];
  int partcv[1];
  Object *var_Vector3 = getfromclosure(closure, 0);
  int i;
  int curarg = 0;
  int pushcv[] = {1};
  if (nparts < 2 && args)
    gracedie("missing argument list for setVector2()Coords (probably reflection error): got %i lists, expected 2.", nparts);
  Object *var_v = &(stackframe->slots[0]);
  *var_v = args[curarg];
  curarg++;
if (argcv && argcv[0] > 1)
  gracedie("too many arguments for setVector2");
  Object *var_z = &(stackframe->slots[1]);
  *var_z = args[curarg];
  curarg++;
if (argcv && argcv[1] > 1)
  gracedie("too many arguments for Coords");
  Object *selfslot = &(stackframe->slots[2]);
  *selfslot = self;
  setframeelementname(stackframe, 0, "self");
  if (methodInheritingObject) curarg++;
// Begin line 33
  setline(33);
  setmodule(modulename);
  setsource(originalSourceLines);
  int callframe27 = gc_frame_new();
// Begin line 32
  setline(32);
  setmodule(modulename);
  setsource(originalSourceLines);
  int callframe28 = gc_frame_new();
// compilenode returning *var_v
  partcv[0] = 0;
  Object call29 = callmethod(*var_v, "x",
    1, partcv, params);
  gc_frame_end(callframe28);
// compilenode returning call29
// compilenode returning call29
  gc_frame_newslot(call29);
  int callframe30 = gc_frame_new();
// compilenode returning *var_v
  partcv[0] = 0;
  Object call31 = callmethod(*var_v, "y",
    1, partcv, params);
  gc_frame_end(callframe30);
// compilenode returning call31
// compilenode returning call31
  gc_frame_newslot(call31);
// compilenode returning *var_z
  gc_frame_newslot(*var_z);
// compilenode returning *var_Vector3
  params[0] = call29;
  params[1] = call31;
  params[2] = *var_z;
  partcv[0] = 3;
  Object call32 = callmethod(*var_Vector3, "new",
    1, partcv, params);
  gc_frame_end(callframe27);
// compilenode returning call32
  gc_frame_end(frame);
  return call32;
}
Object meth_Vector3_setCoords_40__41_Vector233(Object self, int nparts, int *argcv, Object *args, int32_t flags) {
  struct UserObject *uo = (struct UserObject*)self;
  Object closure = getdatum((Object)uo, 6, (flags>>24)&0xff);
  struct StackFrameObject *stackframe = alloc_StackFrame(3, getclosureframe(closure));
  pushclosure(closure);
  pushstackframe(stackframe, "setCoords()Vector2");
  int frame = gc_frame_new();
  gc_frame_newslot((Object)stackframe);
  Object methodInheritingObject = NULL;
  if (nparts > 0 && argcv[0] < 1)
    gracedie("insufficient arguments to method");
  if (nparts > 0 && argcv[1] < 1)
    gracedie("insufficient arguments to method");
  Object params[3];
  int partcv[1];
  Object *var_Vector3 = getfromclosure(closure, 0);
  int i;
  int curarg = 0;
  int pushcv[] = {1};
  if (nparts < 2 && args)
    gracedie("missing argument list for setCoords()Vector2 (probably reflection error): got %i lists, expected 2.", nparts);
  Object *var_x = &(stackframe->slots[0]);
  *var_x = args[curarg];
  curarg++;
if (argcv && argcv[0] > 1)
  gracedie("too many arguments for setCoords");
  Object *var_v = &(stackframe->slots[1]);
  *var_v = args[curarg];
  curarg++;
if (argcv && argcv[1] > 1)
  gracedie("too many arguments for Vector2");
  Object *selfslot = &(stackframe->slots[2]);
  *selfslot = self;
  setframeelementname(stackframe, 0, "self");
  if (methodInheritingObject) curarg++;
// Begin line 40
  setline(40);
  setmodule(modulename);
  setsource(originalSourceLines);
  int callframe34 = gc_frame_new();
// Begin line 39
  setline(39);
  setmodule(modulename);
  setsource(originalSourceLines);
// compilenode returning *var_x
  gc_frame_newslot(*var_x);
  int callframe35 = gc_frame_new();
// compilenode returning *var_v
  partcv[0] = 0;
  Object call36 = callmethod(*var_v, "x",
    1, partcv, params);
  gc_frame_end(callframe35);
// compilenode returning call36
// compilenode returning call36
  gc_frame_newslot(call36);
  int callframe37 = gc_frame_new();
// compilenode returning *var_v
  partcv[0] = 0;
  Object call38 = callmethod(*var_v, "y",
    1, partcv, params);
  gc_frame_end(callframe37);
// compilenode returning call38
// compilenode returning call38
  gc_frame_newslot(call38);
// compilenode returning *var_Vector3
  params[0] = *var_x;
  params[1] = call36;
  params[2] = call38;
  partcv[0] = 3;
  Object call39 = callmethod(*var_Vector3, "new",
    1, partcv, params);
  gc_frame_end(callframe34);
// compilenode returning call39
  gc_frame_end(frame);
  return call39;
}
Object meth_Vector3_xAxis40(Object self, int nparts, int *argcv, Object *args, int32_t flags) {
  struct UserObject *uo = (struct UserObject*)self;
  Object closure = getdatum((Object)uo, 7, (flags>>24)&0xff);
  struct StackFrameObject *stackframe = alloc_StackFrame(1, getclosureframe(closure));
  pushclosure(closure);
  pushstackframe(stackframe, "xAxis");
  int frame = gc_frame_new();
  gc_frame_newslot((Object)stackframe);
  Object methodInheritingObject = NULL;
  Object params[3];
  int partcv[1];
  Object *var_Vector3 = getfromclosure(closure, 0);
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
// Begin line 46
  setline(46);
  setmodule(modulename);
  setsource(originalSourceLines);
  int callframe41 = gc_frame_new();
// Begin line 45
  setline(45);
  setmodule(modulename);
  setsource(originalSourceLines);
  Object num42 = alloc_Float64(1);
// compilenode returning num42
  gc_frame_newslot(num42);
  Object num43 = alloc_Float64(0);
// compilenode returning num43
  gc_frame_newslot(num43);
  Object num44 = alloc_Float64(0);
// compilenode returning num44
  gc_frame_newslot(num44);
// compilenode returning *var_Vector3
  params[0] = num42;
  params[1] = num43;
  params[2] = num44;
  partcv[0] = 3;
  Object call45 = callmethod(*var_Vector3, "new",
    1, partcv, params);
  gc_frame_end(callframe41);
// compilenode returning call45
  gc_frame_end(frame);
  return call45;
}
Object meth_Vector3_yAxis46(Object self, int nparts, int *argcv, Object *args, int32_t flags) {
  struct UserObject *uo = (struct UserObject*)self;
  Object closure = getdatum((Object)uo, 8, (flags>>24)&0xff);
  struct StackFrameObject *stackframe = alloc_StackFrame(1, getclosureframe(closure));
  pushclosure(closure);
  pushstackframe(stackframe, "yAxis");
  int frame = gc_frame_new();
  gc_frame_newslot((Object)stackframe);
  Object methodInheritingObject = NULL;
  Object params[3];
  int partcv[1];
  Object *var_Vector3 = getfromclosure(closure, 0);
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
// Begin line 52
  setline(52);
  setmodule(modulename);
  setsource(originalSourceLines);
  int callframe47 = gc_frame_new();
// Begin line 51
  setline(51);
  setmodule(modulename);
  setsource(originalSourceLines);
  Object num48 = alloc_Float64(0);
// compilenode returning num48
  gc_frame_newslot(num48);
  Object num49 = alloc_Float64(1);
// compilenode returning num49
  gc_frame_newslot(num49);
  Object num50 = alloc_Float64(0);
// compilenode returning num50
  gc_frame_newslot(num50);
// compilenode returning *var_Vector3
  params[0] = num48;
  params[1] = num49;
  params[2] = num50;
  partcv[0] = 3;
  Object call51 = callmethod(*var_Vector3, "new",
    1, partcv, params);
  gc_frame_end(callframe47);
// compilenode returning call51
  gc_frame_end(frame);
  return call51;
}
Object meth_Vector3_zAxis52(Object self, int nparts, int *argcv, Object *args, int32_t flags) {
  struct UserObject *uo = (struct UserObject*)self;
  Object closure = getdatum((Object)uo, 9, (flags>>24)&0xff);
  struct StackFrameObject *stackframe = alloc_StackFrame(1, getclosureframe(closure));
  pushclosure(closure);
  pushstackframe(stackframe, "zAxis");
  int frame = gc_frame_new();
  gc_frame_newslot((Object)stackframe);
  Object methodInheritingObject = NULL;
  Object params[3];
  int partcv[1];
  Object *var_Vector3 = getfromclosure(closure, 0);
  int i;
  int curarg = 0;
  int pushcv[] = {1};
  if (nparts < 1 && args)
    gracedie("missing argument list for zAxis (probably reflection error): got %i lists, expected 1.", nparts);
if (argcv && argcv[0] > 0)
  gracedie("too many arguments for zAxis");
  Object *selfslot = &(stackframe->slots[0]);
  *selfslot = self;
  setframeelementname(stackframe, 0, "self");
  if (methodInheritingObject) curarg++;
// Begin line 58
  setline(58);
  setmodule(modulename);
  setsource(originalSourceLines);
  int callframe53 = gc_frame_new();
// Begin line 57
  setline(57);
  setmodule(modulename);
  setsource(originalSourceLines);
  Object num54 = alloc_Float64(0);
// compilenode returning num54
  gc_frame_newslot(num54);
  Object num55 = alloc_Float64(0);
// compilenode returning num55
  gc_frame_newslot(num55);
  Object num56 = alloc_Float64(1);
// compilenode returning num56
  gc_frame_newslot(num56);
// compilenode returning *var_Vector3
  params[0] = num54;
  params[1] = num55;
  params[2] = num56;
  partcv[0] = 3;
  Object call57 = callmethod(*var_Vector3, "new",
    1, partcv, params);
  gc_frame_end(callframe53);
// compilenode returning call57
  gc_frame_end(frame);
  return call57;
}
Object meth_Vector3_doge58(Object self, int nparts, int *argcv, Object *args, int32_t flags) {
  struct UserObject *uo = (struct UserObject*)self;
  Object closure = getdatum((Object)uo, 10, (flags>>24)&0xff);
  struct StackFrameObject *stackframe = alloc_StackFrame(1, getclosureframe(closure));
  pushclosure(closure);
  pushstackframe(stackframe, "doge");
  int frame = gc_frame_new();
  gc_frame_newslot((Object)stackframe);
  Object methodInheritingObject = NULL;
  Object params[3];
  int partcv[1];
  Object *var_Vector3 = getfromclosure(closure, 0);
  int i;
  int curarg = 0;
  int pushcv[] = {1};
  if (nparts < 1 && args)
    gracedie("missing argument list for doge (probably reflection error): got %i lists, expected 1.", nparts);
if (argcv && argcv[0] > 0)
  gracedie("too many arguments for doge");
  Object *selfslot = &(stackframe->slots[0]);
  *selfslot = self;
  setframeelementname(stackframe, 0, "self");
  if (methodInheritingObject) curarg++;
// Begin line 64
  setline(64);
  setmodule(modulename);
  setsource(originalSourceLines);
  int callframe59 = gc_frame_new();
// Begin line 63
  setline(63);
  setmodule(modulename);
  setsource(originalSourceLines);
  Object num60 = alloc_Float64(119);
// compilenode returning num60
  gc_frame_newslot(num60);
  Object num61 = alloc_Float64(111);
// compilenode returning num61
  gc_frame_newslot(num61);
  Object num62 = alloc_Float64(119);
// compilenode returning num62
  gc_frame_newslot(num62);
// compilenode returning *var_Vector3
  params[0] = num60;
  params[1] = num61;
  params[2] = num62;
  partcv[0] = 3;
  Object call63 = callmethod(*var_Vector3, "new",
    1, partcv, params);
  gc_frame_end(callframe59);
// compilenode returning call63
  gc_frame_end(frame);
  return call63;
}
Object meth_Vector3_Vector364(Object self, int nparts, int *argcv, Object *args, int32_t flags) {
  struct UserObject *uo = (struct UserObject*)self;
  Object closure = getdatum((Object)uo, 11, (flags>>24)&0xff);
  struct StackFrameObject *stackframe = alloc_StackFrame(1, getclosureframe(closure));
  pushclosure(closure);
  pushstackframe(stackframe, "Vector3");
  int frame = gc_frame_new();
  gc_frame_newslot((Object)stackframe);
  Object methodInheritingObject = NULL;
  Object params[1];
  int partcv[1];
  Object *var_Vector3 = getfromclosure(closure, 0);
  int i;
  int curarg = 0;
  int pushcv[] = {1};
  if (nparts < 1 && args)
    gracedie("missing argument list for Vector3 (probably reflection error): got %i lists, expected 1.", nparts);
if (argcv && argcv[0] > 0)
  gracedie("too many arguments for Vector3");
  Object *selfslot = &(stackframe->slots[0]);
  *selfslot = self;
  setframeelementname(stackframe, 0, "self");
  if (methodInheritingObject) curarg++;
// Begin line 68
  setline(68);
  setmodule(modulename);
  setsource(originalSourceLines);
// compilenode returning *var_Vector3
  gc_frame_end(frame);
  return *var_Vector3;
}
Object meth_Vector3_asString73(Object self, int nparts, int *argcv, Object *args, int32_t flags) {
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
// Begin line 78
  setline(78);
  setmodule(modulename);
  setsource(originalSourceLines);
// Begin line 77
  setline(77);
  setmodule(modulename);
  setsource(originalSourceLines);
  if (strlit80 == NULL) {
    strlit80 = alloc_String("[");
    gc_root(strlit80);
  }
// compilenode returning strlit80
  int op_slot_left_79 = gc_frame_newslot(strlit80);
  int callframe81 = gc_frame_new();
  partcv[0] = 0;
  Object call82 = callmethodflags(self, "x", 1, partcv, params, CFLAG_SELF);
  gc_frame_end(callframe81);
// compilenode returning call82
  int op_slot_right_79 = gc_frame_newslot(call82);
  params[0] = call82;
  partcv[0] = 1;
  Object opresult84 = callmethod(strlit80, "++", 1, partcv, params);
// compilenode returning opresult84
  int op_slot_left_78 = gc_frame_newslot(opresult84);
  if (strlit85 == NULL) {
    strlit85 = alloc_String(", ");
    gc_root(strlit85);
  }
// compilenode returning strlit85
  int op_slot_right_78 = gc_frame_newslot(strlit85);
  params[0] = strlit85;
  partcv[0] = 1;
  Object opresult87 = callmethod(opresult84, "++", 1, partcv, params);
// compilenode returning opresult87
  int op_slot_left_77 = gc_frame_newslot(opresult87);
  int callframe88 = gc_frame_new();
  partcv[0] = 0;
  Object call89 = callmethodflags(self, "y", 1, partcv, params, CFLAG_SELF);
  gc_frame_end(callframe88);
// compilenode returning call89
  int op_slot_right_77 = gc_frame_newslot(call89);
  params[0] = call89;
  partcv[0] = 1;
  Object opresult91 = callmethod(opresult87, "++", 1, partcv, params);
// compilenode returning opresult91
  int op_slot_left_76 = gc_frame_newslot(opresult91);
  if (strlit92 == NULL) {
    strlit92 = alloc_String(", ");
    gc_root(strlit92);
  }
// compilenode returning strlit92
  int op_slot_right_76 = gc_frame_newslot(strlit92);
  params[0] = strlit92;
  partcv[0] = 1;
  Object opresult94 = callmethod(opresult91, "++", 1, partcv, params);
// compilenode returning opresult94
  int op_slot_left_75 = gc_frame_newslot(opresult94);
  int callframe95 = gc_frame_new();
  partcv[0] = 0;
  Object call96 = callmethodflags(self, "z", 1, partcv, params, CFLAG_SELF);
  gc_frame_end(callframe95);
// compilenode returning call96
  int op_slot_right_75 = gc_frame_newslot(call96);
  params[0] = call96;
  partcv[0] = 1;
  Object opresult98 = callmethod(opresult94, "++", 1, partcv, params);
// compilenode returning opresult98
  int op_slot_left_74 = gc_frame_newslot(opresult98);
  if (strlit99 == NULL) {
    strlit99 = alloc_String("]");
    gc_root(strlit99);
  }
// compilenode returning strlit99
  int op_slot_right_74 = gc_frame_newslot(strlit99);
  params[0] = strlit99;
  partcv[0] = 1;
  Object opresult101 = callmethod(opresult98, "++", 1, partcv, params);
// compilenode returning opresult101
  gc_frame_end(frame);
  return opresult101;
}
Object meth_Vector3_new67(Object self, int nparts, int *argcv, Object *args, int32_t flags) {
  struct StackFrameObject *stackframe = alloc_StackFrame(4, NULL);
  pushclosure(NULL);
  pushstackframe(stackframe, "new");
  int frame = gc_frame_new();
  gc_frame_newslot((Object)stackframe);
  Object methodInheritingObject = NULL;
  if (nparts > 0 && argcv[0] < 3)
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
  Object *var_z_39_ = &(stackframe->slots[2]);
  *var_z_39_ = args[curarg];
  curarg++;
if (argcv && argcv[0] > 3)
  gracedie("too many arguments for new");
  Object *selfslot = &(stackframe->slots[3]);
  *selfslot = self;
  setframeelementname(stackframe, 0, "self");
  if (methodInheritingObject) curarg++;
  isTailObject = 1;
  inheritingObject = methodInheritingObject;
  Object inheritingObject68 = inheritingObject;
  if (isTailObject) {
    isTailObject = 0;
    inheritingObject = NULL;
  }
  Object obj68 = alloc_userobj2(7,5, objclass68);
  gc_frame_newslot(obj68);
if (objclass68 == NULL) {
  glfree(obj68->class->name);
  obj68->class->name = "Vector3";
}
// OBJECT OUTER DEC outer
  adddatum2(obj68, self, 0);
  addmethodreal(obj68,"outer", &reader_Vector3_outer_69);
  Object oldself68 = self;
  struct StackFrameObject *oldstackframe68 = stackframe;
  stackframe = alloc_StackFrame(1, oldstackframe68);
  gc_frame_newslot((Object)stackframe);
  self = obj68;
  Object *oldselfslot68 = selfslot;
  selfslot = &stackframe->slots[0];
  *selfslot = self;
  setframeelementname(stackframe, 0, "self");
  if (inheritingObject68) {
    struct UserObject *inho68 = (struct UserObject *)inheritingObject68;
    while (inho68->super != GraceDefaultObject) inho68 = (struct UserObject *)inho68->super;
    inho68->super = obj68;
    self = inheritingObject68;
    *selfslot = self;
  }
if (objclass68 == NULL) {
  Method *reader70 = addmethodrealflags(obj68, "x",&reader_Vector3_x_70, 0);
  Method *writer70 = addmethodrealflags(obj68, "x:=",&writer_Vector3_x_70, 0);
  reader70->definitionModule = modulename;
  writer70->definitionModule = modulename;
  reader70->definitionLine = 71;
  writer70->definitionLine = 71;
}
obj68->flags |= OFLAG_MUTABLE;
adddatum2(obj68, alloc_Undefined(), 1);
if (objclass68 == NULL) {
  Method *reader71 = addmethodrealflags(obj68, "y",&reader_Vector3_y_71, 0);
  Method *writer71 = addmethodrealflags(obj68, "y:=",&writer_Vector3_y_71, 0);
  reader71->definitionModule = modulename;
  writer71->definitionModule = modulename;
  reader71->definitionLine = 72;
  writer71->definitionLine = 72;
}
obj68->flags |= OFLAG_MUTABLE;
adddatum2(obj68, alloc_Undefined(), 2);
if (objclass68 == NULL) {
  Method *reader72 = addmethodrealflags(obj68, "z",&reader_Vector3_z_72, 0);
  Method *writer72 = addmethodrealflags(obj68, "z:=",&writer_Vector3_z_72, 0);
  reader72->definitionModule = modulename;
  writer72->definitionModule = modulename;
  reader72->definitionLine = 75;
  writer72->definitionLine = 75;
}
obj68->flags |= OFLAG_MUTABLE;
adddatum2(obj68, alloc_Undefined(), 3);
  struct UserObject *uo73 = (struct UserObject*)obj68;
  uo73->data[4] = emptyclosure;
  Method *meth_meth_Vector3_asString73 = addmethod2pos(obj68, "asString", &meth_Vector3_asString73, 4);
int argcv_meth_Vector3_asString73[] = {0};
meth_meth_Vector3_asString73->type = alloc_MethodType(1, argcv_meth_Vector3_asString73);
  meth_meth_Vector3_asString73->definitionModule = modulename;
  meth_meth_Vector3_asString73->definitionLine = 75;
  sourceObject = obj68;
// Begin line 70
  setline(70);
  setmodule(modulename);
  setsource(originalSourceLines);
// compilenode returning *var_x_39_
  adddatum2(obj68, *var_x_39_, 1);
  sourceObject = obj68;
// Begin line 71
  setline(71);
  setmodule(modulename);
  setsource(originalSourceLines);
// compilenode returning *var_y_39_
  adddatum2(obj68, *var_y_39_, 2);
  sourceObject = obj68;
// Begin line 72
  setline(72);
  setmodule(modulename);
  setsource(originalSourceLines);
// compilenode returning *var_z_39_
  adddatum2(obj68, *var_z_39_, 3);
  sourceObject = obj68;
objclass68 = obj68->class;
  objclass68->definitionModule = modulename;
  objclass68->definitionLine = 39;
  self = oldself68;
  selfslot = oldselfslot68;
  stackframe = oldstackframe68;
  gc_frame_end(frame);
  return obj68;
}
Object meth_Vector3_new67_object(Object self, int nparts, int *argcv, Object *args, int32_t flags) {
  struct StackFrameObject *stackframe = alloc_StackFrame(4, NULL);
  pushclosure(NULL);
  pushstackframe(stackframe, "new()object");
  int frame = gc_frame_new();
  gc_frame_newslot((Object)stackframe);
  Object methodInheritingObject = args[0 + argcv[0]];
  if (nparts > 0 && argcv[0] < 3)
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
  Object *var_z_39_ = &(stackframe->slots[2]);
  *var_z_39_ = args[curarg];
  curarg++;
if (argcv && argcv[0] > 3)
  gracedie("too many arguments for new");
  Object *selfslot = &(stackframe->slots[3]);
  *selfslot = self;
  setframeelementname(stackframe, 0, "self");
  if (methodInheritingObject) curarg++;
  isTailObject = 1;
  inheritingObject = methodInheritingObject;
  Object inheritingObject68 = inheritingObject;
  if (isTailObject) {
    isTailObject = 0;
    inheritingObject = NULL;
  }
  Object obj68 = alloc_userobj2(7,5, objclass68);
  gc_frame_newslot(obj68);
if (objclass68 == NULL) {
  glfree(obj68->class->name);
  obj68->class->name = "Vector3";
}
// OBJECT OUTER DEC outer
  adddatum2(obj68, self, 0);
  addmethodreal(obj68,"outer", &reader_Vector3_outer_69);
  Object oldself68 = self;
  struct StackFrameObject *oldstackframe68 = stackframe;
  stackframe = alloc_StackFrame(1, oldstackframe68);
  gc_frame_newslot((Object)stackframe);
  self = obj68;
  Object *oldselfslot68 = selfslot;
  selfslot = &stackframe->slots[0];
  *selfslot = self;
  setframeelementname(stackframe, 0, "self");
  if (inheritingObject68) {
    struct UserObject *inho68 = (struct UserObject *)inheritingObject68;
    while (inho68->super != GraceDefaultObject) inho68 = (struct UserObject *)inho68->super;
    inho68->super = obj68;
    self = inheritingObject68;
    *selfslot = self;
  }
if (objclass68 == NULL) {
  Method *reader70 = addmethodrealflags(obj68, "x",&reader_Vector3_x_70, 0);
  Method *writer70 = addmethodrealflags(obj68, "x:=",&writer_Vector3_x_70, 0);
  reader70->definitionModule = modulename;
  writer70->definitionModule = modulename;
  reader70->definitionLine = 71;
  writer70->definitionLine = 71;
}
obj68->flags |= OFLAG_MUTABLE;
adddatum2(obj68, alloc_Undefined(), 1);
if (objclass68 == NULL) {
  Method *reader71 = addmethodrealflags(obj68, "y",&reader_Vector3_y_71, 0);
  Method *writer71 = addmethodrealflags(obj68, "y:=",&writer_Vector3_y_71, 0);
  reader71->definitionModule = modulename;
  writer71->definitionModule = modulename;
  reader71->definitionLine = 72;
  writer71->definitionLine = 72;
}
obj68->flags |= OFLAG_MUTABLE;
adddatum2(obj68, alloc_Undefined(), 2);
if (objclass68 == NULL) {
  Method *reader72 = addmethodrealflags(obj68, "z",&reader_Vector3_z_72, 0);
  Method *writer72 = addmethodrealflags(obj68, "z:=",&writer_Vector3_z_72, 0);
  reader72->definitionModule = modulename;
  writer72->definitionModule = modulename;
  reader72->definitionLine = 75;
  writer72->definitionLine = 75;
}
obj68->flags |= OFLAG_MUTABLE;
adddatum2(obj68, alloc_Undefined(), 3);
  struct UserObject *uo73 = (struct UserObject*)obj68;
  uo73->data[4] = emptyclosure;
  Method *meth_meth_Vector3_asString73 = addmethod2pos(obj68, "asString", &meth_Vector3_asString73, 4);
int argcv_meth_Vector3_asString73[] = {0};
meth_meth_Vector3_asString73->type = alloc_MethodType(1, argcv_meth_Vector3_asString73);
  meth_meth_Vector3_asString73->definitionModule = modulename;
  meth_meth_Vector3_asString73->definitionLine = 75;
  sourceObject = obj68;
// Begin line 70
  setline(70);
  setmodule(modulename);
  setsource(originalSourceLines);
// compilenode returning *var_x_39_
  adddatum2(obj68, *var_x_39_, 1);
  sourceObject = obj68;
// Begin line 71
  setline(71);
  setmodule(modulename);
  setsource(originalSourceLines);
// compilenode returning *var_y_39_
  adddatum2(obj68, *var_y_39_, 2);
  sourceObject = obj68;
// Begin line 72
  setline(72);
  setmodule(modulename);
  setsource(originalSourceLines);
// compilenode returning *var_z_39_
  adddatum2(obj68, *var_z_39_, 3);
  sourceObject = obj68;
objclass68 = obj68->class;
  objclass68->definitionModule = modulename;
  objclass68->definitionLine = 39;
  self = oldself68;
  selfslot = oldselfslot68;
  stackframe = oldstackframe68;
  gc_frame_end(frame);
  return obj68;
}
Object module_Vector3_init() {
  int flags = 0;
  int frame = gc_frame_new();
  Object self = alloc_obj2(13, 13);
  gc_root(self);
  prelude = module_StandardPrelude_init();
  adddatum2(self, prelude, 0);
  addmethod2(self, "outer", &grace_userobj_outer);
  setline(1);
  setmodule(modulename);
  setsource(originalSourceLines);
  setclassname(self, "Module<Vector3>");
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
  struct StackFrameObject *stackframe = alloc_StackFrame(13, NULL);
  gc_root((Object)stackframe);
  pushstackframe(stackframe, "module scope");
  Object *selfslot = &(stackframe->slots[0]);
  *selfslot = self;
  setframeelementname(stackframe, 0, "self");
  Object params[1];
  int partcv[1];
  Object *var_Vector3 = &(stackframe->slots[1]);
  setframeelementname(stackframe, 1, "Vector3");
// Begin line 3
  setline(3);
  setmodule(modulename);
  setsource(originalSourceLines);
  block_savedest(self);
  Object closure0 = createclosure(1, "zero");
setclosureframe(closure0, stackframe);
  addtoclosure(closure0, var_Vector3);
  struct UserObject *uo0 = (struct UserObject*)self;
  uo0->data[1] = (Object)closure0;
  Method *meth_meth_Vector3_zero0 = addmethod2pos(self, "zero", &meth_Vector3_zero0, 1);
int argcv_meth_Vector3_zero0[] = {0};
meth_meth_Vector3_zero0->type = alloc_MethodType(1, argcv_meth_Vector3_zero0);
  meth_meth_Vector3_zero0->definitionModule = modulename;
  meth_meth_Vector3_zero0->definitionLine = 3;
// compilenode returning 
// Begin line 9
  setline(9);
  setmodule(modulename);
  setsource(originalSourceLines);
  block_savedest(self);
  Object closure6 = createclosure(1, "setCoords");
setclosureframe(closure6, stackframe);
  addtoclosure(closure6, var_Vector3);
  struct UserObject *uo6 = (struct UserObject*)self;
  uo6->data[2] = (Object)closure6;
  Method *meth_meth_Vector3_setCoords6 = addmethod2pos(self, "setCoords", &meth_Vector3_setCoords6, 2);
int argcv_meth_Vector3_setCoords6[] = {3};
meth_meth_Vector3_setCoords6->type = alloc_MethodType(1, argcv_meth_Vector3_setCoords6);
meth_meth_Vector3_setCoords6->type->types[0] = type_Number;
meth_meth_Vector3_setCoords6->type->names[0] = "x";
meth_meth_Vector3_setCoords6->type->types[1] = type_Number;
meth_meth_Vector3_setCoords6->type->names[1] = "y";
meth_meth_Vector3_setCoords6->type->types[2] = type_Number;
meth_meth_Vector3_setCoords6->type->names[2] = "z";
  meth_meth_Vector3_setCoords6->definitionModule = modulename;
  meth_meth_Vector3_setCoords6->definitionLine = 9;
// compilenode returning 
// Begin line 16
  setline(16);
  setmodule(modulename);
  setsource(originalSourceLines);
  block_savedest(self);
  Object closure9 = createclosure(1, "setVector2");
setclosureframe(closure9, stackframe);
  addtoclosure(closure9, var_Vector3);
  struct UserObject *uo9 = (struct UserObject*)self;
  uo9->data[3] = (Object)closure9;
  Method *meth_meth_Vector3_setVector29 = addmethod2pos(self, "setVector2", &meth_Vector3_setVector29, 3);
int argcv_meth_Vector3_setVector29[] = {1};
meth_meth_Vector3_setVector29->type = alloc_MethodType(1, argcv_meth_Vector3_setVector29);
  meth_meth_Vector3_setVector29->definitionModule = modulename;
  meth_meth_Vector3_setVector29->definitionLine = 16;
// compilenode returning 
// Begin line 23
  setline(23);
  setmodule(modulename);
  setsource(originalSourceLines);
  block_savedest(self);
  Object closure17 = createclosure(1, "setVector3");
setclosureframe(closure17, stackframe);
  addtoclosure(closure17, var_Vector3);
  struct UserObject *uo17 = (struct UserObject*)self;
  uo17->data[4] = (Object)closure17;
  Method *meth_meth_Vector3_setVector317 = addmethod2pos(self, "setVector3", &meth_Vector3_setVector317, 4);
int argcv_meth_Vector3_setVector317[] = {1};
meth_meth_Vector3_setVector317->type = alloc_MethodType(1, argcv_meth_Vector3_setVector317);
  meth_meth_Vector3_setVector317->definitionModule = modulename;
  meth_meth_Vector3_setVector317->definitionLine = 23;
// compilenode returning 
// Begin line 30
  setline(30);
  setmodule(modulename);
  setsource(originalSourceLines);
  block_savedest(self);
  Object closure26 = createclosure(1, "setVector2()Coords");
setclosureframe(closure26, stackframe);
  addtoclosure(closure26, var_Vector3);
  struct UserObject *uo26 = (struct UserObject*)self;
  uo26->data[5] = (Object)closure26;
  Method *meth_meth_Vector3_setVector2_40__41_Coords26 = addmethod2pos(self, "setVector2()Coords", &meth_Vector3_setVector2_40__41_Coords26, 5);
int argcv_meth_Vector3_setVector2_40__41_Coords26[] = {1, 1};
meth_meth_Vector3_setVector2_40__41_Coords26->type = alloc_MethodType(2, argcv_meth_Vector3_setVector2_40__41_Coords26);
meth_meth_Vector3_setVector2_40__41_Coords26->type->types[1] = type_Number;
meth_meth_Vector3_setVector2_40__41_Coords26->type->names[1] = "z";
  meth_meth_Vector3_setVector2_40__41_Coords26->definitionModule = modulename;
  meth_meth_Vector3_setVector2_40__41_Coords26->definitionLine = 30;
// compilenode returning 
// Begin line 37
  setline(37);
  setmodule(modulename);
  setsource(originalSourceLines);
  block_savedest(self);
  Object closure33 = createclosure(1, "setCoords()Vector2");
setclosureframe(closure33, stackframe);
  addtoclosure(closure33, var_Vector3);
  struct UserObject *uo33 = (struct UserObject*)self;
  uo33->data[6] = (Object)closure33;
  Method *meth_meth_Vector3_setCoords_40__41_Vector233 = addmethod2pos(self, "setCoords()Vector2", &meth_Vector3_setCoords_40__41_Vector233, 6);
int argcv_meth_Vector3_setCoords_40__41_Vector233[] = {1, 1};
meth_meth_Vector3_setCoords_40__41_Vector233->type = alloc_MethodType(2, argcv_meth_Vector3_setCoords_40__41_Vector233);
meth_meth_Vector3_setCoords_40__41_Vector233->type->types[0] = type_Number;
meth_meth_Vector3_setCoords_40__41_Vector233->type->names[0] = "x";
  meth_meth_Vector3_setCoords_40__41_Vector233->definitionModule = modulename;
  meth_meth_Vector3_setCoords_40__41_Vector233->definitionLine = 37;
// compilenode returning 
// Begin line 43
  setline(43);
  setmodule(modulename);
  setsource(originalSourceLines);
  block_savedest(self);
  Object closure40 = createclosure(1, "xAxis");
setclosureframe(closure40, stackframe);
  addtoclosure(closure40, var_Vector3);
  struct UserObject *uo40 = (struct UserObject*)self;
  uo40->data[7] = (Object)closure40;
  Method *meth_meth_Vector3_xAxis40 = addmethod2pos(self, "xAxis", &meth_Vector3_xAxis40, 7);
int argcv_meth_Vector3_xAxis40[] = {0};
meth_meth_Vector3_xAxis40->type = alloc_MethodType(1, argcv_meth_Vector3_xAxis40);
  meth_meth_Vector3_xAxis40->definitionModule = modulename;
  meth_meth_Vector3_xAxis40->definitionLine = 43;
// compilenode returning 
// Begin line 49
  setline(49);
  setmodule(modulename);
  setsource(originalSourceLines);
  block_savedest(self);
  Object closure46 = createclosure(1, "yAxis");
setclosureframe(closure46, stackframe);
  addtoclosure(closure46, var_Vector3);
  struct UserObject *uo46 = (struct UserObject*)self;
  uo46->data[8] = (Object)closure46;
  Method *meth_meth_Vector3_yAxis46 = addmethod2pos(self, "yAxis", &meth_Vector3_yAxis46, 8);
int argcv_meth_Vector3_yAxis46[] = {0};
meth_meth_Vector3_yAxis46->type = alloc_MethodType(1, argcv_meth_Vector3_yAxis46);
  meth_meth_Vector3_yAxis46->definitionModule = modulename;
  meth_meth_Vector3_yAxis46->definitionLine = 49;
// compilenode returning 
// Begin line 55
  setline(55);
  setmodule(modulename);
  setsource(originalSourceLines);
  block_savedest(self);
  Object closure52 = createclosure(1, "zAxis");
setclosureframe(closure52, stackframe);
  addtoclosure(closure52, var_Vector3);
  struct UserObject *uo52 = (struct UserObject*)self;
  uo52->data[9] = (Object)closure52;
  Method *meth_meth_Vector3_zAxis52 = addmethod2pos(self, "zAxis", &meth_Vector3_zAxis52, 9);
int argcv_meth_Vector3_zAxis52[] = {0};
meth_meth_Vector3_zAxis52->type = alloc_MethodType(1, argcv_meth_Vector3_zAxis52);
  meth_meth_Vector3_zAxis52->definitionModule = modulename;
  meth_meth_Vector3_zAxis52->definitionLine = 55;
// compilenode returning 
// Begin line 61
  setline(61);
  setmodule(modulename);
  setsource(originalSourceLines);
  block_savedest(self);
  Object closure58 = createclosure(1, "doge");
setclosureframe(closure58, stackframe);
  addtoclosure(closure58, var_Vector3);
  struct UserObject *uo58 = (struct UserObject*)self;
  uo58->data[10] = (Object)closure58;
  Method *meth_meth_Vector3_doge58 = addmethod2pos(self, "doge", &meth_Vector3_doge58, 10);
int argcv_meth_Vector3_doge58[] = {0};
meth_meth_Vector3_doge58->type = alloc_MethodType(1, argcv_meth_Vector3_doge58);
  meth_meth_Vector3_doge58->definitionModule = modulename;
  meth_meth_Vector3_doge58->definitionLine = 61;
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
// Begin line 30
  setline(30);
  setmodule(modulename);
  setsource(originalSourceLines);
// compilenode returning 
// Begin line 37
  setline(37);
  setmodule(modulename);
  setsource(originalSourceLines);
// compilenode returning 
// Begin line 43
  setline(43);
  setmodule(modulename);
  setsource(originalSourceLines);
// compilenode returning 
// Begin line 49
  setline(49);
  setmodule(modulename);
  setsource(originalSourceLines);
// compilenode returning 
// Begin line 55
  setline(55);
  setmodule(modulename);
  setsource(originalSourceLines);
// compilenode returning 
// Begin line 61
  setline(61);
  setmodule(modulename);
  setsource(originalSourceLines);
// compilenode returning 
// Begin line 68
  setline(68);
  setmodule(modulename);
  setsource(originalSourceLines);
// Begin line 39
  setline(39);
  setmodule(modulename);
  setsource(originalSourceLines);
  block_savedest(self);
  Object closure64 = createclosure(1, "Vector3");
setclosureframe(closure64, stackframe);
  addtoclosure(closure64, var_Vector3);
  struct UserObject *uo64 = (struct UserObject*)self;
  uo64->data[11] = (Object)closure64;
  Method *meth_meth_Vector3_Vector364 = addmethod2pos(self, "Vector3", &meth_Vector3_Vector364, 11);
int argcv_meth_Vector3_Vector364[] = {0};
meth_meth_Vector3_Vector364->type = alloc_MethodType(1, argcv_meth_Vector3_Vector364);
  meth_meth_Vector3_Vector364->definitionModule = modulename;
  meth_meth_Vector3_Vector364->definitionLine = 39;
// compilenode returning 
// Begin line 39
  setline(39);
  setmodule(modulename);
  setsource(originalSourceLines);
  Object inheritingObject65 = inheritingObject;
  if (isTailObject) {
    isTailObject = 0;
    inheritingObject = NULL;
  }
  Object obj65 = alloc_userobj2(2,4, objclass65);
  gc_frame_newslot(obj65);
// OBJECT OUTER DEC outer
  adddatum2(obj65, self, 0);
  addmethodreal(obj65,"outer", &reader_Vector3_outer_66);
  Object oldself65 = self;
  struct StackFrameObject *oldstackframe65 = stackframe;
  stackframe = alloc_StackFrame(1, oldstackframe65);
  gc_frame_newslot((Object)stackframe);
  self = obj65;
  Object *oldselfslot65 = selfslot;
  selfslot = &stackframe->slots[0];
  *selfslot = self;
  setframeelementname(stackframe, 0, "self");
  if (inheritingObject65) {
    struct UserObject *inho65 = (struct UserObject *)inheritingObject65;
    while (inho65->super != GraceDefaultObject) inho65 = (struct UserObject *)inho65->super;
    inho65->super = obj65;
    self = inheritingObject65;
    *selfslot = self;
  }
  struct UserObject *uo67 = (struct UserObject*)obj65;
  uo67->data[1] = emptyclosure;
  Method *meth_meth_Vector3_new67 = addmethod2pos(obj65, "new", &meth_Vector3_new67, 1);
int argcv_meth_Vector3_new67[] = {3};
meth_meth_Vector3_new67->type = alloc_MethodType(1, argcv_meth_Vector3_new67);
meth_meth_Vector3_new67->type->types[0] = type_Number;
meth_meth_Vector3_new67->type->names[0] = "x'";
meth_meth_Vector3_new67->type->types[1] = type_Number;
meth_meth_Vector3_new67->type->names[1] = "y'";
meth_meth_Vector3_new67->type->types[2] = type_Number;
meth_meth_Vector3_new67->type->names[2] = "z'";
  meth_meth_Vector3_new67->definitionModule = modulename;
  meth_meth_Vector3_new67->definitionLine = 39;
  Method *meth_meth_Vector3_new67_object = addmethod2pos(obj65, "new()object", &meth_Vector3_new67_object, 1);
int argcv_meth_Vector3_new67_object[] = {3};
meth_meth_Vector3_new67_object->type = alloc_MethodType(1, argcv_meth_Vector3_new67_object);
meth_meth_Vector3_new67_object->type->types[0] = type_Number;
meth_meth_Vector3_new67_object->type->names[0] = "x'";
meth_meth_Vector3_new67_object->type->types[1] = type_Number;
meth_meth_Vector3_new67_object->type->names[1] = "y'";
meth_meth_Vector3_new67_object->type->types[2] = type_Number;
meth_meth_Vector3_new67_object->type->names[2] = "z'";
  meth_meth_Vector3_new67_object->definitionModule = modulename;
  meth_meth_Vector3_new67_object->definitionLine = 39;
  sourceObject = obj65;
objclass65 = obj65->class;
  objclass65->definitionModule = modulename;
  objclass65->definitionLine = 39;
  self = oldself65;
  selfslot = oldselfslot65;
  stackframe = oldstackframe65;
// compilenode returning obj65
  *var_Vector3 = obj65;
  if (obj65 == undefined)
    callmethod(done, "assignment", 0, NULL, NULL);
// compilenode returning done
// compilenode returning done
  gc_frame_end(frame);
  return self;
}
