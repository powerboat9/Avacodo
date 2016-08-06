local isSpotTaken(allocs, x, y)
    return allocs[y][x].id == 0
end

local isBlockTaken(allocs, startX, startY, endX, endY)
    for y = startY, endY do
        for x = startX, endX do
            if allocs[y][x] ~= 0 then
                return true
            end
        end
    end
    return false
end

local function discover(allocs, posX, posY)
    local startX, startY, endX, endY = posX, posY, posX, posY
    local id = allocs[posY][posX].id
    for i = 1, 4 do
        local x = (3 - i) % 2
        local y = (2 - i) % 2
        while allocs[posY + y][posX + x].id == id do
            if x == 1 then
                endX = endX + 1
            elseif x == -1 then
                startX = startX - 1
            end
            if y == 1 then
                endY = endY + 1
            elseif y == -1 then
                startY = startY - 1
            end
        end
    end
    return startX, startY, endX, endY
end

local function change(allocs, posX, posY, trimTop, trimBottom, trimLeft, trimRight)
    local startX, startY, endX, endY = discover(allocs, posX, posY)
    

local function insertBlock(allocs, sizeX, sizeY, allowWrap)
    local startX = 1
    while true do
        i

function createRender(nTerm, rend)
    local allocs = {t = nTerm}
    for 
