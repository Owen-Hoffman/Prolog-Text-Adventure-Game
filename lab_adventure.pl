/* Dead Ringer, by Owen Hoffman. */

:- dynamic i_am_at/1, at/2, holding/1.
:- retractall(at(_, _)), retractall(i_am_at(_)), retractall(alive(_)).

/*current location */

i_am_at(cell).

/*These rules define how the rooms are connected. */

path(cell, n, hallway).

path(hallway, e, mess_hall).
path(hallway, w, infirmary).

path(infirmary, e, hallway).

path(mess_hall, s, steam_room).
path(mess_hall, n, common_room).

path(common_room, s, mess_hall).

path(steam_room, e, field).
path(steam_room, n, mess_hall).

path(field, w, steam_room).
path(field, n, beach).
path(field, e, shed) :- at(key, in_hand).
path(field, e, shed) :- 
    write('The door is locked, you can''t get in'), nl,
        !, fail.
path(field, s, wardens_house).

path(wardens_house, n, field).

path(shed, w, field).

path(beach, s, field).

/*These rules define where the objects are located. */

at(flashlight, cell).
at(compass, cell).
at(batteries, common_room).
at(scalpel, infirmary).
at(key, wardens_house).
at(canoe, shed). 

/* These rules describe how to pick up an object. */

take(X) :-
        at(X, in_hand),
        write('You''re already holding it!'),
        !, nl.

take(X) :-
        i_am_at(Place),
        at(X, Place),
        retract(at(X, Place)),
        assert(at(X, in_hand)),
        write('OK.'),
        !, nl.

take(_) :-
        write('I don''t see it here.'),
        nl.


/* These rules describe how to put down an object. */

drop(X) :-
        at(X, in_hand),
        i_am_at(Place),
        retract(at(X, in_hand)),
        assert(at(X, Place)),
        write('OK.'),
        !, nl.

drop(_) :-
        write('You aren''t holding it!'),
        nl.


/* These rules define the direction letters as calls to go/1. */

n :- go(n).

s :- go(s).

e :- go(e).

w :- go(w).


/* This rule tells how to move in a given direction. */

go(Direction) :-
        i_am_at(Here),
        path(Here, Direction, There),
        retract(i_am_at(Here)),
        assert(i_am_at(There)),
        !, look.

go(_) :-
        write('You can''t go that way.').


/* This rule tells how to look about you. */

look :-
        i_am_at(Place),
        describe(Place),
        nl.

/* This rule tells how to view your inventory. */

i :- inventory.

inventory :- 
        at(X, in_hand),  
        write(X), nl, 
        fail.

inventory :- write('That is all you have').

/* This rule tells how to use your compass. */

c :-
    i_am_at(Place),
    directions(Place),
    nl.

/* This rule tells how to use your flashlight. */

f :- 
    at(batteries, in_hand), 
    i_am_at(Place),
    notice_objects_at(Place), nl, !.

f :- 
    i_am_at(Place),
    notice_objects_at(Place), nl,
    uses.

f :- 
    batterylife(0),
    write('Your flashlight ran out of battery life. '), nl.

/* This rule gives the flashlight a battery life. */

batterylife(6).

uses :-
    batterylife(x),
    x = x - 1,
    retract(batterylife(_)),
    assert(batterylife(x)),
    write('Flashlight uses left '), write(x), nl.


/* This rule tells how to inspect objects. */

inspect(Object) :-
        examine(Object),
        nl.
        

/* These rules set up a loop to mention all the objects
   in your vicinity. */

notice_objects_at(Place) :-
        at(X, Place),
        write('There is a '), write(X), write(' here.'), nl,
        fail.

notice_objects_at(_).


/* This rule tells how to die. */

die :-  
        write(' ...The island takes another victim... '), nl,
        finish.


/* Under UNIX, the "halt." command quits Prolog but does not
   remove the output window. On a PC, however, the window
   disappears before the final output can be seen. Hence this
   routine requests the user to perform the final "halt." */

finish :-
        nl,
        write('The game is over. Please enter the "halt." command.'),
        nl.


/* This rule just writes out game instructions. */

instructions :-
        nl,
        write('Enter commands using standard Prolog syntax.'), nl,
        write('Available commands are:'), nl,
        write('start.             -- to start the game.'), nl,
        write('n.  s.  e.  w.     -- to go in that direction.'), nl,
        write('look.              -- to look around you.'), nl,
        write('f.                 -- to use your flashlight and view objects around you.'), nl,
        write('c.                 -- to use your compass gain directions.'), nl,
        write('i.                 -- to view your inventory.'), nl,
        write('inspect(Object).   -- to gain information about an object.'), nl,
        write('take(Object).      -- to pick up an object.'), nl,
        write('drop(Object).      -- to put down an object.'), nl,
        write('instructions.      -- to see this message again.'), nl,
        write('halt.              -- to end the game and quit.'), nl,
        nl.


/* This rule prints out instructions and tells where you are. */

start :-
        write('Dead Ringer, by Owen Hoffman'), nl,
        instructions,
        look.

/* These rules describe various objects. */

examine(compass) :-
    write('You pick up a compass '), nl, 
    write('You can use this to gain directions. '), nl.

examine(scalpel) :-
    write('You pick up a medical scalpel. '), nl,
    write('Although the blade has some rust it is still razor sharp. '), nl.

examine(flashlight) :-
    write('You pick up the flashlight. '), nl, 
    write('This will allow you to view objects in a room. '), nl,
    write('Be warned, it has a limited battery life. '), nl.

examine(batteries) :-
    write('You pick up batteries. '), nl, 
    write('They fit into the flashlight. '), nl,
    write('These will greatly extend the flashlights battery life. '), nl.

examine(key) :-
    write('You pick up the key. '), nl, 
    write('It has a curious dark stain on the end. '), nl.

examine(canoe) :-
    write('The canoe is tiny. You can carry it easily. '), nl, 
    write('There is a chip in the side but it looks like it can float. '), nl.

/* These rules give the directions for each room. */

directions(cell) :-
    write('The empty hall lies to the North. '), nl.

directions(hallway) :-
    write('To the east lies the Mess Hall. '), nl,
    write('To the west lies the Infirmary, from it comes the only visible source of light. '), nl.

directions(infirmary) :-
    write('The only way out is back through the hall to the east.'), nl.

directions(mess_hall) :-
    write('To the south is the steam room in the basement. '), nl,
    write('To the north is the common room. '), nl.

directions(common_room) :-
    write('The only way out is back to the mess hall to the south. '), nl.

directions(steam_room) :-
    write('To the east you see moonlight. '), nl,
    write('The mess hall is back to the north'), nl.

directions(field) :-
    write('To the north you what could be a body of water. '), nl,
    write('To the east you see what appears to be an old shed. '), nl,
    write('The steam room is back to the west. '), nl,
    write('And to the south is a large house. '), nl.

directions(wardens_house) :-
    write('There is nowhere to go but back to the field to the north. '), nl.

directions(shed) :-
    write('The field is back to the west. '), nl.

directions(beach) :-
    write('The field is back to the south. '), nl.

/* These rules describe the various rooms.  Depending on
   circumstances, a room may have more than one description. */

describe(cell) :-
        write('You wake up groggy in a dank, damp cell. '), nl,
        write('You have no memory of how you got here. '), nl,
        write('The cells furnishings consist of a cot, desk, and a mirror. '), nl,
        write('A flashlight and a compass lie on the desk. '), nl,
        write('You stagger to the cell door, not thinking clearly. '), nl,
        write('Curiously the door swings open at your touch and you realize that the lock is old and rusty. '), nl.

describe(hallway) :-
        write('The hall is dark. '), nl,
        write('You see a dimly lit sign on the wall. '), nl,
        write('You are in the dormitory section of what appears to be an abandoned prison. '), nl.

describe(infirmary) :-
        write('The infirmary is lit by a single flickering overhead light. '), nl,
        write('The room contains an operating table and mounds of files.'), nl.

describe(mess_hall) :-
        write('The mess hall is deserted and dark. '), nl.

describe(common_room) :-
        at(scalpel, in_hand),
        write('You go into the dark room.'), nl,
        write('Suddenly, a large man lunges at you from the dark.'), nl,
        write('You raise the sharp scalpel. '), nl,
        write('The man runs into it, before falling in a heap.'), nl,
        write('Shaking, you look around the room.'), nl, !.

describe(common_room) :-
        write('You go into the dark room.'), nl,
        write('Suddenly, a large man lunges at you from the dark.'), nl,
        write('He crashes into you, knocking you to the ground.'), nl,
        write('Your head hits the concrete floor as you fall.'), nl,
        die.
 
describe(steam_room) :-
        write('The steam room is dark and moldy. '), nl.

describe(field) :-
        write('You find yourself in a large field, lit by the full moon. '), nl.

describe(wardens_house) :-
        write('The house is run down. '), nl,
        write('The door opens easily. '), nl.

describe(shed) :-
        write('This shed was used to hold recreational equipment. '), nl,
        write('Maybe there is something useful here. '), nl.

describe(beach) :-
        at(canoe, in_hand),
        write('You are standing on a rocky beach. '), nl,
        write('You place the canoe in the water, it floats precariously'), nl,
        write('You carefully get into the canoe and paddle away. '), nl,
        write('You have escaped the prison with your life. '), nl,
        write('CONGRAGULATIONS!'), nl,
        finish, !.

describe(beach) :-
        write('You are standing on a rocky beach. '), nl,
        write('You can see land in the distance. '), nl,
        write('Safety, only seperated from you by miles of water. '), nl,
        write('If only you had some kind of boat...'), nl.

