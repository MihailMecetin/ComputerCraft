local url = "https://raw.githubusercontent.com/MihailMecetin/ComputerCraft/master/fell.lua"

content = http.get(url).readAll()

local file = fs.open("file", "w")
file.write(content)

file.close()
