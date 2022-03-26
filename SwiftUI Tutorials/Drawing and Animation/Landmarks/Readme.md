# Drawing and Animation

## Drawing Paths and Shapes

### Draw the Badge Background
* Add a starting point to the path  
The move(to:) method moves the drawing cursor within the bounds of a shape as though an imaginary pen or pencil is hovering over the area, waiting to start drawing.

### Draw the Badge Symbol
* GeometryReader  
You use GeometryReader to dynamically draw, position, and size views instead of hard-coding numbers that might not be correct when you reuse a view somewhere else in your app, or on a different-sized display.    
GeometryReader dynamically reports size and position information about the parent view and the device, and updates whenever the size changes; for example, when the user rotates their iPhone.

## Animating Views and Transitions

Hike data will not be modified after initially loaded. So no need to mark it with the @Published attribute.

.scaleEffect(), .rotationEffect(), .animation(), withAnimation()
