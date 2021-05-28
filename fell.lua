-- Turtle fell trees
-- Prerequisites: have a furnace and sapling
-- have charcoal in slot 1
-- every other slot empty

MIN_FUEL_LEVEL = 20
NUM_OF_TREES = 5

t = turtle
myCoal = 1
Logs = 2
Coal = 3
Sapling = 16

function refuel()
    if turtle.getFuelLevel() < MIN_FUEL_LEVEL then
        if (turtle.getItemCount(myCoal) == 1) then
            print("Out Of Fuel")
            error()
        else
            turtle.select(myCoal)
            if turtle.getItemCount(myCoal) > 5 then
                turtle.refuel(5)
            else
                turtle.refuel( turtle.getItemCount(myCoal) - 1)
            end
        end
    end
end

function makeCharcoal()
-- Start position facing the furnace
-- Put logs above
    turtle.digUp()
    turtle.up()
    turtle.dig()
    turtle.forward()
    turtle.select(Logs)
    turtle.dropDown()
    turtle.back()
    turtle.down()
-- get charcoal
    turtle.down()
    turtle.forward()
    turtle.select(Coal)
    turtle.suckUp()
-- get charcoal for yourself
    turtle.select(Coal)
    turtle.transferTo(myCoal)
-- refuel furnace
    turtle.select(Coal)
    turtle.dropUp()
    turtle.back()
    turtle.up()
-- move exess charcoal to chest
    turtle.turnRight()
    turtle.select(Coal)
    turtle.drop()
-- face the trees again
    turtle.turnRight()
    turtle.turnRight()
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
    for i=1,7,1 do
        turtle.digUp()
        turtle.up()
    end
    for i=1,7,1 do
        turtle.down()
    end
    turtle.back()
-- put sapling
    turtle.select(Sapling)
    turtle.place()
end

function step()
    refuel()
    cutTrees()
    turtle.turnRight()
    makeCharcoal()
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