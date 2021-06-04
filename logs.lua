-- Turtle to fell trees and put logs in a chest
--Prerequisites: 
-- have at least 1 sapling in slot 16
-- have any fuel in slot 1
-- every other slot empty
--Setup: (o-tree, T-turtle, c-chest)
-- ooooo
--     Tc

-- TODO: 
-- check the detectBlock function
-- add detectBlock to sapling gathering func. (cutTree)
-- add MIN_SAPLInGS_NUM logic
-- add script for planting just enough saplings as the turt. has
-- make sure to not get too many saplings
-- move the refuel function to separate file and test

-- TODO MAYBE:
-- plant the max amount of saplings
-- check/put dirt for new saplings
-- multiple rows of saplings? definite maybe with more turtles.
-- maybe change setup to be:
-- ...ooooTc instead of 2 lines, would be faster and take less space


MIN_FUEL_LEVEL = 20
NUM_OF_TREES = 5 -- limit 32
MIN_SAPLINGS_NUM = 10
TREE_HEIGHT = 7

t = turtle
Fuel = 1
Logs = 2
Saplings = 16

function refuel()
    if turtle.getFuelLevel() < MIN_FUEL_LEVEL then
        -- if last fuel item, stop
        if (turtle.getItemCount(Fuel) == 1) then
            print("Out Of Fuel")
            error()
        else
        -- refuel with 5 items
            turtle.select(Fuel)
            if turtle.getItemCount(Fuel) > 5 then
                turtle.refuel(5)
            else
                turtle.refuel( turtle.getItemCount(Fuel) - 1)
            end
        end
    end
end

function putLogs()
-- put all excess logs into chest
-- starts by facing the chest
-- get fuel for yourself
    turtle.select(Logs)
    turtle.transferTo(Fuel, turtle.getItemSpace(Fuel))
-- move exess Logs to chest
    turtle.select(Logs)
    dropped, reason = turtle.drop()
    if (not dropped) then
        error(reason)
    end
end

function cutTrees()
-- Starts and ends facing the first tree
    for i = 1, NUM_OF_TREES - 1, 1 do
        if detectLog() then
            cutTree()
        end
        turtle.turnLeft()
        turtle.forward()
        turtle.turnRight()
    end
    if detectLog() then
        cutTree()
    end
    turtle.turnRight()
    for i = 1, NUM_OF_TREES - 1, 1 do
        turtle.forward()
    end
    turtle.turnLeft()
end

function cutTree()
    turtle.select(Logs)
    turtle.dig()
    turtle.forward()
    for i=1,TREE_HEIGHT,1 do
        turtle.digUp()
        turtle.up()
    end
    for i=1,TREE_HEIGHT,1 do
-- gather saplings on way down
        turtle.select(Saplings)
        turtle.dig()
        turtle.turnRight()
        turtle.dig()
        turtle.turnRight()
        turtle.dig()
        turtle.turnRight()
        turtle.dig()
        turtle.turnRight()
        turtle.down()
    end
    turtle.back()
-- put sapling
    turtle.select(Saplings)
    turtle.place()
end

function step()
    refuel()
    cutTrees()
    turtle.turnRight()
    putLogs()
    turtle.turnLeft()
end

function detectBlock(blockName, side)
    if side == "up" then
        success, data = turtle.inspectUp()
    elseif side == "down" then
        success, data = turtle.inspectDown()
    elseif side == "forward" then
        success, data = turtle.inspect()
    else 
        error("no such side, could only be up, down or forward")
    end
    return string.match(data.name, blockName)
end

function detectLog()
    success, data = turtle.inspect()
    if data.name == "minecraft:log" then
        return true
    else
        return false
    end
end

--stepnumber = read()
while true do
    if detectLog() then
        step()
    end
    os.sleep(10)
end