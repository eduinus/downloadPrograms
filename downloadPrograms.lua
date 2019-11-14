-- This program downloads / updates programs from my github repositories into the current directory.
-- wget -f 'https://raw.githubusercontent.com/eduinus/downloadPrograms/master/downloadPrograms.lua' "downloadPrograms.lua"
-- wget [-f] <download url> <path to the new file + filename>

repos = {}
repos[1] = {"downloadPrograms","/downloadPrograms.lua"}
repos[2] = {"dig2","/dig2.lua"}
repos[3] = {"builder","/builder.lua","/schematics/johnTower.csv","/schematics/wallTower.csv"}
repos[4] = {"waller","/waller.lua","/towerCoordinates.csv"}
repos[5] = {"farming","/buildFarm.lua","/harvestFarm.lua","/plantFarm.lua"}
repos[6] = {"railer","/railer.lua"}
repos[7] = {"inventoryManager","/inventoryServer.lua","/inventoryViewer.lua"}

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
    os.execute("mkdir "..repos[repoI][1])
    os.execute("wget -f 'https://raw.githubusercontent.com/eduinus/"..repos[repoI][1].."/master/README.md' "..repos[repoI][1].."/README.md")
    for fileI=2, tableLength(repos[repoI]) do
      os.execute("wget -f 'https://raw.githubusercontent.com/eduinus/"..repos[repoI][1].."/master"..repos[repoI][fileI].."' "..repos[repoI][1]..repos[repoI][fileI])
    end
  end
elseif search(repos,target) ~= false then
  os.execute("wget -f 'https://raw.githubusercontent.com/eduinus/"..target.."/master/README.md' "..repos[repoI][1].."/README.md")
  for fileI=2, tableLength(repos[search(repos,target)]) do
    os.execute("wget -f 'https://raw.githubusercontent.com/eduinus/"..target.."/master"..repos[search(repos,target)][fileI].."' "..repos[search(repos,target)][1]..repos[search(repos,target)][fileI])
  end
else
  print("No such program found.")
  return
end
