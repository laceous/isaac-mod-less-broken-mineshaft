local mod = RegisterMod('Less Broken Mineshaft', 1)
local game = Game()

if REPENTOGON then
  mod.minecartInPrevRoom = false
  mod.mineshaftRoomPreview = false
  mod.minecartEnterFrame = 15 -- default
  mod.rngShiftIdx = 35
  
  -- this won't automatically work with modded rooms
  -- a better implementation would dynamically figure this out (not sure how feasible that is)
  mod.roomData = {
    -- subtype = 11 (mineshaft lobby)
    [10009] = {
      [StbRailVariant.VERTICAL]      = { 112, 79, 64, 49, 22 },
      [StbRailVariant.HORIZONTAL]    = { 96, 95, 35, 36 },
      [StbRailVariant.DOWN_TO_LEFT]  = { 97 },
      [StbRailVariant.DOWN_TO_RIGHT] = { 34 },
      [StbRailVariant.UP_TO_LEFT]    = { 37 },
      [StbRailVariant.UP_TO_RIGHT]   = { 94 },
      cart = 112,
    },
    [10010] = {
      [StbRailVariant.VERTICAL] = { 112, 97, 82, 67, 52, 37, 22 },
      cart = 112,
    },
    [10011] = {
      [StbRailVariant.VERTICAL]      = { 112, 97, 66, 51, 22 },
      [StbRailVariant.DOWN_TO_LEFT]  = { 82 },
      [StbRailVariant.DOWN_TO_RIGHT] = { 36 },
      [StbRailVariant.UP_TO_LEFT]    = { 37 },
      [StbRailVariant.UP_TO_RIGHT]   = { 81 },
      cart = 112,
    },
    [10013] = {
      [StbRailVariant.VERTICAL]      = { 112, 84, 69, 54, 22 },
      [StbRailVariant.HORIZONTAL]    = { 98, 38 },
      [StbRailVariant.DOWN_TO_LEFT]  = { 39 },
      [StbRailVariant.DOWN_TO_RIGHT] = { 97 },
      [StbRailVariant.UP_TO_LEFT]    = { 99 },
      [StbRailVariant.UP_TO_RIGHT]   = { 37 },
      cart = 112,
    },
    [10014] = {
      [StbRailVariant.VERTICAL]      = { 112, 83, 68, 53, 22 },
      [StbRailVariant.DOWN_TO_LEFT]  = { 38 },
      [StbRailVariant.DOWN_TO_RIGHT] = { 97 },
      [StbRailVariant.UP_TO_LEFT]    = { 98 },
      [StbRailVariant.UP_TO_RIGHT]   = { 37 },
      cart = 112,
    },
    -- subtype = 30 (path to knife room), 31 is path back
    [10024] = {
      [StbRailVariant.VERTICAL]      = { 412, 384, 356, 328, 300, 272, 244, 216, 188, 160, 154, 182, 210, 263, 291, 311, 283, 255, 227, 199, 171, 143, 115, 87, 35 },
      [StbRailVariant.HORIZONTAL]    = { 131, 130, 129, 128, 127, 237, 236, 345, 344, 343, 342, 341, 340, 60, 61, 62 },
      [StbRailVariant.DOWN_TO_LEFT]  = { 132 },
      [StbRailVariant.DOWN_TO_RIGHT] = { 126, 235, 318, 59 },
      [StbRailVariant.UP_TO_LEFT]    = { 238, 319, 346, 63 },
      [StbRailVariant.UP_TO_RIGHT]   = { 339 },
      cart = 412,
    },
    [10026] = {
      [StbRailVariant.VERTICAL]     = { 412, 352, 324, 296, 268, 240, 212, 184, 119, 91, 63, 35 },
      [StbRailVariant.HORIZONTAL]   = { 383, 382, 381, 155, 154, 153, 152, 151, 150, 149, 148 },
      [StbRailVariant.DOWN_TO_LEFT] = { 384, 156 },
      [StbRailVariant.UP_TO_RIGHT]  = { 380, 147 },
      cart = 412,
    },
    [10028] = {
      [StbRailVariant.VERTICAL]      = { 360, 332, 304, 276, 248, 220, 217, 245, 239, 211, 183, 155, 127, 124, 152, 180, 208, 236, 264, 292, 287, 259, 231, 203, 175, 147, 119, 91, 63, 35 },
      [StbRailVariant.HORIZONTAL]    = { 386, 387, 191, 190, 272, 271, 270, 269, 268, 98, 97, 319, 318, 317, 316 },
      [StbRailVariant.DOWN_TO_LEFT]  = { 192, 99 },
      [StbRailVariant.DOWN_TO_RIGHT] = { 412, 385, 189, 96 },
      [StbRailVariant.UP_TO_LEFT]    = { 413, 388, 273, 320 },
      [StbRailVariant.UP_TO_RIGHT]   = { 267, 315 },
      cart = 412,
    },
    [10030] = {
      [StbRailVariant.VERTICAL]      = { 412, 384, 356, 328, 300, 272, 244, 216, 188, 160, 132, 104, 101, 129, 157, 185, 213, 241, 269, 297, 325, 315, 287, 259, 231, 203, 175, 147, 119, 91, 63, 35 },
      [StbRailVariant.HORIZONTAL]    = { 75, 74, 352, 351, 350, 349, 348, 347, 346, 345, 344 },
      [StbRailVariant.DOWN_TO_LEFT]  = { 76 },
      [StbRailVariant.DOWN_TO_RIGHT] = { 73 },
      [StbRailVariant.UP_TO_LEFT]    = { 353 },
      [StbRailVariant.UP_TO_RIGHT]   = { 343 },
      cart = 412,
    },
    [10032] = {
      [StbRailVariant.VERTICAL]      = { 412, 341, 313, 285, 257, 215, 187, 159, 131, 63, 35 },
      [StbRailVariant.HORIZONTAL]    = { 383, 382, 381, 380, 379, 378, 377, 376, 375, 374, 373, 372, 371, 370, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 102, 101, 100, 99, 98, 97, 96, 95, 94, 93, 92 },
      [StbRailVariant.DOWN_TO_LEFT]  = { 384, 103 },
      [StbRailVariant.DOWN_TO_RIGHT] = { 229 },
      [StbRailVariant.UP_TO_LEFT]    = { 243 },
      [StbRailVariant.UP_TO_RIGHT]   = { 369, 91 },
      cart = 412,
    },
    [10034] = {
      [StbRailVariant.VERTICAL]     = { 412, 384, 356, 328, 300, 272, 244, 216, 188, 160, 132, 63, 35 },
      [StbRailVariant.HORIZONTAL]   = { 103, 102, 101, 100, 99, 98, 97, 96, 95, 94, 93, 92 },
      [StbRailVariant.DOWN_TO_LEFT] = { 104 },
      [StbRailVariant.UP_TO_RIGHT]  = { 91 },
      cart = 412,
    },
    [10036] = {
      [StbRailVariant.VERTICAL]     = { 412, 384, 356, 328, 300, 272, 244, 175, 147, 119, 91, 63, 35 },
      [StbRailVariant.HORIZONTAL]   = { 215, 214, 213, 212, 211, 210, 209, 208, 207, 206, 205, 204 },
      [StbRailVariant.DOWN_TO_LEFT] = { 216 },
      [StbRailVariant.UP_TO_RIGHT]  = { 203 },
      cart = 412,
    },
    [10038] = {
      [StbRailVariant.VERTICAL]      = { 412, 346, 318, 290, 262, 234, 188, 160, 132, 104, 35 },
      [StbRailVariant.HORIZONTAL]    = { 383, 382, 381, 380, 379, 378, 377, 376, 375, 207, 208, 209, 210, 211, 212, 213, 214, 215, 75, 74, 73, 72, 71, 70, 69, 68, 67, 66, 65, 64 },
      [StbRailVariant.DOWN_TO_LEFT]  = { 384, 76 },
      [StbRailVariant.DOWN_TO_RIGHT] = { 206 },
      [StbRailVariant.UP_TO_LEFT]    = { 216 },
      [StbRailVariant.UP_TO_RIGHT]   = { 374, 63 },
      cart = 412,
    },
    [10040] = {
      [StbRailVariant.VERTICAL]      = { 412, 384, 356, 289, 241, 213, 185, 157, 91, 63, 35 },
      [StbRailVariant.HORIZONTAL]    = { 327, 326, 325, 324, 323, 322, 321, 320, 319, 318, 262, 263, 264, 265, 266, 267, 268, 128, 127, 126, 125, 124, 123, 122, 121, 120 },
      [StbRailVariant.DOWN_TO_LEFT]  = { 328, 129 },
      [StbRailVariant.DOWN_TO_RIGHT] = { 261 },
      [StbRailVariant.UP_TO_LEFT]    = { 269 },
      [StbRailVariant.UP_TO_RIGHT]   = { 317, 119 },
      cart = 412,
    },
    [10042] = {
      [StbRailVariant.VERTICAL]     = { 412, 384, 315, 287, 259, 231, 203, 175, 147, 119, 91, 63, 35 },
      [StbRailVariant.HORIZONTAL]   = { 355, 354, 353, 352, 351, 350, 349, 348, 347, 346, 345, 344 },
      [StbRailVariant.DOWN_TO_LEFT] = { 356 },
      [StbRailVariant.UP_TO_RIGHT]  = { 343 },
      cart = 412,
    },
    [10044] = {
      [StbRailVariant.VERTICAL]      = { 412, 384, 356, 328, 266, 238, 210, 182, 119, 91, 63, 35 },
      [StbRailVariant.HORIZONTAL]    = { 299, 298, 297, 296, 295, 153, 152, 151, 150, 149, 148 },
      [StbRailVariant.DOWN_TO_LEFT]  = { 300, 154 },
      [StbRailVariant.UP_TO_RIGHT]   = { 294, 147 },
      cart = 412,
    },
    [10046] = {
      [StbRailVariant.VERTICAL]     = { 412, 384, 356, 328, 300, 231, 203, 175, 147, 119, 91, 63, 35 },
      [StbRailVariant.HORIZONTAL]   = { 271, 270, 269, 268, 267, 266, 265, 264, 263, 262, 261, 260 },
      [StbRailVariant.DOWN_TO_LEFT] = { 272 },
      [StbRailVariant.UP_TO_RIGHT]  = { 259 },
      cart = 412,
    },
    [10048] = {
      [StbRailVariant.VERTICAL]      = { 399, 371, 343, 315, 287, 259, 231, 180, 152 },
      [StbRailVariant.HORIZONTAL]    = { 204, 205, 206, 207, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138 },
      [StbRailVariant.DOWN_TO_RIGHT] = { 203, 124 },
      [StbRailVariant.UP_TO_LEFT]    = { 208 },
      cart = 399,
    },
    [10050] = {
      [StbRailVariant.VERTICAL]      = { 399, 371, 343, 349, 356, 328, 300, 272, 244, 216, 188 },
      [StbRailVariant.HORIZONTAL]    = { 316, 317, 318, 319, 320, 378, 379, 380, 381, 382, 383, 161, 162, 136, 137, 138 },
      [StbRailVariant.DOWN_TO_LEFT]  = { 321 },
      [StbRailVariant.DOWN_TO_RIGHT] = { 315, 160, 135 },
      [StbRailVariant.UP_TO_LEFT]    = { 384, 163 },
      [StbRailVariant.UP_TO_RIGHT]   = { 377 },
      cart = 399,
    },
    [10052] = {
      [StbRailVariant.VERTICAL]      = { 399, 371, 343, 315, 287, 259, 204, 176, 148, 153, 181, 209, 237, 265, 293, 300, 272, 217, 189, 161 },
      [StbRailVariant.HORIZONTAL]    = { 121, 122, 123, 124, 322, 323, 324, 325, 326, 327, 134, 135, 136, 137, 138 },
      [StbRailVariant.DOWN_TO_LEFT]  = { 125 },
      [StbRailVariant.DOWN_TO_RIGHT] = { 231, 120, 244, 133 },
      [StbRailVariant.UP_TO_LEFT]    = { 232, 328, 245 },
      [StbRailVariant.UP_TO_RIGHT]   = { 321 },
      cart = 399,
    },
    [10054] = {
      [StbRailVariant.VERTICAL]      = { 399, 371, 343, 315, 287, 259, 231, 192, 164 },
      [StbRailVariant.HORIZONTAL]    = { 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 137, 138 },
      [StbRailVariant.DOWN_TO_RIGHT] = { 203, 136 },
      [StbRailVariant.UP_TO_LEFT]    = { 220 },
      cart = 399,
    },
    [10056] = {
      [StbRailVariant.VERTICAL]      = { 399, 371, 343, 315, 262, 234, 206, 178, 150 },
      [StbRailVariant.HORIZONTAL]    = { 288, 289, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138 },
      [StbRailVariant.DOWN_TO_RIGHT] = { 287, 122 },
      [StbRailVariant.UP_TO_LEFT]    = { 290 },
      cart = 399,
    },
    [10058] = {
      [StbRailVariant.VERTICAL]      = { 399, 371, 343, 315, 287, 259, 231, 203, 159 },
      [StbRailVariant.HORIZONTAL]    = { 176, 177, 178, 179, 180, 181, 182, 183, 184, 185, 186, 132, 133, 134, 135, 136, 137, 138 },
      [StbRailVariant.DOWN_TO_RIGHT] = { 175, 131 },
      [StbRailVariant.UP_TO_LEFT]    = { 187 },
      cart = 399,
    },
    [10060] = {
      [StbRailVariant.VERTICAL]      = { 399, 371, 343, 315, 287, 259, 231, 236, 264, 292, 320, 331, 303, 275, 215, 187, 159 },
      [StbRailVariant.HORIZONTAL]    = { 204, 205, 206, 207, 349, 350, 351, 352, 353, 354, 355, 356, 357, 358, 246, 245, 244, 132, 133, 134, 135, 136, 137, 138 },
      [StbRailVariant.DOWN_TO_LEFT]  = { 208, 247 },
      [StbRailVariant.DOWN_TO_RIGHT] = { 203, 131 },
      [StbRailVariant.UP_TO_LEFT]    = { 359 },
      [StbRailVariant.UP_TO_RIGHT]   = { 348, 243 },
      cart = 399,
    },
    [10062] = {
      [StbRailVariant.VERTICAL]      = { 399, 350, 322, 294, 237, 209, 181, 153, 188, 216, 244, 272, 300, 328, 356, 358, 330, 275, 247, 219, 191, 163 },
      [StbRailVariant.HORIZONTAL]    = { 372, 373, 374, 375, 376, 377, 126, 127, 128, 158, 159, 385, 136, 137, 138 },
      [StbRailVariant.DOWN_TO_LEFT]  = { 266, 129, 160 },
      [StbRailVariant.DOWN_TO_RIGHT] = { 371, 125, 302, 135 },
      [StbRailVariant.UP_TO_LEFT]    = { 378, 386, 303 },
      [StbRailVariant.UP_TO_RIGHT]   = { 265, 157, 384 },
      cart = 399,
    },
    [10064] = {
      [StbRailVariant.VERTICAL]      = { 399, 346, 318, 290, 237, 209, 181, 153 },
      [StbRailVariant.HORIZONTAL]    = { 372, 373, 263, 264, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138 },
      [StbRailVariant.DOWN_TO_RIGHT] = { 371, 262, 125 },
      [StbRailVariant.UP_TO_LEFT]    = { 374, 265 },
      cart = 399,
    },
    [10066] = {
      [StbRailVariant.VERTICAL]      = { 399, 371, 343, 292, 264, 236, 188, 160 },
      [StbRailVariant.HORIZONTAL]    = { 316, 317, 318, 319, 209, 210, 211, 212, 213, 214, 215, 133, 134, 135, 136, 137, 138 },
      [StbRailVariant.DOWN_TO_RIGHT] = { 315, 208, 132 },
      [StbRailVariant.UP_TO_LEFT]    = { 320, 216 },
      cart = 399,
    },
    [10068] = {
      [StbRailVariant.VERTICAL]      = { 399, 371, 343, 315, 287, 259, 231, 203, 175, 147 },
      [StbRailVariant.HORIZONTAL]    = { 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138 },
      [StbRailVariant.DOWN_TO_RIGHT] = { 119 },
      cart = 399,
    },
    [10070] = {
      [StbRailVariant.VERTICAL]      = { 399, 371, 343, 315, 262, 234, 206, 163 },
      [StbRailVariant.HORIZONTAL]    = { 288, 289, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 190, 136, 137, 138 },
      [StbRailVariant.DOWN_TO_RIGHT] = { 287, 178, 135 },
      [StbRailVariant.UP_TO_LEFT]    = { 290, 191 },
      cart = 399,
    },
    [10072] = {
      [StbRailVariant.VERTICAL] = { 217, 202, 187, 172, 157, 142, 127, 112, 97, 82, 67, 52, 37, 22 },
      cart = 217,
    },
    [10082] = {
      [StbRailVariant.VERTICAL]      = { 217, 202, 171, 156, 141, 126, 111, 96, 81, 66, 37, 22 },
      [StbRailVariant.DOWN_TO_LEFT]  = { 187 },
      [StbRailVariant.DOWN_TO_RIGHT] = { 51 },
      [StbRailVariant.UP_TO_LEFT]    = { 52 },
      [StbRailVariant.UP_TO_RIGHT]   = { 186 },
      cart = 217,
    },
    [10100] = {
      [StbRailVariant.HORIZONTAL] = { 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138 },
      cart = 113,
    },
    [10134] = {
      [StbRailVariant.VERTICAL]  = { 112, 82, 67, 52, 37, 22 },
      [StbRailVariant.CROSSROAD] = { 97 },
      cart = 112,
    },
    [10136] = {
      [StbRailVariant.VERTICAL]      = { 112, 97, 37, 22 },
      [StbRailVariant.HORIZONTAL]    = { 81, 80, 79, 78, 63, 64, 65, 66, 67, 68, 69, 70, 71, 56, 55, 54, 53 },
      [StbRailVariant.DOWN_TO_LEFT]  = { 82, 57 },
      [StbRailVariant.DOWN_TO_RIGHT] = { 62 },
      [StbRailVariant.UP_TO_LEFT]    = { 72 },
      [StbRailVariant.UP_TO_RIGHT]   = { 77, 52 },
      cart = 112,
    },
    [10138] = {
      [StbRailVariant.VERTICAL]  = { 112, 82, 67, 52, 22 },
      [StbRailVariant.CROSSROAD] = { 97, 37 },
      cart = 112,
    },
    [10148] = {
      [StbRailVariant.VERTICAL]   = { 52, 37, 22 },
      [StbRailVariant.HORIZONTAL] = { 61, 62, 63, 64, 65, 66 },
      [StbRailVariant.UP_TO_LEFT] = { 67 },
      cart = 61,
    },
    [10154] = {
      [StbRailVariant.VERTICAL]     = { 77, 87, 72, 57, 22 },
      [StbRailVariant.HORIZONTAL]   = { 61, 93, 94, 95, 96, 97, 98, 99, 100, 101, 41, 40, 39, 38 },
      [StbRailVariant.DOWN_TO_LEFT] = { 62, 42 },
      [StbRailVariant.UP_TO_LEFT]   = { 102 },
      [StbRailVariant.UP_TO_RIGHT]  = { 92, 37 },
      cart = 61,
    },
    [10156] = {
      [StbRailVariant.VERTICAL]     = { 57, 22 },
      [StbRailVariant.HORIZONTAL]   = { 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 41, 40, 39, 38 },
      [StbRailVariant.DOWN_TO_LEFT] = { 42 },
      [StbRailVariant.UP_TO_LEFT]   = { 72 },
      [StbRailVariant.UP_TO_RIGHT]  = { 37 },
      cart = 61,
    },
    [10162] = {
      [StbRailVariant.VERTICAL]     = { 56, 22 },
      [StbRailVariant.HORIZONTAL]   = { 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 40, 39, 38 },
      [StbRailVariant.DOWN_TO_LEFT] = { 41 },
      [StbRailVariant.UP_TO_LEFT]   = { 71 },
      [StbRailVariant.UP_TO_RIGHT]  = { 37 },
      cart = 61,
    },
    -- fiend folio reheated (17xxx/19xxx)
    [17649] = {
      [StbRailVariant.VERTICAL]      = { 112, 78, 63, 48, 22 },
      [StbRailVariant.HORIZONTAL]    = { 96, 95, 94, 34, 35, 36 },
      [StbRailVariant.DOWN_TO_LEFT]  = { 97 },
      [StbRailVariant.DOWN_TO_RIGHT] = { 33 },
      [StbRailVariant.UP_TO_LEFT]    = { 37 },
      [StbRailVariant.UP_TO_RIGHT]   = { 93 },
      cart = 112,
    },
    [17651] = {
      [StbRailVariant.VERTICAL]      = { 112, 85, 70, 37, 22 },
      [StbRailVariant.HORIZONTAL]    = { 98, 99, 56, 54, 53 },
      [StbRailVariant.CROSSROAD]     = { 55 },
      [StbRailVariant.DOWN_TO_LEFT]  = { 41 },
      [StbRailVariant.DOWN_TO_RIGHT] = { 97, 40 },
      [StbRailVariant.UP_TO_LEFT]    = { 100, 56 },
      [StbRailVariant.UP_TO_RIGHT]   = { 52 },
      cart = 112,
    },
    [17500] = {
      [StbRailVariant.VERTICAL]  = { 217, 202, 187, 157, 142, 127, 112, 97, 82, 52, 37, 22 },
      [StbRailVariant.CROSSROAD] = { 172, 67 },
      cart = 217,
    },
    [17502] = {
      [StbRailVariant.VERTICAL]     = { 412, 354, 326, 298, 270, 242, 214, 186, 158, 130, 102, 35 },
      [StbRailVariant.HORIZONTAL]   = { 383, 73, 72, 71, 70, 69, 68, 67, 66, 65, 64 },
      [StbRailVariant.DOWN_TO_LEFT] = { 384, 74 },
      [StbRailVariant.UP_TO_RIGHT]  = { 382, 63 },
      cart = 412,
    },
    [17506] = {
      [StbRailVariant.VERTICAL]      = { 399, 371, 314, 256, 228, 200, 146, 93, 102, 130, 158, 235, 329, 301, 273, 245, 217, 162, 134, 106, 108 },
      [StbRailVariant.HORIZONTAL]    = { 285, 173, 119, 120, 66, 67, 68, 69, 70, 71, 72, 73, 185, 184, 183, 182, 181, 293, 323, 324, 325, 355, 356, 79, 137, 138 },
      [StbRailVariant.DOWN_TO_LEFT]  = { 343, 286, 74, 264, 294, 326, 80 },
      [StbRailVariant.DOWN_TO_RIGHT] = { 172, 118, 65, 180, 207, 189, 78 },
      [StbRailVariant.UP_TO_LEFT]    = { 174, 121, 186, 208, 357, 190 },
      [StbRailVariant.UP_TO_RIGHT]   = { 342, 284, 263, 292, 322, 354, 136 },
      cart = 399,
    },
    [17510] = {
      [StbRailVariant.VERTICAL]     = { 76, 91, 103, 88, 73, 58, 43 },
      [StbRailVariant.HORIZONTAL]   = { 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 27, 26, 25, 24, 23 },
      [StbRailVariant.DOWN_TO_LEFT] = { 61, 28 },
      [StbRailVariant.UP_TO_LEFT]   = { 118 },
      [StbRailVariant.UP_TO_RIGHT]  = { 106, 22 },
      cart = 61,
    },
    [17664] = {
      [StbRailVariant.VERTICAL]      = { 399, 371, 343, 315, 287, 259, 231, 203, 175, 147, 119, 122, 182, 210, 269, 276, 248, 220, 192, 164 },
      [StbRailVariant.HORIZONTAL]    = { 92, 93, 151, 152, 153, 239, 240, 298, 299, 300, 301, 302, 303, 137, 138 },
      [StbRailVariant.DOWN_TO_LEFT]  = { 94, 154, 241 },
      [StbRailVariant.DOWN_TO_RIGHT] = { 91, 136 },
      [StbRailVariant.UP_TO_LEFT]    = { 304 },
      [StbRailVariant.UP_TO_RIGHT]   = { 150, 238, 297 },
      cart = 399,
    },
    [17666] = {
      [StbRailVariant.VERTICAL]      = { 399, 371, 316, 288, 260, 188 },
      [StbRailVariant.HORIZONTAL]    = { 233, 234, 235, 236, 237, 238, 239, 213, 214, 215, 134, 135, 136, 137, 138 },
      [StbRailVariant.DOWN_TO_RIGHT] = { 343, 232, 212, 160, 133 },
      [StbRailVariant.UP_TO_LEFT]    = { 344, 240, 216, 161 },
      cart = 399,
    },
    [17668] = {
      [StbRailVariant.VERTICAL]      = { 399, 371, 343, 315, 287, 247, 219, 191, 163 },
      [StbRailVariant.HORIZONTAL]    = { 260, 261, 262, 263, 264, 265, 266, 267, 268, 269, 270, 271, 272, 273, 274, 136, 137, 138 },
      [StbRailVariant.DOWN_TO_RIGHT] = { 259, 135 },
      [StbRailVariant.UP_TO_LEFT]    = { 275 },
      cart = 399,
    },
    [17660] = {
      [StbRailVariant.VERTICAL]      = { 412, 384, 323, 295, 267, 239, 211, 183, 155, 150, 178, 206, 234, 229, 201, 173, 145, 117, 89, 35 },
      [StbRailVariant.HORIZONTAL]    = { 355, 354, 353, 352, 126, 125, 124, 123, 261, 260, 259, 258, 62 },
      [StbRailVariant.DOWN_TO_LEFT]  = { 356, 127 },
      [StbRailVariant.DOWN_TO_RIGHT] = { 122, 61 },
      [StbRailVariant.UP_TO_LEFT]    = { 262, 63 },
      [StbRailVariant.UP_TO_RIGHT]   = { 351, 257 },
      cart = 412,
    },
    [17674] = {
      [StbRailVariant.VERTICAL]      = { 46, 31 },
      [StbRailVariant.HORIZONTAL]    = { 17, 18, 19, 20, 21 },
      [StbRailVariant.DOWN_TO_RIGHT] = { 16 },
      [StbRailVariant.UP_TO_LEFT]    = { 61, 22 },
      cart = 61,
    },
    [19692] = {
      [StbRailVariant.VERTICAL]      = { 200, 185, 170, 155, 129, 114, 80, 65, 37, 22 },
      [StbRailVariant.HORIZONTAL]    = { 216, 141, 142, 143, 98, 97, 96, 51 },
      [StbRailVariant.DOWN_TO_LEFT]  = { 217, 99 },
      [StbRailVariant.DOWN_TO_RIGHT] = { 140, 50 },
      [StbRailVariant.UP_TO_LEFT]    = { 144, 52 },
      [StbRailVariant.UP_TO_RIGHT]   = { 215, 95 },
      cart = 217,
    },
    [19694] = {
      [StbRailVariant.VERTICAL]      = { 412, 384, 356, 328, 300, 290, 318, 317, 289, 261, 233, 205, 177, 149, 121, 63, 35 },
      [StbRailVariant.HORIZONTAL]    = { 271, 270, 269, 268, 267, 266, 265, 264, 263, 92 },
      [StbRailVariant.DOWN_TO_LEFT]  = { 272, 93 },
      [StbRailVariant.DOWN_TO_RIGHT] = { 262 },
      [StbRailVariant.UP_TO_LEFT]    = { 346 },
      [StbRailVariant.UP_TO_RIGHT]   = { 345, 91 },
      cart = 412,
    },
    [19698] = {
      [StbRailVariant.VERTICAL]      = { 399, 350, 322, 294, 266, 238, 188, 160 },
      [StbRailVariant.HORIZONTAL]    = { 372, 373, 374, 375, 376, 377, 211, 212, 213, 214, 215, 133, 134, 135, 136, 137, 138 },
      [StbRailVariant.DOWN_TO_RIGHT] = { 371, 210, 132 },
      [StbRailVariant.UP_TO_LEFT]    = { 378, 216 },
      cart = 399,
    },
    -- rooms galore (8xxx)
    [8278] = {
      [StbRailVariant.VERTICAL]  = { 112, 97, 82, 52, 37, 22 },
      [StbRailVariant.CROSSROAD] = { 67 },
      cart = 112,
    },
    [8284] = {
      [StbRailVariant.VERTICAL]     = { 412, 351, 323, 295, 267, 239, 211, 147, 119, 91, 63, 35 },
      [StbRailVariant.HORIZONTAL]   = { 383, 382, 381, 380, 182, 181, 180, 179, 178, 177, 176 },
      [StbRailVariant.DOWN_TO_LEFT] = { 384, 183 },
      [StbRailVariant.UP_TO_RIGHT]  = { 379, 175 },
      cart = 412,
    },
    [8286] = {
      [StbRailVariant.VERTICAL]      = { 112, 85, 70, 55, 22 },
      [StbRailVariant.HORIZONTAL]    = { 98, 99, 39, 38 },
      [StbRailVariant.DOWN_TO_LEFT]  = { 40 },
      [StbRailVariant.DOWN_TO_RIGHT] = { 97 },
      [StbRailVariant.UP_TO_LEFT]    = { 100 },
      [StbRailVariant.UP_TO_RIGHT]   = { 37 },
      cart = 112,
    },
    [8288] = {
      [StbRailVariant.VERTICAL]      = { 399, 371, 343, 315, 287, 293, 321, 328, 300, 272, 244, 216, 188 },
      [StbRailVariant.HORIZONTAL]    = { 260, 261, 262, 263, 264, 350, 351, 352, 353, 354, 355, 161, 162, 163, 137, 138 },
      [StbRailVariant.DOWN_TO_LEFT]  = { 265 },
      [StbRailVariant.DOWN_TO_RIGHT] = { 259, 160, 136 },
      [StbRailVariant.UP_TO_LEFT]    = { 356, 164 },
      [StbRailVariant.UP_TO_RIGHT]   = { 349 },
      cart = 399,
    },
    [8294] = {
      [StbRailVariant.VERTICAL]      = { 412, 357, 329, 301, 237, 209, 151, 123, 63, 35 },
      [StbRailVariant.HORIZONTAL]    = { 272, 271, 270, 269, 268, 267, 266, 180, 94, 93, 92 },
      [StbRailVariant.DOWN_TO_LEFT]  = { 273, 181, 95 },
      [StbRailVariant.DOWN_TO_RIGHT] = { 384 },
      [StbRailVariant.UP_TO_LEFT]    = { 385 },
      [StbRailVariant.UP_TO_RIGHT]   = { 265, 179, 91 },
      cart = 412,
    },
    [8296] = {
      [StbRailVariant.VERTICAL]      = { 399, 359, 331, 303, 275, 247, 219, 191, 163, 135, 107, 110 },
      [StbRailVariant.HORIZONTAL]    = { 372, 373, 374, 375, 376, 377, 378, 379, 380, 381, 382, 383, 384, 385, 386, 80, 81 },
      [StbRailVariant.DOWN_TO_LEFT]  = { 82 },
      [StbRailVariant.DOWN_TO_RIGHT] = { 371, 79 },
      [StbRailVariant.UP_TO_LEFT]    = { 387 },
      [StbRailVariant.UP_TO_RIGHT]   = { 138 },
      cart = 399,
    },
    [8300] = {
      [StbRailVariant.VERTICAL]   = { 52, 37, 22 },
      [StbRailVariant.HORIZONTAL] = { 61, 62, 64, 65, 66 },
      [StbRailVariant.CROSSROAD]  = { 63 },
      [StbRailVariant.UP_TO_LEFT] = { 67 },
      cart = 61,
    },
    [8304] = {
      [StbRailVariant.HORIZONTAL]    = { 113, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 138 },
      [StbRailVariant.DOWN_TO_LEFT]  = { 109 },
      [StbRailVariant.DOWN_TO_RIGHT] = { 86 },
      [StbRailVariant.UP_TO_LEFT]    = { 114 },
      [StbRailVariant.UP_TO_RIGHT]   = { 137 },
      cart = 113,
    },
    [8306] = {
      [StbRailVariant.VERTICAL]     = { 54, 22 },
      [StbRailVariant.HORIZONTAL]   = { 61, 62, 63, 64, 65, 66, 67, 68, 38 },
      [StbRailVariant.DOWN_TO_LEFT] = { 39 },
      [StbRailVariant.UP_TO_LEFT]   = { 69 },
      [StbRailVariant.UP_TO_RIGHT]  = { 37 },
      cart = 61,
    },
    [8308] = {
      [StbRailVariant.VERTICAL]     = { 412, 384, 288, 260, 232, 204, 176, 148, 120, 92, 35 },
      [StbRailVariant.HORIZONTAL]   = { 355, 325, 324, 323, 322, 321, 320, 319, 318, 317 },
      [StbRailVariant.DOWN_TO_LEFT] = { 356, 326, 64 },
      [StbRailVariant.UP_TO_RIGHT]  = { 354, 316, 63 },
      cart = 412,
    },
    -- rooms galore fiendish edition (60xxx)
    [60119] = {
      [StbRailVariant.VERTICAL]     = { 55, 22 },
      [StbRailVariant.HORIZONTAL]   = { 61, 62, 63, 64, 65, 66, 67, 68, 69, 39, 38 },
      [StbRailVariant.DOWN_TO_LEFT] = { 40 },
      [StbRailVariant.UP_TO_LEFT]   = { 70 },
      [StbRailVariant.UP_TO_RIGHT]  = { 37 },
      cart = 61,
    },
    [60123] = {
      [StbRailVariant.VERTICAL]     = { 381, 353, 325, 265, 237, 179, 151, 91, 63, 35 },
      [StbRailVariant.HORIZONTAL]   = { 411, 410, 296, 295, 294, 208, 122, 121, 120 },
      [StbRailVariant.DOWN_TO_LEFT] = { 412, 297, 209, 123 },
      [StbRailVariant.UP_TO_RIGHT]  = { 409, 293, 207, 119 },
      cart = 412,
    },
  }
  for k, v in pairs({
                     [10010] = { 10012, 10015, 10016, 10017, 10124, 10126, 10128, 10130, 10132, 10140, 10142, 10144, 10146, 17647, 17648, 17650, 19691, 17504, 17662, 19696, 8276, 8277, 8292, 8298 },
                     [10072] = { 10074, 10076, 10078, 10080, 10084, 10086, 10088, 10090, 10092, 10094, 10096, 10098, 17656, 17658, 8290, 8302 },
                     [10100] = { 10102, 10104, 10106, 10108, 10110, 10112, 10114, 10116, 10118, 10120, 10122, 17508, 17670, 17672 },
                     [10148] = { 10150, 10152, 10158, 10160, 10164, 10166 },
                     [10156] = { 8282 },
                     [8278]  = { 60121 },
                   })
  do
    for _, w in ipairs(v) do
      mod.roomData[w] = mod.roomData[k]
    end
  end
  
  function mod:onGameStart()
    local frame = mod:getMinecartEnterFrame()
    if frame then
      mod.minecartEnterFrame = frame
    end
  end
  
  function mod:onGameExit()
    mod.minecartInPrevRoom = false
    mod.mineshaftRoomPreview = false
  end
  
  function mod:onNewRoom()
    local level = game:GetLevel()
    local room = level:GetCurrentRoom()
    local roomDesc = level:GetCurrentRoomDesc()
    
    if mod:isMineshaftRoom() and mod.minecartInPrevRoom then
      local roomData = mod.roomData[roomDesc.Data.Variant] -- OriginalVariant
      if roomData then
        mod:addRails(roomData)
        
        local ffgraceVal = mod:ffgraceOverrideStart()
        local cartPosition = room:GetGridPosition(roomData.cart)
        local cart = Isaac.Spawn(EntityType.ENTITY_MINECART, 10, 0, cartPosition, Vector.Zero, nil):ToNPC()
        mod:ffgraceOverrideEnd(ffgraceVal)
        
        if mod:atLeftDoor(roomData.cart) then
          cart.I1 = 0 -- horizontal
        else
          cart.I1 = 4 -- vertical
        end
        cart.I2 = roomData.cart
        
        -- faster starting speed
        -- approximate continuing to get faster through multiple rooms
        local baseSpeed = 0.2
        if roomDesc.GridIndex == 162 then
          cart.V2 = Vector(2 * baseSpeed, 0)
        elseif roomDesc.GridIndex == 136 then
          cart.V2 = Vector(3 * baseSpeed, 0)
        elseif roomDesc.GridIndex == 109 then
          cart.V2 = Vector(5 * baseSpeed, 0)
        elseif roomDesc.GridIndex == 96 then
          cart.V2 = Vector(8 * baseSpeed, 0)
        elseif roomDesc.GridIndex == 70 then
          cart.V2 = Vector(9 * baseSpeed, 0)
        elseif roomDesc.GridIndex == 72 then
          cart.V2 = Vector(12 * baseSpeed, 0)
        elseif roomDesc.GridIndex == 74 then
          cart.V2 = Vector(14 * baseSpeed, 0)
        else
          cart.V2 = Vector(baseSpeed, 0)
        end
        
        for _, player in ipairs(PlayerManager.GetPlayers()) do
          player.Position = cartPosition -- player:SetHeadDirection
        end
        
        for i = 0, DoorSlot.NUM_DOOR_SLOTS - 1 do
          local door = room:GetDoor(i)
          if door then
            local sprite = door:GetSprite()
            if sprite:GetFilename() == 'gfx/grid/Door_01_NormalDoor.anm2' then
              sprite:Load('gfx/grid/door_mines_mineshaft_dark.anm2', true)
            end
          end
        end
      end
    elseif mod:isMineshaftRoomPreview() and mod.mineshaftRoomPreview then
      local roomData = mod.roomData[roomDesc.Data.Variant]
      if roomData then
        mod:addRails(roomData)
        
        local ffgraceVal = mod:ffgraceOverrideStart()
        local cartPosition = room:GetGridPosition(roomData.cart)
        local cart = Isaac.Spawn(EntityType.ENTITY_MINECART, 10, 0, cartPosition, Vector.Zero, nil):ToNPC()
        mod:ffgraceOverrideEnd(ffgraceVal)
        
        if mod:atLeftDoor(roomData.cart) then
          cart.I1 = 0
        else
          cart.I1 = 4
        end
        cart.I2 = roomData.cart
        cart.V2 = Vector(0.2, 0)
        
        for _, player in ipairs(PlayerManager.GetPlayers()) do
          player.Position = cartPosition
        end
      end
    end
    
    mod.minecartInPrevRoom = false
    mod.mineshaftRoomPreview = false
  end
  
  function mod:onPreChangeRoom(targetRoomIdx, dimension)
    local level = game:GetLevel()
    local roomDesc = level:GetCurrentRoomDesc()
    
    -- the game gets confused sometimes
    -- the layout in this section is always the same
    if mod:isMineshaftRoom() and mod.minecartInPrevRoom then
      level.LeaveDoor = DoorSlot.NO_DOOR_SLOT
      if roomDesc.GridIndex == 162 and not (targetRoomIdx == 149 and dimension == Dimension.MINESHAFT) then
        return { 149, Dimension.MINESHAFT }
      elseif roomDesc.GridIndex == 136 and not (targetRoomIdx == 123 and dimension == Dimension.MINESHAFT) then
        return { 123, Dimension.MINESHAFT }
      elseif roomDesc.GridIndex == 109 and not (targetRoomIdx == 96 and dimension == Dimension.MINESHAFT) then
        return { 96, Dimension.MINESHAFT }
      elseif roomDesc.GridIndex == 96 and not (targetRoomIdx == 83 and dimension == Dimension.MINESHAFT) then
        return { 83, Dimension.MINESHAFT }
      elseif roomDesc.GridIndex == 70 and not (targetRoomIdx == 72 and dimension == Dimension.MINESHAFT) then
        return { 72, Dimension.MINESHAFT }
      elseif roomDesc.GridIndex == 72 and not (targetRoomIdx == 74 and dimension == Dimension.MINESHAFT) then
        return { 74, Dimension.MINESHAFT }
      elseif roomDesc.GridIndex == 74 and not (targetRoomIdx == 61 and dimension == Dimension.MINESHAFT) then
        return { 61, Dimension.MINESHAFT }
      end
    end
  end
  
  -- attempt to place mineshaft rooms that we have rail data for
  function mod:onPreLevelPlaceRoom(slot, roomConfig, seed)
    if roomConfig.StageID == StbType.MINES and
       roomConfig.Type == RoomType.ROOM_DEFAULT and
       (roomConfig.Subtype == RoomSubType.MINESHAFT_LOBBY or roomConfig.Subtype == RoomSubType.MINESHAFT_ROOM)
    then
      if not mod.roomData[roomConfig.Variant] then
        local rng = RNG(seed, mod.rngShiftIdx)
        for i = 1, 100 do
          local newRoomConfig = RoomConfigHolder.GetRandomRoom(rng:Next(), true, roomConfig.StageID, roomConfig.Type, roomConfig.Shape, 0, -1, 0, 10, slot:DoorMask(), roomConfig.Subtype, -1)
          if not newRoomConfig then
            return nil
          elseif mod.roomData[newRoomConfig.Variant] then
            return newRoomConfig
          end
        end
      end
    end
  end
  
  -- filtered to PLAYER
  function mod:onPlayerUpdate(player)
    if not player:AreControlsEnabled() then
      local sprite = player:GetSprite()
      if sprite:IsPlaying('MinecartEnter') then
        if mod:isSecretEntrance() then
          mod.minecartInPrevRoom = true
        elseif mod:isMineshaftRoom() then
          mod.minecartInPrevRoom = true
          if sprite:GetFrame() < mod.minecartEnterFrame then
            sprite:SetFrame(mod.minecartEnterFrame) -- SetLastFrame skips a trigger
          end
        end
      end
    end
  end
  
  -- filtered to ENTITY_MINECART
  -- force the cart right, it seems to always want to go up by default
  function mod:onPreNpcUpdate(npc)
    local level = game:GetLevel()
    local room = level:GetCurrentRoom()
    local roomDesc = level:GetCurrentRoomDesc()
    
    if (mod:isMineshaftRoom() or mod:isMineshaftRoomPreview()) and
       npc.Variant == 10 and
       npc.State == NpcState.STATE_MOVE
    then
      local roomData = mod.roomData[roomDesc.Data.Variant]
      if roomData then
        if room:GetGridIndex(npc.Position) == roomData.cart and mod:atLeftDoor(roomData.cart) then
          if npc.V1.X == 0 then
            npc.V1 = Vector(0.01, 0) -- this doesn't work in MC_NPC_UPDATE
          end
        end
      end
    end
  end
  
  -- usage: less-broken-mineshaft d.10009
  function mod:onExecuteCmd(cmd, parameters)
    cmd = string.lower(cmd)
    
    if cmd == 'less-broken-mineshaft' then
      local output = Isaac.ExecuteCommand('goto ' .. parameters)
      if output == 'Changed room.' then
        mod.mineshaftRoomPreview = true
      end
      print(output)
    end
  end
  
  Console.RegisterCommand('less-broken-mineshaft', 'Wrapper for goto, use with d.xxxxx', 'Wrapper for goto, use with d.xxxxx', false, AutocompleteType.GOTO)
  
  function mod:addRails(roomData)
    local room = game:GetRoom()
    
    for railType, tbl in pairs(roomData) do
      if type(railType) == 'number' then
        for _, gridIdx in ipairs(tbl) do
          local gridEntity = room:GetGridEntity(gridIdx)
          if gridEntity then
            local geType = gridEntity:GetType()
            if geType == GridEntityType.GRID_PIT then
              --gridEntity:ToPit():MakeBridge(nil)
            elseif geType ~= GridEntityType.GRID_DECORATION then
              room:RemoveGridEntityImmediate(gridIdx, 0, false)
            end
          end
          
          for _, v in ipairs(Isaac.GetRoomEntities()) do
            if v.Type == EntityType.ENTITY_BOMB_GRIMACE or
               (v.Type == EntityType.ENTITY_PICKUP and v.Variant == PickupVariant.PICKUP_THROWABLEBOMB) or
               (v.Type == EntityType.ENTITY_MINECART and v.Variant == 0)
            then
              if room:GetGridIndex(v.Position) == gridIdx then
                v:Remove()
              end
            end
          end
          
          room:SetRail(gridIdx, railType)
        end
      end
    end
  end
  
  function mod:atLeftDoor(gridIdx)
    local room = game:GetRoom()
    local roomShape = room:GetRoomShape()
    
    return (roomShape == RoomShape.ROOMSHAPE_1x1 and gridIdx == 61) or
           (roomShape == RoomShape.ROOMSHAPE_IIH and gridIdx == 113)
  end
  
  -- right now this is the Poof - 1 frame
  -- a better check might be the length of the RootAnimation
  -- don't see a way to get that right now
  function mod:getMinecartEnterFrame()
    local sprite = Sprite()
    sprite:Load('gfx/001.000_player.anm2', true)
    sprite:SetAnimation('MinecartEnter', true)
    sprite:SetLastFrame()
    local lastFrame = sprite:GetFrame()
    for i = 0, lastFrame do
      sprite:SetFrame(i)
      if sprite:IsEventTriggered('Poof') then -- 16
        return i - 1 -- 15
      end
    end
  end
  
  -- otherwise fall from grace removes the minecart we spawn
  function mod:ffgraceOverrideStart()
    if StageAPI and StageAPI.Loaded and FFGRACE and FFGRACE.STAGE.Grotto:IsStage() then
      local key = string.char(70,117,99,107,84,104,101,115,101,77,105,110,99,97,114,116,115) -- lol
      local val = FFGRACE:GetSaveData().RunData.FloorData[key]
      FFGRACE:GetSaveData().RunData.FloorData[key] = false
      return val
    end
  end
  
  -- reset data
  function mod:ffgraceOverrideEnd(val)
    if StageAPI and StageAPI.Loaded and FFGRACE and FFGRACE.STAGE.Grotto:IsStage() then
      local key = string.char(70,117,99,107,84,104,101,115,101,77,105,110,99,97,114,116,115)
      FFGRACE:GetSaveData().RunData.FloorData[key] = val
    end
  end
  
  function mod:isSecretEntrance()
    local level = game:GetLevel()
    local roomDesc = level:GetCurrentRoomDesc()
    local stage = level:GetStage()
    local stageType = level:GetStageType()
    
    -- fall from grace (grotto) support
    if StageAPI and StageAPI.CurrentStage and not StageAPI.CurrentStage.NormalStage and StageAPI.CurrentStage.LevelgenStage and not StageAPI.InTestMode then
      stage = StageAPI.CurrentStage.LevelgenStage.Stage
      stageType = StageAPI.CurrentStage.LevelgenStage.StageType
    end
    
    return not game:IsGreedMode() and
           (stage == LevelStage.STAGE2_1 or stage == LevelStage.STAGE2_2) and
           (stageType == StageType.STAGETYPE_REPENTANCE or stageType == StageType.STAGETYPE_REPENTANCE_B) and
           level:GetDimension() == Dimension.NORMAL and
           roomDesc.Data.Type == RoomType.ROOM_DEFAULT and
           roomDesc.Data.Subtype == RoomSubType.MINES_MINESHAFT_ENTRANCE and
           (roomDesc.Data.StageID == StbType.MINES or roomDesc.Data.StageID == StbType.ASHPIT) and
           roomDesc.GridIndex >= 0
  end
  
  function mod:isMineshaftRoom()
    local level = game:GetLevel()
    local room = level:GetCurrentRoom()
    local roomDesc = level:GetCurrentRoomDesc()
    local stage = level:GetStage()
    local stageType = level:GetStageType()
    
    if StageAPI and StageAPI.CurrentStage and not StageAPI.CurrentStage.NormalStage and StageAPI.CurrentStage.LevelgenStage and not StageAPI.InTestMode then
      stage = StageAPI.CurrentStage.LevelgenStage.Stage
      stageType = StageAPI.CurrentStage.LevelgenStage.StageType
    end
    
    return not game:IsGreedMode() and
           (stage == LevelStage.STAGE2_1 or stage == LevelStage.STAGE2_2) and
           (stageType == StageType.STAGETYPE_REPENTANCE or stageType == StageType.STAGETYPE_REPENTANCE_B) and
           level:GetDimension() == Dimension.MINESHAFT and
           roomDesc.Data.Type == RoomType.ROOM_DEFAULT and
           (roomDesc.Data.Subtype == RoomSubType.MINESHAFT_LOBBY or roomDesc.Data.Subtype == RoomSubType.MINESHAFT_ROOM) and
           roomDesc.Data.StageID == StbType.MINES and -- works in ashpit too
           roomDesc.GridIndex >= 0 and
           room:IsFirstVisit() -- roomDesc.VisitedCount
  end
  
  function mod:isMineshaftRoomPreview()
    local level = game:GetLevel()
    local room = level:GetCurrentRoom()
    local roomDesc = level:GetCurrentRoomDesc()
    local stage = level:GetStage()
    local stageType = level:GetStageType()
    
    return not game:IsGreedMode() and
           (stage == LevelStage.STAGE2_1 or stage == LevelStage.STAGE2_2) and
           (stageType == StageType.STAGETYPE_REPENTANCE or stageType == StageType.STAGETYPE_REPENTANCE_B) and
           roomDesc.Data.Type == RoomType.ROOM_DEFAULT and
           (roomDesc.Data.Subtype == RoomSubType.MINESHAFT_LOBBY or roomDesc.Data.Subtype == RoomSubType.MINESHAFT_ROOM) and
           roomDesc.Data.StageID == StbType.MINES and
           roomDesc.GridIndex == GridRooms.ROOM_DEBUG_IDX and -- goto
           room:IsFirstVisit()
  end
  
  mod:AddCallback(ModCallbacks.MC_POST_GAME_STARTED, mod.onGameStart)
  mod:AddCallback(ModCallbacks.MC_PRE_GAME_EXIT, mod.onGameExit)
  mod:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, mod.onNewRoom)
  mod:AddCallback(ModCallbacks.MC_PRE_CHANGE_ROOM, mod.onPreChangeRoom)
  mod:AddCallback(ModCallbacks.MC_PRE_LEVEL_PLACE_ROOM, mod.onPreLevelPlaceRoom)
  mod:AddCallback(ModCallbacks.MC_POST_PLAYER_UPDATE, mod.onPlayerUpdate, PlayerVariant.PLAYER)
  mod:AddCallback(ModCallbacks.MC_PRE_NPC_UPDATE, mod.onPreNpcUpdate, EntityType.ENTITY_MINECART)
  mod:AddCallback(ModCallbacks.MC_EXECUTE_CMD, mod.onExecuteCmd)
end