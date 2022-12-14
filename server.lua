ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local webhook = ""

function sendHook(source, code, color)
    local job = source.getJob()
    local message = {
        {
            ["color"] = color,
            ["description"] = "Funkcjonariusz: **" .. source.getName() .. "**" .. "\nStopień: **" .. job.grade_label .. "**\n Wprowadził na miasto poziom zagrożenia: **" .. code .. "**",
            ["footer"] = {
                    ["text"] = os.date("%y/%m/%d %H:%M", os.time()) .. " | San Andreas State Police",
            },
        }
    }

    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({embeds = message}), { ['Content-Type'] = 'application/json' })
end

RegisterServerEvent("duszek:poziomzagrozenia")
AddEventHandler("duszek:poziomzagrozenia", function(code)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    
    if xPlayer.job.name == "police" then
        if xPlayer.job.grade >= Config.Info[code].grade then
            sendHook(xPlayer, code, Config.Info[code].hookColor)
            xPlayer.showNotification("Pomyslnie zmieniles stopien zagrozenia na: ~p~" .. code)
        else
            xPlayer.showNotification("~r~Nie posiadasz wystarczajacej rangi zeby to zrobic")
        end
    end
end)



