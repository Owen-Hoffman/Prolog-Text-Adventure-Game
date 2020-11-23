Dead Ringer, by Owen Hoffman

Description:

    This game is about a patient waking up in a deserted prison with no memory of how she got there.
    Plot your escape and don't get caught.

Instructions:

        Available commands are:
        start.                   -- to start the game.
        n.  s.  e.  w.  u.  d.   -- to go in that direction.
        inspect.                 -- to inspect object.
        take(Object).            -- to pick up an object.
        drop(Object).            -- to put down an object
        instructions.            -- to see this message again.
        halt.                    -- to end the game and quit.
        look.                    -- to look around you.
        f.                       -- to use your flashlight and view objects around you.
        c.                       -- to use your compass gain directions.
        i.                       -- to view inventory.

Requirements:

locked door - There is a locked shed that requires a key.
hidden object - All objects are hidden and require the flashlight to find.
incomplete object - The flashlight needs batteries to continue using
limited resources - The flahlight will run out of power if used too much.
Inventory - the objects you are holding can be viewed with i.

Trascription:

?- start.
Dead Ringer, by Owen Hoffman

Enter commands using standard Prolog syntax.
Available commands are:
start.             -- to start the game.
n.  s.  e.  w.     -- to go in that direction.
look.              -- to look around you.
f.                 -- to use your flashlight and view objects around you.
c.                 -- to use your compass gain directions.
i.                 -- to view your inventory.
inspect(Object).   -- to gain information about an object.
take(Object).      -- to pick up an object.
drop(Object).      -- to put down an object.
instructions.      -- to see this message again.
halt.              -- to end the game and quit.

You wake up groggy in a dank, damp cell. 
You have no memory of how you got here. 
The cells furnishings consist of a cot, desk, and a mirror. 
A flashlight and a compass lie on the desk. 
You stagger to the cell door, not thinking clearly. 
Curiously the door swings open at your touch and you realize that the lock is old and rusty. 

true.

?- take(flashlight).
OK.
true.

?- inspect(flashlight).
You pick up the flashlight. 
This will allow you to view objects in a room. 
Be warned, it has a limited battery life. 

true.

?- i.
flashlight
That is all you have
true.

?- c.
The empty hall lies to the North. 

true.

?- n.
The hall is dark. 
You see a dimly lit sign on the wall. 
You are in the dormitory section of what appears to be an abandoned prison. 

true.

?- f.

false.

?- c.
To the east lies the Mess Hall. 
To the west lies the Infirmary, from it comes the only visible source of light. 

true.

?- w.
The infirmary is lit by a single flickering overhead light. 
The room contains an operating table and mounds of files.

true.

?- f.
There is a scalpel here.

false.

?- take(scalpel).
OK.
true.

?- c.
The only way out is back through the hall to the east.

true.

?- e.
The hall is dark. 
You see a dimly lit sign on the wall. 
You are in the dormitory section of what appears to be an abandoned prison. 

true.

?- c.
To the east lies the Mess Hall. 
To the west lies the Infirmary, from it comes the only visible source of light. 

true.

?- e.
The mess hall is deserted and dark. 

true.

?- f.

false.

?- c.
To the south is the steam room in the basement. 
To the north is the common room. 

true.

?- n.
You go into the dark room.
Suddenly, a large man lunges at you from the dark.
You raise the sharp scalpel. 
The man runs into it, before falling in a heap.
Shaking, you look around the room.

true 
Unknown action: f (h for help)
Action? .

?- f.
There is a batteries here.

false.

?- take(batteries).
OK.
true.

?- c.
The only way out is back to the mess hall to the south. 

true.

?- s.
The mess hall is deserted and dark. 

true.

?- c.
To the south is the steam room in the basement. 
To the north is the common room. 

true.

?- s.
The steam room is dark and moldy. 

true.

?- f.

true .

?- c.
To the east you see moonlight. 
The mess hall is back to the north

true.

?- e.
You find yourself in a large field, lit by the full moon. 

true.

?- c.
To the north you what could be a body of water. 
To the east you see what appears to be an old shed. 
The steam room is back to the west. 
And to the south is a large house. 

true.

?- e.
The door is locked, you can't get in
You can't go that way.
true.

?- s.
The house is run down. 
The door opens easily. 

true.

?- f.
There is a key here.

true 
Unknown action: i (h for help)
Action? ;
There is a key here.

false.

?- inspect(key).
You pick up the key. 
It has a curious dark stain on the end. 

true.

?- take(key).
OK.
true.

?- c.
There is nowhere to go but back to the field to the north. 

true.

?- n.
You find yourself in a large field, lit by the full moon. 

true.

?- c.
To the north you what could be a body of water. 
To the east you see what appears to be an old shed. 
The steam room is back to the west. 
And to the south is a large house. 

true.

?- e.
This shed was used to hold recreational equipment. 
Maybe there is something useful here. 

true.

?- f.
There is a canoe here.

?- take(canoe).
OK.
true.

?- c.
The field is back to the west. 

true.

?- w.
You find yourself in a large field, lit by the full moon. 

true.

?- c.
To the north you what could be a body of water. 
To the east you see what appears to be an old shed. 
The steam room is back to the west. 
And to the south is a large house. 

true.

?- n.
You are standing on a rocky beach. 
You place the canoe in the water, it floats precariously
You carefuly get into the canoe and paddle away. 
You have escaped the prison with your life. 
CONGRAGULATIONS!

The game is over. Please enter the "halt." command.

true.

?- 