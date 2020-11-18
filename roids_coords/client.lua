local showCoords = false

RegisterCommand('showcoords', function()
    if not showCoords then
        showCoords = true
    elseif showCoords then
        showCoords = false
    end
end)

Citizen.CreateThread(function()
    Citizen.Wait(0)
     while showCoords do
        local player = PlayerPedId()
        local coords = GetEntityCoords(player)
        local heading = GetEntityHeading(player)
        DrawTxt('Coords: '..coords..' Heading: '..heading, 0.50, 0.95, 0.7, 0.7, true, 255, 255, 255, 255, true)
     end
end)

function DrawTxt(str, x, y, w, h, enableShadow, col1, col2, col3, a, centre)
    local str = CreateVarString(10, "LITERAL_STRING", str, Citizen.ResultAsLong())
   SetTextScale(w, h)
   SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
   SetTextCentre(centre)
   if enableShadow then SetTextDropshadow(1, 0, 0, 0, 255) end
   Citizen.InvokeNative(0xADA9255D, 10);
   DisplayText(str, x, y)
end