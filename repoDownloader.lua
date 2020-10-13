-- This program downloads / updates programs from my github repositories into the current directory.
-- wget -f 'https://raw.githubusercontent.com/eduinus/repoDownloader/master/repoDownloader.lua' "repoDownloader.lua"
-- wget [-f] <download url> <path to the new file + filename>

repos = {}
repos[1] = {"repoDownloader","/repoDownloader.lua"}
repos[2] = {"superDigger","/superDigger.lua"}
repos[3] = {"builder","/builder.lua","/schematics/johnTower.csv","/schematics/wallTower.csv"}
repos[4] = {"waller","/waller.lua","/towerCoordinates.csv"}
repos[5] = {"farmer","/buildFarm.lua","/harvestFarm.lua","/plantFarm.lua"}
repos[6] = {"railer","/railer.lua"}
repos[7] = {"inventoryManager","/inventoryServer.lua","/inventoryTerminal.lua","/inventoryRelay.lua"}
repos[8] = {"droner","/droneBios.lua","/droneServer.lua"}

function tableLength(table)
  count = 1
  while table[count] ~= nil do
    count=count+1
  end
  return count-1
end

function search(table,term)
  for it=1, tableLength(table) do
    if table[it][1] == term then
      return it
    end
  end
  return false
end

print("Download All?:         (Y or [Specific Repo])")
target = io.read()
  
if target == "y" or target == "Y" then
  for repoI=1, tableLength(repos) do
    pcall(os.execute("mkdir "..repos[repoI][1])) os.execute("clear")
    if repoI == 3 then os.execute("mkdir builder/schematics") end os.execute("clear")
    
    os.execute("wget -f 'https://raw.githubusercontent.com/eduinus/"..repos[repoI][1].."/master/README.md' "..repos[repoI][1].."/README.md")
    for fileI=2, tableLength(repos[repoI]) do
      os.execute("wget -f 'https://raw.githubusercontent.com/eduinus/"..repos[repoI][1].."/master"..repos[repoI][fileI].."' "..repos[repoI][1]..repos[repoI][fileI])
    end
  end
os.execute("clear")
print("Updated all repos.")
elseif search(repos,target) ~= false then
  repoX = search(repos,target)
  pcall(os.execute("mkdir "..repos[repoX][1])) os.execute("clear")
  if repoX == 3 then os.execute("mkdir builder/schematics") end os.execute("clear")
  
  os.execute("wget -f 'https://raw.githubusercontent.com/eduinus/"..target.."/master/README.md' "..repos[repoX][1].."/README.md")
  for fileI=2, tableLength(repos[repoX]) do
    os.execute("wget -f 'https://raw.githubusercontent.com/eduinus/"..target.."/master"..repos[repoX][fileI].."' "..repos[repoX][1]..repos[search(repos,target)][fileI])
  end
os.execute("clear")
print("Updated "..repos..".")
else
  print("No such program found.")
  return
end
