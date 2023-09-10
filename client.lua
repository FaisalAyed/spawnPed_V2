LoadModels = function(hash)
    RequestModel(hash)
    while not HasModelLoaded(hash)do
        Wait(0)
    end
end
LoadAnimition = function (anim_dir)
    RequestAnimDict(anim_dir)
    while not HasAnimDictLoaded(anim_dir) do
        Wait(0)
    end
end

SpawnPeds = function (hash, x, y, z, w, anin_dir, anim)
    LoadModels(hash)
    LoadAnimition(anin_dir)
    local Ped = CreatePed(2, hash, x, y, z, w, true, false)
    FreezeEntityPosition(Ped, true)
    SetBlockingOfNonTemporaryEvents(Ped, true)
    SetEntityInvincible(Ped, true)
    TaskPlayAnim(Ped, anin_dir, anim,8.0, 8.0, -1, 1, 0.0, false, false, false)

end

CreateThread(function ()
    for k, v in pairs(Config.Zone)do
        SpawnPeds(v.hash,v.coord.x,v.coord.y,v.coord.z,v.heading, v.anim_dir, v.anim)
    end
end)

