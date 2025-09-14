/*
    Project 01
    
    Requirements (for 15 base points)
    - Create an interactive fiction story with at least 8 knots 
    - Create at least one major choice that the player can make
    - Reflect that choice back to the player
    - Include at least one loop
    
    To get a full 20 points, expand upon the game in the following ways
    [+2] Include more than eight passages
    [+1] Allow the player to pick up items and change the state of the game if certain items are in the inventory. Acknowledge if a player does or does not have a certain item
    [+1] Give the player statistics, and allow them to upgrade once or twice. Gate certain options based on statistics (high or low. Maybe a weak person can only do things a strong person can't, and vice versa)
    [+1] Keep track of visited passages and only display the description when visiting for the first time (or requested)
    
    Make sure to list the items you changed for points in the Readme.md. I cannot guess your intentions!

*/

VAR health = 5
VAR torches = 0
VAR mirror_shards = 0
VAR time = -1

-> cave_mouth



== cave_mouth ==
You are at the enterance to a cave. {not torch_pickup:There is a torch on the floor.} The cave extends to the east and west.

You have {torches} torches.

You look at your watch. It's currently {advance_time()}.

+ [Take the east tunnel] -> east_tunnel
+ [Take the west tunnel] -> west_tunnel
* [Pick up the torch] -> torch_pickup

== east_tunnel ==

You are in the east tunnel. It is very dark, you can't see anything. {not torch_pickup:Maybe a torch could help.}



* {torches > 0} [Light Torch] -> east_tunnel_lit
+ [Go Back] -> cave_mouth
-> END

== west_tunnel ==
You are in the west. It is very dark, you can't see anything. {not torch_pickup:Maybe a torch could help.}



* {torches > 0} [Light Torch] -> west_tunnel_lit
+ [Go Back] -> cave_mouth
-> END

=== torch_pickup ===
~ torches = torches + 1
You now have a torch. May it light the way.
* [Go Back] -> cave_mouth
-> END

== east_tunnel_lit ==
The light of your torch glints off of the thousands of coins in the room, but you also see a small glint in the corner of your eye.

You look at your watch. It's currently {advance_time()}.

Do you:

* {mirror_shards > 0} [Investigate?] -> lock
* [Take the coins and leave?] -> leave

== west_tunnel_lit ==
You're in a cavern made of a glass-like substance.

You look at your watch. It's currently {advance_time()}.

Do you:

* [Go closer to the glass] -> spirits
* [Go back] -> cave_mouth

== spirits ==

As you go over to the glass, you see the outline of all your loved ones calling out to you.

You look at your watch. It's currently {advance_time()}.

Do you: 
* [Reach out to them?] -> mirror_realm
* [Retreat?] -> cave_mouth

== mirror_realm ==
As you reach out to them, you fall into the mirror.

Do you:

* [Try to go back?] -> trapped
* [Look around?] -> exit

== trapped ==
You try to escape and realize that you're completely trapped.

GAME OVER
->END

== exit ==
~ mirror_shards = mirror_shards + 1
You look around and manage to find an exit. You leave, and realize that you have a shard of the mirror from that place in your pocket.

You look at your watch. It's currently {advance_time()}.

You have {mirror_shards} mirror shards.

* [Go back] -> cave_mouth

== leave ==
You take the coins and leave.
-> END

== lock ==
As you investigate, you see a lock with a keyhole the exact shape of the mirror shard that you have.

You look at your watch. It's currently {advance_time()}.

Do you:

* [Insert the shard?] -> more_treasure
* [Just take the coins and leave?] -> leave

== more_treasure ==
~ mirror_shards = mirror_shards - 1 

You open the lock, and you see even more treasure than what was outside of this locked area.

You look at your watch. It's currently {advance_time()}.

* [Take everything and leave.] -> leave_better

== leave_better ==
Now that you have even more treasure than you would've had if you would have if you only took the original coins, you can leave happy.
-> END







== function advance_time ==

    ~ time = time + 1
    
    {
        - time > 23:
            ~ time = 0
    }    
    
    {    
        - time == 0:
            ~ return "9:00 am"
            
        - time == 1:
            ~ return "10:00 am"
            
        - time == 2:
            ~ return "11:00 am"
        
        - time == 3:
            ~ return "12:00 pm"
            
        - time == 4:
            ~ return "1:00 pm"
        
        - time == 5:
            ~ return "2:00 pm"
            
        - time == 6:
            ~ return "3:00 pm"
            
        - time == 7:
            ~ return "4:00 pm"
            
        - time == 8:
            ~ return "5:00 pm"
            
        - time == 9:
            ~ return "6:00 pm"
            
        - time == 10:
            ~ return "7:00 pm"
            
        - time == 11:
            ~ return "8:00 pm"
            
        - time == 12:
            ~ return "9:00 pm"
        
        - time == 13:
            ~ return "10:00 pm"
            
        - time == 14:
            ~ return "11:00 pm"
            
        - time == 15:
            ~ return "12:00 am"
            
        - time == 16:
            ~ return "1:00 am"
            
        - time == 17:
            ~ return "2:00 am"
            
        - time == 18:
            ~ return "3:00 am"
            
        - time == 19:
            ~ return "4:00 am"
            
        - time == 20:
            ~ return "5:00 am"
            
        - time == 21:
            ~ return "6:00 am"
            
        - time == 22:
            ~ return "7:00 am"
            
        - time == 23:
            ~ return "8:00 am"
    
    }
    
    
        
    ~ return time