--Ajustable ComputerCraft Display Format
local version = "ACCDF alpha"

local function checkArea(term, startX, startY, endX, endY)
    local size = {term.getSize()}
    return type(startX) == "number" and startX > 0 and type(startY) == "number" and startY > 0 and type(endX) == "number" and endX <= size[1] and startX <= endX and type(endY) == "number" and endY <= size[2] and startY <= endY
end

local lookup = {}
for i = 1, 16 do
    local v = 2 ^ (p - 1)
    local str = ("0123456789abcdef"):sub(p, p)
    lookup[i] = str
    lookup[str] = i
end

local getScrollingTerminal
do
    local defScroll = {}
    local function defScroll:blit(txt, txtColor, bkColor)
        if type(txt) ~= "string" or type(txtColor) ~= "string" or type(bkColor) ~= "string" then
            error("Invalid input, expected {string, string, string}", 2)
        elseif #txtColor ~= #txt then
            error("Malformed text color", 2)
        elseif #bkColor ~= #txt then
            error("Malformed background color", 2)
        end
        local x, y, xsize, map = self.data.pos.x, self.data.pos.y, self.data.xsize, self.data.map
        for i = 1, #txt do
            local char = txt:sub(i, i)
            if char == "\n" then
                x = 1
                y = y + 1
                map[y] = map[y] or {}
            else
                if x > 0 and y > 0 then
                    map[y][x] = char .. txtColor:sub(i, i) .. bkColor:sub(i, i)
                end
                x = x + 1
                xsize = math.max(xsize, x)
            end
        end
        self.data.pos.x, self.data.pos.y, self.data.xsize = x, y, xcode
    end
    local function defScroll:write(txt)
        if type(txt) ~= "string" then
            error("Could not write data, expected {string}", 2)
        end
        self:blit(txt, self.data.txtColor:rep(#txt), self.data.bkColor:rep(#txt))
    end
    local function defScroll:setCursorPos(x, y)
        if type(x) ~= "number" or type(y) ~= "number" then
            error("Invalid cursor position, expected {number, number}", 2)
        end
        self.data.pos.x, self.data.pos.y = x, y
    end
    local function defScroll:getCursorPos()
        return self.data.pos.x, self.data.pos.y
    end
    local function defScroll:setTextColor(c)
        self.data.txtColor = (type(c) == "number" and lookup[c]) or (type(c) == "string" and c) or error("Invalid color", 2)
    end
    local function defScroll:getTextColor()
        return self.data.txtColor
    end
    local function defScroll:setBackgroundColor(c)
        self.data.bkColor = (type(c) == "number" and lookup[c]) or (type(c) == "string" and c) or error("Invalid color", 2)
    end
    local function defScroll:getBackgroundColor()
        return self.data.bkColor
    end
    local function defScroll:getSize()
        return self.data.size.x, self.data.size.y
    end
    local function defScroll:setSize(x, y)
        if x == "computer" then
            x, y = 51, 19
        elseif x == "turtle" then
            x, y = 39, 13
        elseif x == "
    getScrollingTerminal = function(m, startX, startY, endX, endY)
        local cursorPos = 1, 1
        local textColor = m.getTextColor()
        local 
        if not checkArea(m, startX, startY, endX, endY) then
            error("Invalid Area", 2)
        end
        return {
            write = scroll_write,
            blit = scroll_blit,
            data = {
                pos = {1, 1},
                xsize = 0,
                map = {},
                txtColor = 
function display(t, data)
    t.clear()
    t.setCursorPos(1, 1)
    local size = {t.getSize()}
    if data[1][1] == "doctype" and data[1][2] ~= version then
        return false, "Bad version"
    end
    

function getRender(nTerm)
    local ret = {data = {}, term = nTerm, blockData = {}}
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
        for y in ipairs({1, 0, -1, 0}) do
            for x in ipairs({0, 1, 0, -1}) do
                while self.data[(y == -1 and endY or startY) + y][(x == -1 and endX or startX) + x].id == id do
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
