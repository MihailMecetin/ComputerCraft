local USERNAME = "MihailMecetin"
local REPOSITORY = "ComputerCraft"

print("Input github filename for user ".. USERNAME .. " and repo ".. REPOSOTORY)
input filename

local url = "https://raw.githubusercontent.com/".. USERNAME .."/".. REPOSITORY .."/master/".. filename ..".lua"

content = http.get(url).readAll()

local file = fs.open("file", "w")
file.write(content)

file.close()
