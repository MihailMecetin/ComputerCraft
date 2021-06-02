-- THis script follows the ground and checks what is underneath it
-- for scouting and finding blocks
-- 1) movement 2) max height 3) number of steps taken

-- 1 if nothing down go down,
-- 2 if cannot do down,    if nothing in front   , go forward 1 time, GOTO 1
-- 3 if cannot go forward, if nothing above      , go up      1 time, GOTO 2
-- 4 if cannot go up,      if nothing in the back, go back    1 time, GOTO 3
-- 5 if cannot go back     if nothing below      , go down    1 time, GOTO 4
-- 6 if cannot go down                             break block below  GOTO 5

function refuel()
    if turtle.getFuelLevel() < 10 then
        print("refueling")
        turtle.select(1)
        turtle.refuel(1)
    end
end

function goLowest()
    while not turtle.detectDown() do
        turtle.down()
    end
    refuel()
end

function detectBack()
    turtle.turnRight()
    turtle.turnRight()
    data = turtle.detect()
    turtle.turnRight()
    turtle.turnRight()
    return data
end

function dForward() 
    refuel()
    if not turtle.detect() 
    then 
        turtle.forward()
        -- step counter logic here 
    else dUp()
    end
    goLowest()
end

function dUp()
    if not turtle.detectUp() 
    then turtle.up() 
    else dBack()
    end
    dForward()
end

function dBack()
    if not detectBack()
    then turtle.back() 
    else dDown()
    end
    dUp()
end

function dDown()
    if not turtle.detectDown()
    then turtle.down()
    else turtle.digDown()
    end
    dBack()
end

for i = 1,50,1 do
    refuel()
    goLowest()
    -- inspect block logic here
    dForward()
    -- inspect block here again after 1 step forward.
    print("Finished followGround")
end
    
