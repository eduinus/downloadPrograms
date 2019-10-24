-- This program downloads / updates programs from my github repositories into the current directory.
-- wget -f 'https://raw.githubusercontent.com/eduinus/downloadPrograms/master/downloadPrograms.lua' downloadPrograms.lua"
-- wget [-f] <download url> <path to the new file + filename>

repos = {}
repos[1] = {"downloadPrograms","/downloadPrograms.lua"}
repos[2] = {"dig2","/dig2.lua"}
repos[3] = {"builder","/builder.lua","/schematics/johnTower.csv","/schematics/wallTower.csv"}
repos[4] = {"waller","/waller.lua","/towerCoordinates.csv"}
repos[5] = {"farming","/buildFarm.lua","/harvestFarm.lua","/plantFarm.lua"}
repos[6] = {"railer","/railer.lua"}

function tableLength(table)
  count = 1
  while table[count] ~= nil do
    count=count+1
  end
  return count-1
end

for repoI=1, tableLength(repos) do 
  os.execute("wget -f https://raw.githubusercontent.com/eduinus/"..repos[repoI][1].."/master/README.md /README.md")
  for fileI=2, tableLength(repos[repoI]) do
    os.execute("wget -f https://raw.githubusercontent.com/eduinus/"..repos[repoI][1].."/master"..repos[repoI][fileI].." "..repos[repoI][fileI])
  end
  get "/README.md"
  only update one program?
  clear directory?
end
