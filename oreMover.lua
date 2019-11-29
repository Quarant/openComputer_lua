s = require("sides")
tr = require("component").transposer

smelt = {"Lead Ore", "Boron Ore", "Iridium Ore", "Starmetal Ore", "Lithium Ore", "Copper Ore", "Tin Ore", "Galena Ore (Lead)", "Iron Ore", "tile.projectred.exploration.ore|2.name", "tile.projectred.exploration.ore|1.name", "tile.projectred.exploration.ore|0.name", "Mana Infused Ore", "Gold Ore", "Thorium Ore", "Magnesium Ore", "Silver Ore"}
grind = {"Lapis Lazuli Ore", "Oil Sand", "Oil Shale", "Destabilized Redstone Ore", "Diamond Ore", "Emerald Ore", "Black Quartz Ore", "Lunar Ore", "§eInferium Ore", "Nether Quartz Ore", "Prosperity Ore", "Redstone Ore", "Aquamarine Shale", "Pyrite Ore (Sulfur)", "Charged Certus Quartz Ore", "Coal Ore", "Certus Quartz Ore"}
imdifferent = {"Dimensional Shard Ore", "Rock Crystal Ore"}

crate = s.east
smelter = s.top
grinder = s.west
different = s.south

function checkInv(side)
  if not (tr.getInventoryName(side)) == true then
    print("Inventory " .. s[side] .. " not found")
    return 0
  end
  return 1
end

function contain(itemName, tab)
  for index, value in ipairs(tab) do
    if value == itemName then
      return true
    end
  end
  return false
end

function moveItems(side)
  for i=1,tr.getInventorySize(side) do
    if tr.getStackInSlot(side,i) then
      item = tr.getStackInSlot(side,i).label
      amount = tr.getStackInSlot(side,i).size
      if contain(item, smelt) then
        tr.transferItem(side, smelter, amount, i)
        print("Transferred " .. amount .. " " .. item .. " to " .. s[smelter])
      elseif contain(item, grind) then
        tr.transferItem(side, grinder, amount, i)
        print("Transferred " .. amount .. " " .. item .. " to " .. s[grinder])
      else
        tr.transferItem(side, different, amount, i)
        print("Transferred " .. amount .. " " .. item .. " to " .. s[different])
      end
    end
  end
  return 0
end

while true do

  if checkInv(crate) == 0 then break end
  if checkInv(smelter) == 0 then break end
  if checkInv(grinder) == 0 then break end
  if checkInv(different) == 0 then break end

  moveItems(crate)

end