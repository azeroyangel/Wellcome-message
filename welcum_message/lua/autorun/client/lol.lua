surface.CreateFont("Eblanograd_Big", {
    font = "Eblanograd_Big",
    size = 200,
    weight = 1500,
    antialias = true,
    shadow = true
})

surface.CreateFont("Eblanograd_Small", {
    font = "Eblanograd_Small",
    size = 35,
    weight = 5020,
    antialias = true,
    shadow = true
})

if CLIENT then
    local positions = {
        gm_construct = {
            textPos = Vector(0.57, 209.69, 280.86),
            smallPos = Vector(0.57, 209.69, 200.86)
        },
        gm_flatgrass = {
            textPos = Vector(4.32, -13.26, -11967.12),
            smallPos = Vector(4.32, -13.26, -12085.12)
        }
    }

    local function DrawText(pos, font, text, angle)
        cam.Start3D2D(pos, angle, 1)
        draw.SimpleText(text, font, 0, 0, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        cam.End3D2D()
    end

    hook.Add("PostDrawOpaqueRenderables", "DrawTextAndImage", function()
        local mapData = positions[game.GetMap()]
        if not mapData then return end
        
        local rt = RealTime() * 5 % 360
        local ang1 = Angle(0, rt, 90)
        local ang2 = Angle(180, rt, -90)
        
        DrawText(mapData.textPos, "Eblanograd_Big", "EBG DEV", ang1)
        DrawText(mapData.textPos, "Eblanograd_Big", "EBG DEV", ang2)
        --DrawText(mapData.smallPos, "Eblanograd_Small", "Map: "..game.GetMap(), ang1)
        --DrawText(mapData.smallPos, "Eblanograd_Small", "Map: "..game.GetMap(), ang2)
    end)

    -- Команда для копирования координат
    concommand.Add("ebg_copy_coords", function()
        local pos = LocalPlayer():GetPos()
        local coords = string.format("Vector(%.2f, %.2f, %.2f)", pos.x, pos.y, pos.z)
        SetClipboardText(coords)
        print(coords)
    end)
end
