# For my Computercraft scripts for grey goo style self-replication of turtles

## Plan:
#### Make a script for a crafty mining turtle to make infinitely many more turtles and mine everything
### Step by step plan for first turtle:
    
1. Start with mining crafty turtle with 64 Charcoal in first inventory slot
2. start by making fuel for a trip
    1. Find a tree
    2. chop it and use it for wood and saplings
    3. make a chest
    4. get some cobblestone and make a furnace
    5. make charcoal for a trip to find sand
3. find sand by traveling 
    1. decide on the travel 
    2. get sand
    3. put sand in chest
4. find redstone and diamonds
    1. dig hole near refuel base
    2. find redstone ore, hopefully near base
        1. dig one block
        2. explore all sides of that block
        3. dig out all redstone
    3. find diamonds in a similar manner
    4. put redstone back into chest
5. smelt sand into glass
    1. make sand furnace
6. make glass panes
7. smelt cobble into smooth stone
    1. make a stone furnace first
8. make a disk drive
    1. and put it in base chest
9. make paper
    1. find water
    2. go to edge of water
    3. find reeds
    4. cut reeds
    5. replant reeds near base, at closest water location, using dirt from nearby
    6. make paper from cut reeds
10. make a floppy disk
11. make a startup script for charcoal turtle
12. make a new mining turtle
13. bootstrap the charcoal turtle using disk drive and floppy
14. ???
15. Profit

## Types of turtles to craft
1. Feller turtle for logs
2. Charcoal Turtle for fuel
3. Crafting turtle for Inventory management and new turtles
4. Mining turtle for Ores (Diamonds/Redstone) and Cobble
5. Stone making turtle
6. Turtle making turtle
7. New Bootstrap turtle with a new station setup

##Useful programs

1.  [ ] First tree chopping ( Need to make a chest for crafting and saplings )
1.  [ ] Logs station setup
    1. find saplings
    2. Optionally make chest for extra Logs
    3. plant dirt for saplings
    4. put blocks above saplings to prevent big trees
2.  [ ] Logs station 
    1. plant saplings
    2. wait for them to grow
    3. gather saplings until enough for new row of trees
    4. cut down trees and replant saplings
3.  [ ] Charcoal Station setup
    1. Find cobblestone
    2. Make furnace
4.  [ ] Charcoal Station (DONE 80%)
    1. put logs into furnace top with one into furnace bottom only if empty
    2. get finished charcoal if any and refuel yourself
    3. put half of the left charcoal into chest and half into furnace until it is stocked full
    4. put all other charcoal into chest again
    5. repeat step 1
3.  [ ] Make script for finding water
    1. go down until finding grass
    2. if forward is empty go forward
    3. check if down is empty, if so go down and repeat 3
    4. check ground every time to find sand or water
    5. if sand, done grab enough of that
    6. if water, go by waters edge until you find sand, maybe underwater?
    7. if water, go underwater until bottom, and do the same steps until you find sand, grab that and go back to base
4.  [ ] Make gps, may need disk drive
5.  [ ] script to download scripts of the internet, either pastebin or by using http from github (DONE 90%)
    1. make folder making possible
    2. fix issue of pastebin not working 100%
6.  [ ] Mapping script
    1. save all scanned blocks and their coordinates to a table, may need gps
    2. Useful for finding water before iron buckets
        1. for reeds
    3. for figuring out sky tunnels for turtle travel
7.  [ ] Crafting script
    1. making sure you have enough space in inventory and getting rid of everything else
    2. making sure you have all the ingredients necessary for crafting
    3. putting all the ingredients in the correct slots
8.  [X] Initial exploration script (followGround.lua)
    1. Move through the world looking for blocks
9.  [ ] New turtle bootstrapping script
10. [ ] Ore mining script
    1. mine shaft forward and look around for veins
        2. Mine out vein by looking for specific blocks around
    2. Go back on track

## Ingredients for crafting a new turtle
#### Tools/Stations (Can be reused)

1. Chest (For keeping crafting ingredients)
    1. 8 Planks
        1. 2 Logs
2. Furnace
    1. 7 Cobblestone
    * Tools: Chest
3. Charcoal or other fuel
    * Tools: Furnace ( For Charcoal )
4. Disk Drive ( For Bootstrapping new turtles )
    1. 2 Redstone
    2. 7 Stone
        1. 7 Cobblestone
    * Tools: Furnace
5. Floppy disk
    1. Redstone
    2. Paper
        1. 3 Reeds
    * Tools: Chest

##### Ingredient totals for Tools/Stations
* 2 Logs
* 14 Cobblestone
* 3 Redstone
* 3 Reeds

#### Mining turtle
1. Turtle
    1. Computer
        1. Glass pane
            1. 6 Glass
                1. 6 Sand
        2. 7 Stone
            1. 7 Cobblestone
        3. Redstone
    2. Chest
        1. 8 Planks
            1. 2 Logs
    3. 7 Iron bars
        1. 7 Iron ore
2. Diamond pickaxe
    1. 3 Diamonds
    2. 2 Sticks
        1. 2 Planks
            1. Log

##### Ingredient totals for Mining Turtle (Excluding Tools/Stations)
* 6 Sand
* 7 Cobblestone
* 1 Redstone
* 3 Diamonds
* 3 Logs
* 7 Iron ore


