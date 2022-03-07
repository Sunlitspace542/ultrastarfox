# Map Macros (WORK IN PROGRESS)
## Short blurb about maps
Levels (maps) in Star Fox essentially consist of a timed sequence of objects that spawn at certain points as the player gets further into the level.

## Macros

``mapwait (number)`` stop level script for specified amount divided by 16(?)  
``mapobj (frame,x,y,shape,strategy)`` spawns a specified shape & strat combo on a specified frame and position (X and Y only)  
``mapdobj (frame,x,y,z,shape,strategy)`` (appears to be) Same as ``mapobj``, but with an extra parameter for the Z position.  
``mapqnobj  (frame,x,y,z,shape,strategy)`` (appears to be) Same as ``mapdobj``  
``mapqobj (frame,x,y,z,shape,strategy)`` (appears to be) Same as ``mapdobj``  
``pathobj (wait,x,y,z,shape,path,hp,ap)`` Spawn a PATH & shape combo after a specified amount of time at a specified position, with defined health and attack points.  
