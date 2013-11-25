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
static const char modulename[] = "Vector4";
Object module_StandardPrelude_init();
static char *originalSourceLines[] = {
  "//CONSTRUCTOR METHODS",
  "//creates a new zero 3d vector",
  "method zero -> Vector4 {",
  "",
  "    Vector4.new(0, 0, 0, 0)",
  "}",
  "",
  "//creates a new 3d vector and initialises it with the given",
  "//x, y, z, and w values",
  "method setCoords(x : Number, y : Number, z : Number, w : Number) ->Vector4 {",
  "",
  "    Vector4.new(x, y, z, w)",
  "}",
  "",
  "//creates a new 4d vector and initialises it the x and y values of the given",
  "//2d vector's x and y values and sets the z and w values to zero",
  "method setVector2(v : Vector2) -> Vector4 {",
  "",
  "    Vector4.new(v.x, v.y, 0, 0)",
  "}",
  "",
  "//creates a new 4d vector and initialises it the x, y, and z values of the given",
  "//3d vector's x, y, and z values and sets the w value to zero",
  "method setVector3(v : Vector3) -> Vector4 {",
  "",
  "    Vector4.new(v.x, v.y, v.z, 0)",
  "}",
  "",
  "//creates a new 4d vector and initialises it with the given 4d vector's values",
  "method setVector4(v : Vector4) -> Vector4 {",
  "",
  "    Vector4.new(v.x, v.y, v.z, v.w)",
  "}",
  "",
  "//VECTOR4 CLASS",
  "//constructs a new 4d vector with the given x', y', z', and w' values",
  "class Vector4.new(x' : Number, y' : Number, z' : Number, w' : Number) {",
  "    ",
  "    var x : Number is public := x'",
  "    var y : Number is public := y'",
  "    var z : Number is public := z'",
  "    var w : Number is public := w'",
  "",
  "    //PUBLIC METHODS",
  "    method asString -> String is public {",
  "",
  "        \"[\" ++ x ++ \", \" ++ y ++ \", \" ++ z ++ \", \" ++ w ++ \"]\"",
  "    }",
  "}",
  NULL
};
Object reader_Vector4_outer_42(Object self, int nparams, int *argcv, Object* args, int flags) {
  struct UserObject *uo = (struct UserObject*)self;
  return uo->data[0];
}
Object reader_Vector4_outer_45(Object self, int nparams, int *argcv, Object* args, int flags) {
  struct UserObject *uo = (struct UserObject*)self;
  return uo->data[0];
}
Object reader_Vector4_x_46(Object self, int nparams, int *argcv, Object* args, int flags) {
  struct UserObject *uo = (struct UserObject *)self;
  return uo->data[1];
}
Object writer_Vector4_x_46(Object self, int nparams, int *argcv, Object* args, int flags) {
  struct UserObject *uo = (struct UserObject *)self;
  uo->data[1] = args[0];
  return done;
}
Object reader_Vector4_y_47(Object self, int nparams, int *argcv, Object* args, int flags) {
  struct UserObject *uo = (struct UserObject *)self;
  return uo->data[2];
}
Object writer_Vector4_y_47(Object self, int nparams, int *argcv, Object* args, int flags) {
  struct UserObject *uo = (struct UserObject *)self;
  uo->data[2] = args[0];
  return done;
}
Object reader_Vector4_z_48(Object self, int nparams, int *argcv, Object* args, int flags) {
  struct UserObject *uo = (struct UserObject *)self;
  return uo->data[3];
}
Object writer_Vector4_z_48(Object self, int nparams, int *argcv, Object* args, int flags) {
  struct UserObject *uo = (struct UserObject *)self;
  uo->data[3] = args[0];
  return done;
}
Object reader_Vector4_w_49(Object self, int nparams, int *argcv, Object* args, int flags) {
  struct UserObject *uo = (struct UserObject *)self;
  return uo->data[4];
}
Object writer_Vector4_w_49(Object self, int nparams, int *argcv, Object* args, int flags) {
  struct UserObject *uo = (struct UserObject *)self;
  uo->data[4] = args[0];
  return done;
}
static ClassData objclass41;
static ClassData objclass44;
static Object strlit59;
static Object strlit64;
static Object strlit71;
static Object strlit78;
static Object strlit85;
Object meth_Vector4_zero0(Object self, int nparts, int *argcv, Object *args, int32_t flags) {
  struct UserObject *uo = (struct UserObject*)self;
  Object closure = getdatum((Object)uo, 1, (flags>>24)&0xff);
  struct StackFrameObject *stackframe = alloc_StackFrame(1, getclosureframe(closure));
  pushclosure(closure);
  pushstackframe(stackframe, "zero");
  int frame = gc_frame_new();
  gc_frame_newslot((Object)stackframe);
  Object methodInheritingObject = NULL;
  Object params[4];
  int partcv[1];
  Object *var_Vector4 = getfromclosure(closure, 0);
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
  Object num5 = alloc_Float64(0);
// compilenode returning num5
  gc_frame_newslot(num5);
// compilenode returning *var_Vector4
  params[0] = num2;
  params[1] = num3;
  params[2] = num4;
  params[3] = num5;
  partcv[0] = 4;
  Object call6 = callmethod(*var_Vector4, "new",
    1, partcv, params);
  gc_frame_end(callframe1);
// compilenode returning call6
  gc_frame_end(frame);
  return call6;
}
Object meth_Vector4_setCoords7(Object self, int nparts, int *argcv, Object *args, int32_t flags) {
  struct UserObject *uo = (struct UserObject*)self;
  Object closure = getdatum((Object)uo, 2, (flags>>24)&0xff);
  struct StackFrameObject *stackframe = alloc_StackFrame(5, getclosureframe(closure));
  pushclosure(closure);
  pushstackframe(stackframe, "setCoords");
  int frame = gc_frame_new();
  gc_frame_newslot((Object)stackframe);
  Object methodInheritingObject = NULL;
  if (nparts > 0 && argcv[0] < 4)
    gracedie("insufficient arguments to method");
  Object params[4];
  int partcv[1];
  Object *var_Vector4 = getfromclosure(closure, 0);
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
  Object *var_w = &(stackframe->slots[3]);
  *var_w = args[curarg];
  curarg++;
if (argcv && argcv[0] > 4)
  gracedie("too many arguments for setCoords");
  Object *selfslot = &(stackframe->slots[4]);
  *selfslot = self;
  setframeelementname(stackframe, 0, "self");
  if (methodInheritingObject) curarg++;
// Begin line 13
  setline(13);
  setmodule(modulename);
  setsource(originalSourceLines);
  int callframe8 = gc_frame_new();
// Begin line 12
  setline(12);
  setmodule(modulename);
  setsource(originalSourceLines);
// compilenode returning *var_x
  gc_frame_newslot(*var_x);
// compilenode returning *var_y
  gc_frame_newslot(*var_y);
// compilenode returning *var_z
  gc_frame_newslot(*var_z);
// compilenode returning *var_w
  gc_frame_newslot(*var_w);
// compilenode returning *var_Vector4
  params[0] = *var_x;
  params[1] = *var_y;
  params[2] = *var_z;
  params[3] = *var_w;
  partcv[0] = 4;
  Object call9 = callmethod(*var_Vector4, "new",
    1, partcv, params);
  gc_frame_end(callframe8);
// compilenode returning call9
  gc_frame_end(frame);
  return call9;
}
Object meth_Vector4_setVector210(Object self, int nparts, int *argcv, Object *args, int32_t flags) {
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
  Object params[4];
  int partcv[1];
  Object *var_Vector4 = getfromclosure(closure, 0);
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
// Begin line 20
  setline(20);
  setmodule(modulename);
  setsource(originalSourceLines);
  int callframe11 = gc_frame_new();
// Begin line 19
  setline(19);
  setmodule(modulename);
  setsource(originalSourceLines);
  int callframe12 = gc_frame_new();
// compilenode returning *var_v
  partcv[0] = 0;
  Object call13 = callmethod(*var_v, "x",
    1, partcv, params);
  gc_frame_end(callframe12);
// compilenode returning call13
// compilenode returning call13
  gc_frame_newslot(call13);
  int callframe14 = gc_frame_new();
// compilenode returning *var_v
  partcv[0] = 0;
  Object call15 = callmethod(*var_v, "y",
    1, partcv, params);
  gc_frame_end(callframe14);
// compilenode returning call15
// compilenode returning call15
  gc_frame_newslot(call15);
  Object num16 = alloc_Float64(0);
// compilenode returning num16
  gc_frame_newslot(num16);
  Object num17 = alloc_Float64(0);
// compilenode returning num17
  gc_frame_newslot(num17);
// compilenode returning *var_Vector4
  params[0] = call13;
  params[1] = call15;
  params[2] = num16;
  params[3] = num17;
  partcv[0] = 4;
  Object call18 = callmethod(*var_Vector4, "new",
    1, partcv, params);
  gc_frame_end(callframe11);
// compilenode returning call18
  gc_frame_end(frame);
  return call18;
}
Object meth_Vector4_setVector319(Object self, int nparts, int *argcv, Object *args, int32_t flags) {
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
  Object params[4];
  int partcv[1];
  Object *var_Vector4 = getfromclosure(closure, 0);
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
// Begin line 27
  setline(27);
  setmodule(modulename);
  setsource(originalSourceLines);
  int callframe20 = gc_frame_new();
// Begin line 26
  setline(26);
  setmodule(modulename);
  setsource(originalSourceLines);
  int callframe21 = gc_frame_new();
// compilenode returning *var_v
  partcv[0] = 0;
  Object call22 = callmethod(*var_v, "x",
    1, partcv, params);
  gc_frame_end(callframe21);
// compilenode returning call22
// compilenode returning call22
  gc_frame_newslot(call22);
  int callframe23 = gc_frame_new();
// compilenode returning *var_v
  partcv[0] = 0;
  Object call24 = callmethod(*var_v, "y",
    1, partcv, params);
  gc_frame_end(callframe23);
// compilenode returning call24
// compilenode returning call24
  gc_frame_newslot(call24);
  int callframe25 = gc_frame_new();
// compilenode returning *var_v
  partcv[0] = 0;
  Object call26 = callmethod(*var_v, "z",
    1, partcv, params);
  gc_frame_end(callframe25);
// compilenode returning call26
// compilenode returning call26
  gc_frame_newslot(call26);
  Object num27 = alloc_Float64(0);
// compilenode returning num27
  gc_frame_newslot(num27);
// compilenode returning *var_Vector4
  params[0] = call22;
  params[1] = call24;
  params[2] = call26;
  params[3] = num27;
  partcv[0] = 4;
  Object call28 = callmethod(*var_Vector4, "new",
    1, partcv, params);
  gc_frame_end(callframe20);
// compilenode returning call28
  gc_frame_end(frame);
  return call28;
}
Object meth_Vector4_setVector429(Object self, int nparts, int *argcv, Object *args, int32_t flags) {
  struct UserObject *uo = (struct UserObject*)self;
  Object closure = getdatum((Object)uo, 5, (flags>>24)&0xff);
  struct StackFrameObject *stackframe = alloc_StackFrame(2, getclosureframe(closure));
  pushclosure(closure);
  pushstackframe(stackframe, "setVector4");
  int frame = gc_frame_new();
  gc_frame_newslot((Object)stackframe);
  Object methodInheritingObject = NULL;
  if (nparts > 0 && argcv[0] < 1)
    gracedie("insufficient arguments to method");
  Object params[4];
  int partcv[1];
  Object *var_Vector4 = getfromclosure(closure, 0);
  int i;
  int curarg = 0;
  int pushcv[] = {1};
  if (nparts < 1 && args)
    gracedie("missing argument list for setVector4 (probably reflection error): got %i lists, expected 1.", nparts);
  Object *var_v = &(stackframe->slots[0]);
  *var_v = args[curarg];
  curarg++;
if (argcv && argcv[0] > 1)
  gracedie("too many arguments for setVector4");
  Object *selfslot = &(stackframe->slots[1]);
  *selfslot = self;
  setframeelementname(stackframe, 0, "self");
  if (methodInheritingObject) curarg++;
// Begin line 33
  setline(33);
  setmodule(modulename);
  setsource(originalSourceLines);
  int callframe30 = gc_frame_new();
// Begin line 32
  setline(32);
  setmodule(modulename);
  setsource(originalSourceLines);
  int callframe31 = gc_frame_new();
// compilenode returning *var_v
  partcv[0] = 0;
  Object call32 = callmethod(*var_v, "x",
    1, partcv, params);
  gc_frame_end(callframe31);
// compilenode returning call32
// compilenode returning call32
  gc_frame_newslot(call32);
  int callframe33 = gc_frame_new();
// compilenode returning *var_v
  partcv[0] = 0;
  Object call34 = callmethod(*var_v, "y",
    1, partcv, params);
  gc_frame_end(callframe33);
// compilenode returning call34
// compilenode returning call34
  gc_frame_newslot(call34);
  int callframe35 = gc_frame_new();
// compilenode returning *var_v
  partcv[0] = 0;
  Object call36 = callmethod(*var_v, "z",
    1, partcv, params);
  gc_frame_end(callframe35);
// compilenode returning call36
// compilenode returning call36
  gc_frame_newslot(call36);
  int callframe37 = gc_frame_new();
// compilenode returning *var_v
  partcv[0] = 0;
  Object call38 = callmethod(*var_v, "w",
    1, partcv, params);
  gc_frame_end(callframe37);
// compilenode returning call38
// compilenode returning call38
  gc_frame_newslot(call38);
// compilenode returning *var_Vector4
  params[0] = call32;
  params[1] = call34;
  params[2] = call36;
  params[3] = call38;
  partcv[0] = 4;
  Object call39 = callmethod(*var_Vector4, "new",
    1, partcv, params);
  gc_frame_end(callframe30);
// compilenode returning call39
  gc_frame_end(frame);
  return call39;
}
Object meth_Vector4_Vector440(Object self, int nparts, int *argcv, Object *args, int32_t flags) {
  struct UserObject *uo = (struct UserObject*)self;
  Object closure = getdatum((Object)uo, 6, (flags>>24)&0xff);
  struct StackFrameObject *stackframe = alloc_StackFrame(1, getclosureframe(closure));
  pushclosure(closure);
  pushstackframe(stackframe, "Vector4");
  int frame = gc_frame_new();
  gc_frame_newslot((Object)stackframe);
  Object methodInheritingObject = NULL;
  Object params[1];
  int partcv[1];
  Object *var_Vector4 = getfromclosure(closure, 0);
  int i;
  int curarg = 0;
  int pushcv[] = {1};
  if (nparts < 1 && args)
    gracedie("missing argument list for Vector4 (probably reflection error): got %i lists, expected 1.", nparts);
if (argcv && argcv[0] > 0)
  gracedie("too many arguments for Vector4");
  Object *selfslot = &(stackframe->slots[0]);
  *selfslot = self;
  setframeelementname(stackframe, 0, "self");
  if (methodInheritingObject) curarg++;
// Begin line 37
  setline(37);
  setmodule(modulename);
  setsource(originalSourceLines);
// compilenode returning *var_Vector4
  gc_frame_end(frame);
  return *var_Vector4;
}
Object meth_Vector4_asString50(Object self, int nparts, int *argcv, Object *args, int32_t flags) {
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
// Begin line 48
  setline(48);
  setmodule(modulename);
  setsource(originalSourceLines);
// Begin line 47
  setline(47);
  setmodule(modulename);
  setsource(originalSourceLines);
  if (strlit59 == NULL) {
    strlit59 = alloc_String("[");
    gc_root(strlit59);
  }
// compilenode returning strlit59
  int op_slot_left_58 = gc_frame_newslot(strlit59);
  int callframe60 = gc_frame_new();
  partcv[0] = 0;
  Object call61 = callmethodflags(self, "x", 1, partcv, params, CFLAG_SELF);
  gc_frame_end(callframe60);
// compilenode returning call61
  int op_slot_right_58 = gc_frame_newslot(call61);
  params[0] = call61;
  partcv[0] = 1;
  Object opresult63 = callmethod(strlit59, "++", 1, partcv, params);
// compilenode returning opresult63
  int op_slot_left_57 = gc_frame_newslot(opresult63);
  if (strlit64 == NULL) {
    strlit64 = alloc_String(", ");
    gc_root(strlit64);
  }
// compilenode returning strlit64
  int op_slot_right_57 = gc_frame_newslot(strlit64);
  params[0] = strlit64;
  partcv[0] = 1;
  Object opresult66 = callmethod(opresult63, "++", 1, partcv, params);
// compilenode returning opresult66
  int op_slot_left_56 = gc_frame_newslot(opresult66);
  int callframe67 = gc_frame_new();
  partcv[0] = 0;
  Object call68 = callmethodflags(self, "y", 1, partcv, params, CFLAG_SELF);
  gc_frame_end(callframe67);
// compilenode returning call68
  int op_slot_right_56 = gc_frame_newslot(call68);
  params[0] = call68;
  partcv[0] = 1;
  Object opresult70 = callmethod(opresult66, "++", 1, partcv, params);
// compilenode returning opresult70
  int op_slot_left_55 = gc_frame_newslot(opresult70);
  if (strlit71 == NULL) {
    strlit71 = alloc_String(", ");
    gc_root(strlit71);
  }
// compilenode returning strlit71
  int op_slot_right_55 = gc_frame_newslot(strlit71);
  params[0] = strlit71;
  partcv[0] = 1;
  Object opresult73 = callmethod(opresult70, "++", 1, partcv, params);
// compilenode returning opresult73
  int op_slot_left_54 = gc_frame_newslot(opresult73);
  int callframe74 = gc_frame_new();
  partcv[0] = 0;
  Object call75 = callmethodflags(self, "z", 1, partcv, params, CFLAG_SELF);
  gc_frame_end(callframe74);
// compilenode returning call75
  int op_slot_right_54 = gc_frame_newslot(call75);
  params[0] = call75;
  partcv[0] = 1;
  Object opresult77 = callmethod(opresult73, "++", 1, partcv, params);
// compilenode returning opresult77
  int op_slot_left_53 = gc_frame_newslot(opresult77);
  if (strlit78 == NULL) {
    strlit78 = alloc_String(", ");
    gc_root(strlit78);
  }
// compilenode returning strlit78
  int op_slot_right_53 = gc_frame_newslot(strlit78);
  params[0] = strlit78;
  partcv[0] = 1;
  Object opresult80 = callmethod(opresult77, "++", 1, partcv, params);
// compilenode returning opresult80
  int op_slot_left_52 = gc_frame_newslot(opresult80);
  int callframe81 = gc_frame_new();
  partcv[0] = 0;
  Object call82 = callmethodflags(self, "w", 1, partcv, params, CFLAG_SELF);
  gc_frame_end(callframe81);
// compilenode returning call82
  int op_slot_right_52 = gc_frame_newslot(call82);
  params[0] = call82;
  partcv[0] = 1;
  Object opresult84 = callmethod(opresult80, "++", 1, partcv, params);
// compilenode returning opresult84
  int op_slot_left_51 = gc_frame_newslot(opresult84);
  if (strlit85 == NULL) {
    strlit85 = alloc_String("]");
    gc_root(strlit85);
  }
// compilenode returning strlit85
  int op_slot_right_51 = gc_frame_newslot(strlit85);
  params[0] = strlit85;
  partcv[0] = 1;
  Object opresult87 = callmethod(opresult84, "++", 1, partcv, params);
// compilenode returning opresult87
  gc_frame_end(frame);
  return opresult87;
}
Object meth_Vector4_new43(Object self, int nparts, int *argcv, Object *args, int32_t flags) {
  struct StackFrameObject *stackframe = alloc_StackFrame(5, NULL);
  pushclosure(NULL);
  pushstackframe(stackframe, "new");
  int frame = gc_frame_new();
  gc_frame_newslot((Object)stackframe);
  Object methodInheritingObject = NULL;
  if (nparts > 0 && argcv[0] < 4)
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
  Object *var_w_39_ = &(stackframe->slots[3]);
  *var_w_39_ = args[curarg];
  curarg++;
if (argcv && argcv[0] > 4)
  gracedie("too many arguments for new");
  Object *selfslot = &(stackframe->slots[4]);
  *selfslot = self;
  setframeelementname(stackframe, 0, "self");
  if (methodInheritingObject) curarg++;
  isTailObject = 1;
  inheritingObject = methodInheritingObject;
  Object inheritingObject44 = inheritingObject;
  if (isTailObject) {
    isTailObject = 0;
    inheritingObject = NULL;
  }
  Object obj44 = alloc_userobj2(9,6, objclass44);
  gc_frame_newslot(obj44);
if (objclass44 == NULL) {
  glfree(obj44->class->name);
  obj44->class->name = "Vector4";
}
// OBJECT OUTER DEC outer
  adddatum2(obj44, self, 0);
  addmethodreal(obj44,"outer", &reader_Vector4_outer_45);
  Object oldself44 = self;
  struct StackFrameObject *oldstackframe44 = stackframe;
  stackframe = alloc_StackFrame(1, oldstackframe44);
  gc_frame_newslot((Object)stackframe);
  self = obj44;
  Object *oldselfslot44 = selfslot;
  selfslot = &stackframe->slots[0];
  *selfslot = self;
  setframeelementname(stackframe, 0, "self");
  if (inheritingObject44) {
    struct UserObject *inho44 = (struct UserObject *)inheritingObject44;
    while (inho44->super != GraceDefaultObject) inho44 = (struct UserObject *)inho44->super;
    inho44->super = obj44;
    self = inheritingObject44;
    *selfslot = self;
  }
if (objclass44 == NULL) {
  Method *reader46 = addmethodrealflags(obj44, "x",&reader_Vector4_x_46, 0);
  Method *writer46 = addmethodrealflags(obj44, "x:=",&writer_Vector4_x_46, 0);
  reader46->definitionModule = modulename;
  writer46->definitionModule = modulename;
  reader46->definitionLine = 40;
  writer46->definitionLine = 40;
}
obj44->flags |= OFLAG_MUTABLE;
adddatum2(obj44, alloc_Undefined(), 1);
if (objclass44 == NULL) {
  Method *reader47 = addmethodrealflags(obj44, "y",&reader_Vector4_y_47, 0);
  Method *writer47 = addmethodrealflags(obj44, "y:=",&writer_Vector4_y_47, 0);
  reader47->definitionModule = modulename;
  writer47->definitionModule = modulename;
  reader47->definitionLine = 41;
  writer47->definitionLine = 41;
}
obj44->flags |= OFLAG_MUTABLE;
adddatum2(obj44, alloc_Undefined(), 2);
if (objclass44 == NULL) {
  Method *reader48 = addmethodrealflags(obj44, "z",&reader_Vector4_z_48, 0);
  Method *writer48 = addmethodrealflags(obj44, "z:=",&writer_Vector4_z_48, 0);
  reader48->definitionModule = modulename;
  writer48->definitionModule = modulename;
  reader48->definitionLine = 42;
  writer48->definitionLine = 42;
}
obj44->flags |= OFLAG_MUTABLE;
adddatum2(obj44, alloc_Undefined(), 3);
if (objclass44 == NULL) {
  Method *reader49 = addmethodrealflags(obj44, "w",&reader_Vector4_w_49, 0);
  Method *writer49 = addmethodrealflags(obj44, "w:=",&writer_Vector4_w_49, 0);
  reader49->definitionModule = modulename;
  writer49->definitionModule = modulename;
  reader49->definitionLine = 45;
  writer49->definitionLine = 45;
}
obj44->flags |= OFLAG_MUTABLE;
adddatum2(obj44, alloc_Undefined(), 4);
  struct UserObject *uo50 = (struct UserObject*)obj44;
  uo50->data[5] = emptyclosure;
  Method *meth_meth_Vector4_asString50 = addmethod2pos(obj44, "asString", &meth_Vector4_asString50, 5);
int argcv_meth_Vector4_asString50[] = {0};
meth_meth_Vector4_asString50->type = alloc_MethodType(1, argcv_meth_Vector4_asString50);
  meth_meth_Vector4_asString50->definitionModule = modulename;
  meth_meth_Vector4_asString50->definitionLine = 45;
  sourceObject = obj44;
// Begin line 39
  setline(39);
  setmodule(modulename);
  setsource(originalSourceLines);
// compilenode returning *var_x_39_
  adddatum2(obj44, *var_x_39_, 1);
  sourceObject = obj44;
// Begin line 40
  setline(40);
  setmodule(modulename);
  setsource(originalSourceLines);
// compilenode returning *var_y_39_
  adddatum2(obj44, *var_y_39_, 2);
  sourceObject = obj44;
// Begin line 41
  setline(41);
  setmodule(modulename);
  setsource(originalSourceLines);
// compilenode returning *var_z_39_
  adddatum2(obj44, *var_z_39_, 3);
  sourceObject = obj44;
// Begin line 42
  setline(42);
  setmodule(modulename);
  setsource(originalSourceLines);
// compilenode returning *var_w_39_
  adddatum2(obj44, *var_w_39_, 4);
  sourceObject = obj44;
objclass44 = obj44->class;
  objclass44->definitionModule = modulename;
  objclass44->definitionLine = 32;
  self = oldself44;
  selfslot = oldselfslot44;
  stackframe = oldstackframe44;
  gc_frame_end(frame);
  return obj44;
}
Object meth_Vector4_new43_object(Object self, int nparts, int *argcv, Object *args, int32_t flags) {
  struct StackFrameObject *stackframe = alloc_StackFrame(5, NULL);
  pushclosure(NULL);
  pushstackframe(stackframe, "new()object");
  int frame = gc_frame_new();
  gc_frame_newslot((Object)stackframe);
  Object methodInheritingObject = args[0 + argcv[0]];
  if (nparts > 0 && argcv[0] < 4)
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
  Object *var_w_39_ = &(stackframe->slots[3]);
  *var_w_39_ = args[curarg];
  curarg++;
if (argcv && argcv[0] > 4)
  gracedie("too many arguments for new");
  Object *selfslot = &(stackframe->slots[4]);
  *selfslot = self;
  setframeelementname(stackframe, 0, "self");
  if (methodInheritingObject) curarg++;
  isTailObject = 1;
  inheritingObject = methodInheritingObject;
  Object inheritingObject44 = inheritingObject;
  if (isTailObject) {
    isTailObject = 0;
    inheritingObject = NULL;
  }
  Object obj44 = alloc_userobj2(9,6, objclass44);
  gc_frame_newslot(obj44);
if (objclass44 == NULL) {
  glfree(obj44->class->name);
  obj44->class->name = "Vector4";
}
// OBJECT OUTER DEC outer
  adddatum2(obj44, self, 0);
  addmethodreal(obj44,"outer", &reader_Vector4_outer_45);
  Object oldself44 = self;
  struct StackFrameObject *oldstackframe44 = stackframe;
  stackframe = alloc_StackFrame(1, oldstackframe44);
  gc_frame_newslot((Object)stackframe);
  self = obj44;
  Object *oldselfslot44 = selfslot;
  selfslot = &stackframe->slots[0];
  *selfslot = self;
  setframeelementname(stackframe, 0, "self");
  if (inheritingObject44) {
    struct UserObject *inho44 = (struct UserObject *)inheritingObject44;
    while (inho44->super != GraceDefaultObject) inho44 = (struct UserObject *)inho44->super;
    inho44->super = obj44;
    self = inheritingObject44;
    *selfslot = self;
  }
if (objclass44 == NULL) {
  Method *reader46 = addmethodrealflags(obj44, "x",&reader_Vector4_x_46, 0);
  Method *writer46 = addmethodrealflags(obj44, "x:=",&writer_Vector4_x_46, 0);
  reader46->definitionModule = modulename;
  writer46->definitionModule = modulename;
  reader46->definitionLine = 40;
  writer46->definitionLine = 40;
}
obj44->flags |= OFLAG_MUTABLE;
adddatum2(obj44, alloc_Undefined(), 1);
if (objclass44 == NULL) {
  Method *reader47 = addmethodrealflags(obj44, "y",&reader_Vector4_y_47, 0);
  Method *writer47 = addmethodrealflags(obj44, "y:=",&writer_Vector4_y_47, 0);
  reader47->definitionModule = modulename;
  writer47->definitionModule = modulename;
  reader47->definitionLine = 41;
  writer47->definitionLine = 41;
}
obj44->flags |= OFLAG_MUTABLE;
adddatum2(obj44, alloc_Undefined(), 2);
if (objclass44 == NULL) {
  Method *reader48 = addmethodrealflags(obj44, "z",&reader_Vector4_z_48, 0);
  Method *writer48 = addmethodrealflags(obj44, "z:=",&writer_Vector4_z_48, 0);
  reader48->definitionModule = modulename;
  writer48->definitionModule = modulename;
  reader48->definitionLine = 42;
  writer48->definitionLine = 42;
}
obj44->flags |= OFLAG_MUTABLE;
adddatum2(obj44, alloc_Undefined(), 3);
if (objclass44 == NULL) {
  Method *reader49 = addmethodrealflags(obj44, "w",&reader_Vector4_w_49, 0);
  Method *writer49 = addmethodrealflags(obj44, "w:=",&writer_Vector4_w_49, 0);
  reader49->definitionModule = modulename;
  writer49->definitionModule = modulename;
  reader49->definitionLine = 45;
  writer49->definitionLine = 45;
}
obj44->flags |= OFLAG_MUTABLE;
adddatum2(obj44, alloc_Undefined(), 4);
  struct UserObject *uo50 = (struct UserObject*)obj44;
  uo50->data[5] = emptyclosure;
  Method *meth_meth_Vector4_asString50 = addmethod2pos(obj44, "asString", &meth_Vector4_asString50, 5);
int argcv_meth_Vector4_asString50[] = {0};
meth_meth_Vector4_asString50->type = alloc_MethodType(1, argcv_meth_Vector4_asString50);
  meth_meth_Vector4_asString50->definitionModule = modulename;
  meth_meth_Vector4_asString50->definitionLine = 45;
  sourceObject = obj44;
// Begin line 39
  setline(39);
  setmodule(modulename);
  setsource(originalSourceLines);
// compilenode returning *var_x_39_
  adddatum2(obj44, *var_x_39_, 1);
  sourceObject = obj44;
// Begin line 40
  setline(40);
  setmodule(modulename);
  setsource(originalSourceLines);
// compilenode returning *var_y_39_
  adddatum2(obj44, *var_y_39_, 2);
  sourceObject = obj44;
// Begin line 41
  setline(41);
  setmodule(modulename);
  setsource(originalSourceLines);
// compilenode returning *var_z_39_
  adddatum2(obj44, *var_z_39_, 3);
  sourceObject = obj44;
// Begin line 42
  setline(42);
  setmodule(modulename);
  setsource(originalSourceLines);
// compilenode returning *var_w_39_
  adddatum2(obj44, *var_w_39_, 4);
  sourceObject = obj44;
objclass44 = obj44->class;
  objclass44->definitionModule = modulename;
  objclass44->definitionLine = 32;
  self = oldself44;
  selfslot = oldselfslot44;
  stackframe = oldstackframe44;
  gc_frame_end(frame);
  return obj44;
}
Object module_Vector4_init() {
  int flags = 0;
  int frame = gc_frame_new();
  Object self = alloc_obj2(8, 8);
  gc_root(self);
  prelude = module_StandardPrelude_init();
  adddatum2(self, prelude, 0);
  addmethod2(self, "outer", &grace_userobj_outer);
  setline(1);
  setmodule(modulename);
  setsource(originalSourceLines);
  setclassname(self, "Module<Vector4>");
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
  struct StackFrameObject *stackframe = alloc_StackFrame(8, NULL);
  gc_root((Object)stackframe);
  pushstackframe(stackframe, "module scope");
  Object *selfslot = &(stackframe->slots[0]);
  *selfslot = self;
  setframeelementname(stackframe, 0, "self");
  Object params[1];
  int partcv[1];
  Object *var_Vector4 = &(stackframe->slots[1]);
  setframeelementname(stackframe, 1, "Vector4");
// Begin line 3
  setline(3);
  setmodule(modulename);
  setsource(originalSourceLines);
  block_savedest(self);
  Object closure0 = createclosure(1, "zero");
setclosureframe(closure0, stackframe);
  addtoclosure(closure0, var_Vector4);
  struct UserObject *uo0 = (struct UserObject*)self;
  uo0->data[1] = (Object)closure0;
  Method *meth_meth_Vector4_zero0 = addmethod2pos(self, "zero", &meth_Vector4_zero0, 1);
int argcv_meth_Vector4_zero0[] = {0};
meth_meth_Vector4_zero0->type = alloc_MethodType(1, argcv_meth_Vector4_zero0);
  meth_meth_Vector4_zero0->definitionModule = modulename;
  meth_meth_Vector4_zero0->definitionLine = 3;
// compilenode returning 
// Begin line 10
  setline(10);
  setmodule(modulename);
  setsource(originalSourceLines);
  block_savedest(self);
  Object closure7 = createclosure(1, "setCoords");
setclosureframe(closure7, stackframe);
  addtoclosure(closure7, var_Vector4);
  struct UserObject *uo7 = (struct UserObject*)self;
  uo7->data[2] = (Object)closure7;
  Method *meth_meth_Vector4_setCoords7 = addmethod2pos(self, "setCoords", &meth_Vector4_setCoords7, 2);
int argcv_meth_Vector4_setCoords7[] = {4};
meth_meth_Vector4_setCoords7->type = alloc_MethodType(1, argcv_meth_Vector4_setCoords7);
meth_meth_Vector4_setCoords7->type->types[0] = type_Number;
meth_meth_Vector4_setCoords7->type->names[0] = "x";
meth_meth_Vector4_setCoords7->type->types[1] = type_Number;
meth_meth_Vector4_setCoords7->type->names[1] = "y";
meth_meth_Vector4_setCoords7->type->types[2] = type_Number;
meth_meth_Vector4_setCoords7->type->names[2] = "z";
meth_meth_Vector4_setCoords7->type->types[3] = type_Number;
meth_meth_Vector4_setCoords7->type->names[3] = "w";
  meth_meth_Vector4_setCoords7->definitionModule = modulename;
  meth_meth_Vector4_setCoords7->definitionLine = 10;
// compilenode returning 
// Begin line 17
  setline(17);
  setmodule(modulename);
  setsource(originalSourceLines);
  block_savedest(self);
  Object closure10 = createclosure(1, "setVector2");
setclosureframe(closure10, stackframe);
  addtoclosure(closure10, var_Vector4);
  struct UserObject *uo10 = (struct UserObject*)self;
  uo10->data[3] = (Object)closure10;
  Method *meth_meth_Vector4_setVector210 = addmethod2pos(self, "setVector2", &meth_Vector4_setVector210, 3);
int argcv_meth_Vector4_setVector210[] = {1};
meth_meth_Vector4_setVector210->type = alloc_MethodType(1, argcv_meth_Vector4_setVector210);
  meth_meth_Vector4_setVector210->definitionModule = modulename;
  meth_meth_Vector4_setVector210->definitionLine = 17;
// compilenode returning 
// Begin line 24
  setline(24);
  setmodule(modulename);
  setsource(originalSourceLines);
  block_savedest(self);
  Object closure19 = createclosure(1, "setVector3");
setclosureframe(closure19, stackframe);
  addtoclosure(closure19, var_Vector4);
  struct UserObject *uo19 = (struct UserObject*)self;
  uo19->data[4] = (Object)closure19;
  Method *meth_meth_Vector4_setVector319 = addmethod2pos(self, "setVector3", &meth_Vector4_setVector319, 4);
int argcv_meth_Vector4_setVector319[] = {1};
meth_meth_Vector4_setVector319->type = alloc_MethodType(1, argcv_meth_Vector4_setVector319);
  meth_meth_Vector4_setVector319->definitionModule = modulename;
  meth_meth_Vector4_setVector319->definitionLine = 24;
// compilenode returning 
// Begin line 30
  setline(30);
  setmodule(modulename);
  setsource(originalSourceLines);
  block_savedest(self);
  Object closure29 = createclosure(1, "setVector4");
setclosureframe(closure29, stackframe);
  addtoclosure(closure29, var_Vector4);
  struct UserObject *uo29 = (struct UserObject*)self;
  uo29->data[5] = (Object)closure29;
  Method *meth_meth_Vector4_setVector429 = addmethod2pos(self, "setVector4", &meth_Vector4_setVector429, 5);
int argcv_meth_Vector4_setVector429[] = {1};
meth_meth_Vector4_setVector429->type = alloc_MethodType(1, argcv_meth_Vector4_setVector429);
  meth_meth_Vector4_setVector429->definitionModule = modulename;
  meth_meth_Vector4_setVector429->definitionLine = 30;
// compilenode returning 
// Begin line 3
  setline(3);
  setmodule(modulename);
  setsource(originalSourceLines);
// compilenode returning 
// Begin line 10
  setline(10);
  setmodule(modulename);
  setsource(originalSourceLines);
// compilenode returning 
// Begin line 17
  setline(17);
  setmodule(modulename);
  setsource(originalSourceLines);
// compilenode returning 
// Begin line 24
  setline(24);
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
// Begin line 32
  setline(32);
  setmodule(modulename);
  setsource(originalSourceLines);
  block_savedest(self);
  Object closure40 = createclosure(1, "Vector4");
setclosureframe(closure40, stackframe);
  addtoclosure(closure40, var_Vector4);
  struct UserObject *uo40 = (struct UserObject*)self;
  uo40->data[6] = (Object)closure40;
  Method *meth_meth_Vector4_Vector440 = addmethod2pos(self, "Vector4", &meth_Vector4_Vector440, 6);
int argcv_meth_Vector4_Vector440[] = {0};
meth_meth_Vector4_Vector440->type = alloc_MethodType(1, argcv_meth_Vector4_Vector440);
  meth_meth_Vector4_Vector440->definitionModule = modulename;
  meth_meth_Vector4_Vector440->definitionLine = 32;
// compilenode returning 
// Begin line 32
  setline(32);
  setmodule(modulename);
  setsource(originalSourceLines);
  Object inheritingObject41 = inheritingObject;
  if (isTailObject) {
    isTailObject = 0;
    inheritingObject = NULL;
  }
  Object obj41 = alloc_userobj2(2,4, objclass41);
  gc_frame_newslot(obj41);
// OBJECT OUTER DEC outer
  adddatum2(obj41, self, 0);
  addmethodreal(obj41,"outer", &reader_Vector4_outer_42);
  Object oldself41 = self;
  struct StackFrameObject *oldstackframe41 = stackframe;
  stackframe = alloc_StackFrame(1, oldstackframe41);
  gc_frame_newslot((Object)stackframe);
  self = obj41;
  Object *oldselfslot41 = selfslot;
  selfslot = &stackframe->slots[0];
  *selfslot = self;
  setframeelementname(stackframe, 0, "self");
  if (inheritingObject41) {
    struct UserObject *inho41 = (struct UserObject *)inheritingObject41;
    while (inho41->super != GraceDefaultObject) inho41 = (struct UserObject *)inho41->super;
    inho41->super = obj41;
    self = inheritingObject41;
    *selfslot = self;
  }
  struct UserObject *uo43 = (struct UserObject*)obj41;
  uo43->data[1] = emptyclosure;
  Method *meth_meth_Vector4_new43 = addmethod2pos(obj41, "new", &meth_Vector4_new43, 1);
int argcv_meth_Vector4_new43[] = {4};
meth_meth_Vector4_new43->type = alloc_MethodType(1, argcv_meth_Vector4_new43);
meth_meth_Vector4_new43->type->types[0] = type_Number;
meth_meth_Vector4_new43->type->names[0] = "x'";
meth_meth_Vector4_new43->type->types[1] = type_Number;
meth_meth_Vector4_new43->type->names[1] = "y'";
meth_meth_Vector4_new43->type->types[2] = type_Number;
meth_meth_Vector4_new43->type->names[2] = "z'";
meth_meth_Vector4_new43->type->types[3] = type_Number;
meth_meth_Vector4_new43->type->names[3] = "w'";
  meth_meth_Vector4_new43->definitionModule = modulename;
  meth_meth_Vector4_new43->definitionLine = 32;
  Method *meth_meth_Vector4_new43_object = addmethod2pos(obj41, "new()object", &meth_Vector4_new43_object, 1);
int argcv_meth_Vector4_new43_object[] = {4};
meth_meth_Vector4_new43_object->type = alloc_MethodType(1, argcv_meth_Vector4_new43_object);
meth_meth_Vector4_new43_object->type->types[0] = type_Number;
meth_meth_Vector4_new43_object->type->names[0] = "x'";
meth_meth_Vector4_new43_object->type->types[1] = type_Number;
meth_meth_Vector4_new43_object->type->names[1] = "y'";
meth_meth_Vector4_new43_object->type->types[2] = type_Number;
meth_meth_Vector4_new43_object->type->names[2] = "z'";
meth_meth_Vector4_new43_object->type->types[3] = type_Number;
meth_meth_Vector4_new43_object->type->names[3] = "w'";
  meth_meth_Vector4_new43_object->definitionModule = modulename;
  meth_meth_Vector4_new43_object->definitionLine = 32;
  sourceObject = obj41;
objclass41 = obj41->class;
  objclass41->definitionModule = modulename;
  objclass41->definitionLine = 32;
  self = oldself41;
  selfslot = oldselfslot41;
  stackframe = oldstackframe41;
// compilenode returning obj41
  *var_Vector4 = obj41;
  if (obj41 == undefined)
    callmethod(done, "assignment", 0, NULL, NULL);
// compilenode returning done
// compilenode returning done
  gc_frame_end(frame);
  return self;
}
