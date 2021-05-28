local USERNAME = "MihailMecetin"
local REPOSITORY = "ComputerCraft"

print("Input github filename for user ".. USERNAME .. " and repo ".. REPOSITORY)
filename = read()

local url = "https://raw.githubusercontent.com/".. USERNAME .."/".. REPOSITORY .."/master/".. filename ..".lua"

content = http.get(url).readAll()

local file = fs.open(filename, "w")
file.write(content)
if fs.exists(filename) then
    print ("Overwritten file ".. filename)
else
    print ("Created file".. filename)
end
file.close()
