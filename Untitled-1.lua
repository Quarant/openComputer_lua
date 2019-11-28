local tr = require("component").transposer
local s = require("sides")
local os = require("os")

function getInventorySizeContr()
    return tr.getInventorySize(s.south)
end

function getNameInContr(slot)
    if(tr.getStackInSlot(s.south,slot) ~= nil) then
        return tr.getStackInSlot(s.south,slot).name
    end
    return ""
end

function checkIfCrafterEmpty()
    local slots = tr.getInventorySize(s.up)
    for slot=1,slots do
        if(tr.getStackInSlot(s.up,slot) ~= nil) then
            return false
        end
    end
    return true
end

function isItemValid(slot)
    local item = tr.getStackInSlot(s.south,slot)
    if(item.size>=4) then
        return true
    end
    return false
end

function putItemIntoCrafter(slot)
    --tr.transferItem(side from , site to, amout, slot from , slot to)
    tr.transferItem(s.south,s.up,1,slot,1)
    tr.transferItem(s.south,s.up,1,slot,2)
    tr.transferItem(s.south,s.up,1,slot,4)
    tr.transferItem(s.south,s.up,1,slot,5)
end

function main()
    for slot=2,getInventorySizeContr() do
        if(string.find(getNameInContr(slot), "item_ore" ) ~=nil) then
            if(isItemValid(slot) and checkIfCrafterEmpty() and isItemValid(slot)) then
                print("putting "..getNameInContr(slot))
                putItemIntoCrafter(slot)
            end
        end


    end
end