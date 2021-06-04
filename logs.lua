-- Turtle to fell trees and put logs in a chest
--Prerequisites: 
-- have at least 1 sapling in slot 16
-- have any fuel in slot 1
-- every other slot empty
--Setup: (o-tree, T-turtle, c-chest)
-- ooooo
--     Tc

-- TODO: 
-- Add the throw all the rest of the items in the chest logic (e.g. apples, sticks)
-- add MIN_SAPLInGS_NUM logic
-- add the variable tree height logic
-- add script for planting just enough saplings as the turt. has
--  make sure to not get too many saplings
-- move the refuel function to separate file and test

-- TODO MAYBE:
-- plant the max amount of saplings
-- check/put dirt for new saplings
-- multiple rows of saplings? definite maybe with more turtles.
-- maybe change setup to be:
-- ...ooooTc instead of 2 lines, would be faster and take less space
-- add variable arg count to detectblock funct.

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
            error("Out Of Fuel")
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
-- move excess Logs to chest
    turtle.select(Logs)
    dropped, reason = turtle.drop(turtle.getItemCount(Logs))
    if (not dropped) then
        error(reason)
    end
-- move everything else too
    turtle.select(3)
    turtle.drop()
    turtle.select(4)
    turtle.drop()
    turtle.select(5)
    turtle.drop()
end

function cutTrees()
-- Starts and ends facing the first tree
    for i = 1, NUM_OF_TREES, 1 do
        if detectBlock("log", "forward") then
            cutTree()
        elseif (not turtle.detect()) then
            -- if nothing is growing, put sapling
            turtle.select(Saplings)
            turtle.place()
        end
        -- move to face the next tree, if not at last tree
        if i < NUM_OF_TREES then
            turtle.turnLeft()
            forwardDig()
            turtle.turnRight()
        end
    end
    turtle.turnRight()
    for i = 1, NUM_OF_TREES - 1, 1 do
        forwardDig()
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
        for sides=1,4,1 do
            if detectBlock("leaves", "forward") then 
                turtle.dig()
            end
            turtle.turnRight()
        end
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
    if success then return string.match(data.name, blockName)
    else return false
    end
end

function forwardDig()
-- like turtle.forward() but digs block in front
    if turtle.detect() then turtle.dig() end
    turtle.forward()
end

--stepnumber = read()
while true do
    if detectBlock("log", "forward") then
        step()
    end
    os.sleep(10)
end