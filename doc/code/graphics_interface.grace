

// ----------------------- //
//                                                    //
//           WINDOW METHODS             //
//                                                    //
// ----------------------- //

// Default window, sized 640x480
method createWindow -> Window

// Creates and returns a default window at the position passed in
method createWindowAt(x : Number, y : Number) -> Window

// Creates and returns a window at the specified position with the
// specified size
method createWindowAt(x : Number, y : Number)
            withSize(w : Number, h : Number) -> Window

// Creates and returns a window with the specified size
method createWindowWithSize(w : Number, h : Number) -> Window

// Creates a window with name, position and size specified
method createWindowCalled(t : String)
                      at(x : Number, y : Number)
                withSize(w : Number, h : Number) -> Window



// ----------------------- //
//                                                    //
//           CANVAS METHODS              //
//                                                    //
// ----------------------- //

// Default canvas sized 640x480
method createCanvas -> Canvas

// Canvas sized wxh
method createCanvasWithSize(w : Number, h : Number) -> Canvas


// ----------------------- //
//                                                    //
//         COMPONENT METHODS         //
//                                                    //
// ----------------------- //


// BOXES

method createVerticalBox -> Container

// A vertical box containing the list of components l
method createVerticalBoxContaining(l : List<Component>) -> Container

method createHorizontalBox -> Container

// A horizontal box containing the list of components l
method createHorizontalBoxContaining(l : List<Component>) -> Container


// BUTTONS

// Default button, no label, no actions
method createButton -> Button

// Button with a label
method createButtonCalled(s : String) -> Button

// Button with a label and an action on clicked
method createButtonCalled(s : String) onClicked(b : Block) -> Button


// ----------------------- //
//                                                    //
//          DRAWABLE METHODS           //
//                                                    //
// ----------------------- //

// RECTANGLES


// Rectangle. Has default values: Black, at (25, 25), sized 50x50
method createRectangle -> Rectangle

// Rectangle at (x, y) sized wxh colored c
method createRectangleAt(x : Number, y : Number)
                   sized(w : Number, h : Number)
                 colored(c : Color) -> Rectangle



// CIRCLES


// Circle. Has default values: Black, around (50, 50), radius 25
method createCircle -> Circle

// Circle around (x, y) radius r colored c
method createCircleAround(x : Number, y : Number)
                   radius(r : Number)
                  colored(c : Color) -> Circle


// OVALS


// Oval. Has default values: Black, around (50, 50) width 50 height 25
method createOval -> Oval

// Oval around (x, y) size wxh colored c
method createOvalAt(x : Number, y : Number)
              sized(w : Number, h : Number)
            colored(c : Color) -> Oval

// SECTORS


// Sector. Has default values: Black, around (50, 50), radius 25, from 0 to pi
method createSector -> Sector

// Sector around (x, y) radius r from f to t colored c
method createSectorAround(x : Number, y : Number)
                     from(f : Number)
                       to(t : Number)
                   radius(r : Number)
                  colored(c : Color) -> Sector


// ARCS


// Arc. Has default values: Black, around (50, 50), radius 25, width 10 from 0 to 2pi
method createArc -> Arc

// Arc around (x, y) radius r width w from f to t colored c
method createArcAround(x : Number, y : Number)
                  from(f : Number)
                    to(t : Number)
                radius(r : Number)
                 width(w : Number)
               colored(c : Color) -> Arc



// LINE

// Line. Has default values: Black, from (25, 25) to (75, 75)
method createLine -> Line

// Line from (x1, y1) to (x2, y2) colored b
method createLineFrom(x1 : Number, y1 : Number)
                   to(x2 : Number, y2 : Number)
              colored(c : Color) -> Line

// Line at (x, y) with length l and anti-clockwise angle a in radians
method createLineAt(x : Number, y : Number)
             length(l : Number)
              angle(a : Number)
            colored(c : Color) -> Line

// TEXT

// Text. Has default values: Black, at (45, 48) saying "Text"
method createText -> Text

// Text saying t at (x, y) colored c
method createTextSaying(t : String)
                     at(x : Number, y : Number)
                colored(c : Color) -> Text


// IMAGE

// Image at (x, y) sized wxh from file: path
method createImageAt(x : Number, y : Number)
               sized(w : Number, h : Number)
                from(path : String) -> Image