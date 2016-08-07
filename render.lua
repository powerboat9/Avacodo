function getRender(nTerm)
    local ret = {data = {}}
    ret.sizeX, ret.sizeY = nTerm.getSize()
    function ret:isSpotTaken(x, y)
        return self.data[y][x].id == 0
    end
    function ret:isBlockTaken(startX, startY, endX, endY)
        for y = startY, endY do
            for x = startX, endX do
                if self.data[y][x] ~= 0 then
                    return true
                end
            end
        end
        return false
    end
    function 
    function ret:discover(posX, posY)
        local startX, startY, endX, endY = posX, posY, posX, posY
        local id = self.data[posY][posX].id
        for i = 1, 4 do
            local x = (3 - i) % 2
            local y = (2 - i) % 2
            while self.data[posY + y][posX + x].id == id do
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
        return {startX, startY, endX, endY}
    end
    function ret:change(area, trimTop, trimBottom, trimLeft, trimRight)
    end
    function ret:insertBlock(sizeX, sizeY, allowWrap)
        local startX = 1
        while true do
            i
    return ret
end
