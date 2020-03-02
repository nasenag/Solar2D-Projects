local M = {}

local random = math.random

-- Tile bitmask references.
-- NB! Tiles with more than one variant are listed in tables.
local frame = {
    [0] = 1,
    [1] = 1,
    [2] = 35,
    [3] = 35,
    [4] = 1,
    [5] = 1,
    [6] = 35,
    [7] = 35,
    [8] = 47,
    [9] = 47,
    [10] = 33,
    [11] = 49,
    [12] = 47,
    [13] = 47,
    [14] = 33,
    [15] = 49,
    [16] = 2,
    [17] = 2,
    [18] = 43,
    [19] = 43,
    [20] = 2,
    [21] = 2,
    [22] = 48,
    [23] = 48,
    [24] = 40,
    [25] = 40,
    [26] = 46,
    [27] = 45,
    [28] = 40,
    [29] = 40,
    [30] = 44,
    [31] = 25,
    [32] = 1,
    [33] = 1,
    [34] = 35,
    [35] = 35,
    [36] = 1,
    [37] = 1,
    [38] = 35,
    [39] = 35,
    [40] = 47,
    [41] = 47,
    [42] = 33,
    [43] = 49,
    [44] = 47,
    [45] = 47,
    [46] = 33,
    [47] = 49,
    [48] = 2,
    [49] = 2,
    [50] = 43,
    [51] = 43,
    [52] = 2,
    [53] = 2,
    [54] = 48,
    [55] = 48,
    [56] = 40,
    [57] = 40,
    [58] = 46,
    [59] = 45,
    [60] = 40,
    [61] = 40,
    [62] = 44,
    [63] = 25,
    [64] = 8,
    [65] = 8,
    [66] = 34,
    [67] = 34,
    [68] = 8,
    [69] = 8,
    [70] = 34,
    [71] = 34,
    [72] = 7,
    [73] = 7,
    [74] = 28,
    [75] = 21,
    [76] = 7,
    [77] = 7,
    [78] = 28,
    [79] = 21,
    [80] = 32,
    [81] = 32,
    [82] = 15,
    [83] = 15,
    [84] = 32,
    [85] = 32,
    [86] = 36,
    [87] = 36,
    [88] = 3,
    [89] = 3,
    [90] = 39,
    [91] = 27,
    [92] = 3,
    [93] = 3,
    [94] = 16,
    [95] = 26,
    [96] = 8,
    [97] = 8,
    [98] = 34,
    [99] = 34,
    [100] = 8,
    [101] = 8,
    [102] = 34,
    [103] = 34,
    [104] = 42,
    [105] = 42,
    [106] = 14,
    [107] = 31,
    [108] = 42,
    [109] = 42,
    [110] = 14,
    [111] = 31,
    [112] = 32,
    [113] = 32,
    [114] = 15,
    [115] = 15,
    [116] = 32,
    [117] = 32,
    [118] = 36,
    [119] = 36,
    [120] = 6,
    [121] = 6,
    [122] = 10,
    [123] = 38,
    [124] = 6,
    [125] = 6,
    [126] = 24,
    [127] = 20,
    [128] = 1,
    [129] = 1,
    [130] = 35,
    [131] = 35,
    [132] = 1,
    [133] = 1,
    [134] = 35,
    [135] = 35,
    [136] = 47,
    [137] = 47,
    [138] = 33,
    [139] = 49,
    [140] = 47,
    [141] = 47,
    [142] = 33,
    [143] = 49,
    [144] = 2,
    [145] = 2,
    [146] = 43,
    [147] = 43,
    [148] = 2,
    [149] = 2,
    [150] = 48,
    [151] = 48,
    [152] = 40,
    [153] = 40,
    [154] = 46,
    [155] = 45,
    [156] = 40,
    [157] = 40,
    [158] = 44,
    [159] = 25,
    [160] = 1,
    [161] = 1,
    [162] = 35,
    [163] = 35,
    [164] = 1,
    [165] = 1,
    [166] = 35,
    [167] = 35,
    [168] = 47,
    [169] = 47,
    [170] = 33,
    [171] = 49,
    [172] = 47,
    [173] = 47,
    [174] = 33,
    [175] = 49,
    [176] = 2,
    [177] = 2,
    [178] = 43,
    [179] = 43,
    [180] = 2,
    [181] = 2,
    [182] = 48,
    [183] = 48,
    [184] = 40,
    [185] = 40,
    [186] = 46,
    [187] = 45,
    [188] = 40,
    [189] = 40,
    [190] = 44,
    [191] = 25,
    [192] = 8,
    [193] = 8,
    [194] = 34,
    [195] = 34,
    [196] = 8,
    [197] = 8,
    [198] = 34,
    [199] = 34,
    [200] = 7,
    [201] = 7,
    [202] = 28,
    [203] = 21,
    [204] = 7,
    [205] = 7,
    [206] = 28,
    [207] = 21,
    [208] = 9,
    [209] = 9,
    [210] = 22,
    [211] = 22,
    [212] = 9,
    [213] = 9,
    [214] = 29,
    [215] = 29,
    [216] = 4,
    [217] = 4,
    [218] = 41,
    [219] = 17,
    [220] = 4,
    [221] = 4,
    [222] = 11,
    [223] = 37,
    [224] = 8,
    [225] = 8,
    [226] = 34,
    [227] = 34,
    [228] = 8,
    [229] = 8,
    [230] = 34,
    [231] = 34,
    [232] = 42,
    [233] = 42,
    [234] = 14,
    [235] = 31,
    [236] = 42,
    [237] = 42,
    [238] = 14,
    [239] = 31,
    [240] = 9,
    [241] = 9,
    [242] = 22,
    [243] = 22,
    [244] = 9,
    [245] = 9,
    [246] = 29,
    [247] = 29,
    [248] = 5,
    [249] = 5,
    [250] = 23,
    [251] = 13,
    [252] = 5,
    [253] = 5,
    [254] = 18,
    [255] = { 12, 19, 30 },
}

-- Basic parameters and references required by the module.
local map, maxRows, maxColumns
function M.init( m, r, c )
    map, maxRows, maxColumns = m, r, c
end

-- Calculate a bitmask value for a given cell and retrieves the corresponding frame id.
function M.getFrameID( row, column, currentFrame )
    -- Prevent modifying the outer edges of the game map.
    if row > 0 and row < maxRows+1 and column > 0 and column < maxColumns+1 then
        local bitmask = 0

        if map[row-1][column-1] ~= 0 then
            bitmask = bitmask + 1
        end
        if map[row-1][column] ~= 0 then
            bitmask = bitmask + 2
        end
        if map[row-1][column+1] ~= 0 then
            bitmask = bitmask + 4
        end
        if map[row][column-1] ~= 0 then
            bitmask = bitmask + 8
        end
        if map[row][column+1] ~= 0 then
            bitmask = bitmask + 16
        end
        if map[row+1][column-1] ~= 0 then
            bitmask = bitmask + 32
        end
        if map[row+1][column] ~= 0 then
            bitmask = bitmask + 64
        end
        if map[row+1][column+1] ~= 0 then
            bitmask = bitmask + 128
        end

        local id = frame[bitmask]
        if type( id ) == "table" then
            -- If the game is trying to update an existing tile,
            -- then don't return the same frame id to the game.
            local t = frame[bitmask][random(1,#id)]
            if currentFrame then
                while t == currentFrame do
                    t = frame[bitmask][random(1,#id)]
                end
            end
            id = t
        end
        return id, bitmask
    end
end

return M
