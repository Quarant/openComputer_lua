local s = require("sides")
local tr = require("component").transposer
local bloodmagicAltar = s.west
local drawerController = s.north
local amount = 64


function getProcentageAltar()
    if(tr.getFluidInTank) then
        return tr.getFluidInTank(bloodmagicAltar)[1].amount/tr.getFluidInTank(bloodmagicAltar)[1].capacity
    end
    return 0
end

function getStoneSlot()
    for i=2,tr.getInventorySize(drawerController) do
        local slotInfo = tr.getStackInSlot(drawerController,i)
        if(slotInfo and slotInfo.name == "minecraft:stone") then
            return i
        end
    end
    return -1
end

function getSlotLowestSlate()
    min = 999
    slot = 2
    slateTier = 99
    for i=2,tr.getInventorySize(drawerController) do
        local slotInfo = tr.getStackInSlot(drawerController,i)
        if(slotInfo) then
            if (slotInfo.size < min  and slotInfo.name == "bloodmagic:slate" and slot.size < amount and slotTier < slot.damage ) then
                min = slotInfo.size
                slot = i
                slateTier = slotInfo.damage
            end
        end
    end
    return slot
end

function doWorkAltar(stoneSlot)
    altarSlotInfo = tr.getStackInSlot(bloodmagicAltar,1)
    lowestSlate = tr.getStackInSlot(drawerController,getSlotLowestSlate())
    if(altarSlotInfo) then

    end
end

function main()
    local stoneSlot = getStoneSlot()
    if(stoneSlot~=-1 and getProcentageAltar() > 0.7) then


    end
end