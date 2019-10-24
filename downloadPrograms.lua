-- This program downloads /updates programs from my github repositories.
-- To download it run "wget 'http://pastebin.com/download.php?i=G61bgv29' /bin/hello.lua"

programs = {}
programs[1] = {"refuel.lua", "Ey7PuYJ5"}
programs[2] = {"tower.csv", "D1zKyGfA"}
programs[3] = {"builder.lua", "EyhBbj77"}
programs[4] = {"plantFarm.lua", "uYYMNEA2"}
programs[5] = {"harvestFarm.lua", "p0QmVs7Y"}
programs[6] = {"buildFarm.lua","X7nWKCL9"}
programs[7] = {"downloadPrograms.lua", "shCjG4FE"}
programs[8] = {"waller.lua", "0XcTrFTm"}
programs[9] = {"towerCoords.csv", "CA52c0w9"}
programs[10] = {"build.lua", "ADjcdXmX"}
programs[11] = {"dig2.lua", "bEQ4b4rS"}

function tableLength(table)
  count = 1
  while table[count] ~= nil do
    count=count+1
  end
  return count-1
end

for i=1, tableLength(programs) do 
  os.execute("pastebin get -f "..programs[i][2].." "..programs[i][1])
end
