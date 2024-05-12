CreateThread(function()
    for k,v in pairs(Config.Applys) do
        if Config.Target == "OX" then
            exports.ox_target:addBoxZone({
                name = v.name,
                coords = vec4(v.coords.x, v.coords.y, v.coords.z, v.coords.w),
                size = vec3(0.75, 0.75, 4.0),
                rotation = 0.0,
                options = {
                    {
                        onSelect = function()
                            TriggerEvent('ld_jobapplys:openApply', v.type)
                        end,
                        icon = 'fa-solid fa-circle',
                        label = 'Job application',
                    }
                }
            })
        elseif Config.Target == "QB" then
            exports['qb-target']:AddBoxZone(v.name, vector3(v.coords.x, v.coords.y, v.coords.z-1), 1, 1, {
                name = v.name,
                heading = v.coords.w,
                debugPoly = false,
                minZ = v.coords.z-1,
                maxZ = v.coords.z+1,
            }, {
                options = {
                    {
                        name = 'v.name',
                        action = function()
                            TriggerEvent('ld_jobapplys:openApply', v.type)
                        end,
                        icon = 'fa-solid fa-shield',
                        label = "Job application",
                    }
                },
                distance = 2.3
            })
        end
        if v.ped then
            local modelHash = GetHashKey(v.pedModel)
            RequestModel(modelHash)
            while not HasModelLoaded(modelHash) do
                Wait(1)
            end
            local ped = CreatePed(1, modelHash, v.coords.x, v.coords.y, v.coords.z-1, v.coords.w, false, true)
            FreezeEntityPosition(ped, true)
            SetEntityInvincible(ped, true)
            SetBlockingOfNonTemporaryEvents(ped, true)
        end
    end
end)

RegisterNetEvent('ld_jobapplys:openApply', function(type)
    if type == "ems" then
        local input = lib.inputDialog('Postulacion para SAME', {
            {type = 'input', label = 'Nombre y apellido', description = 'Tu nombre aca...', required = true},
            {type = 'number', label = 'Cual es tu edad?', description = 'Tu edad aqui..', required = true},
            {type = 'date', label = 'Fecha de nacimiento', icon = {'far', 'calendar'}, format = "DD/MM/YYYY", required = true},
            {type = 'input', label = 'Numero de telefono', description = 'Tu numero de telefono aqui...', required = true},
            {type = 'select', label = 'Genero', options = {
                {value = 'Male', label = 'Hombre'},
                {value = 'Woman', label = 'Mujer'}
            }, required = true},
            {type = 'select', label = 'Tienes experiencia en este trabajo?', options = {
                {value = 'Yes', label = 'si'},
                {value = 'No', label = 'No'}
            }, required = true},
            {type = 'textarea', label = 'Por qué quieres convertirte en SAME?', required = true, min = 10, max = 300},
            {type = 'input', label = 'Discord:', required = true},
          })
    
         TriggerServerEvent('ld_jobapplys:sendApply', input, "ambulance")
    elseif type == "police" then
        local input = lib.inputDialog('Postulacion para el trabajo de POLICIA', {
            {type = 'input', label = 'Nombre y apellido', description = 'Tu nombre aqui...', required = true},
            {type = 'number', label = 'Cual es tu edad?', description = 'Tu edad aqui..', required = true},
            {type = 'date', label = 'Fecha de nacimiento', icon = {'far', 'calendar'}, format = "DD/MM/YYYY", required = true},
            {type = 'input', label = 'Numero de telefono', description = 'Tu nombre aqui...', required = true},
            {type = 'select', label = 'Genero', options = {
                {value = 'Male', label = 'Hombre'},
                {value = 'Woman', label = 'Mujer'}
            }, required = true},
            {type = 'select', label = 'Tienes experiencia en este trabajo?', options = {
                {value = 'Yes', label = 'Yes'},
                {value = 'No', label = 'No'}
            }, required = true},
            {type = 'textarea', label = 'Por qué quieres convertirte en Oficial de policia?', required = true, min = 10, max = 300},
            {type = 'input', label = 'Discord:', required = true},
          })
    
         TriggerServerEvent('ld_jobapplys:sendApply', input, "police")
    elseif type == "mechanic" then
        local input = lib.inputDialog('Postulacion para MECANICO', {
            {type = 'input', label = 'Nombre y apellido', description = 'Tu nombre aqui...', required = true},
            {type = 'number', label = 'Cual es tu edad?', description = 'Tu edad aqui..', required = true},
            {type = 'date', label = 'Fecha de nacimiento', icon = {'far', 'calendar'}, format = "DD/MM/YYYY", required = true},
            {type = 'input', label = 'Numero de telefono', description = 'Tu numero aqui...', required = true},
            {type = 'select', label = 'Genero', options = {
                {value = 'Male', label = 'Hombre'},
                {value = 'Woman', label = 'Mujer'}
            }, required = true},
            {type = 'select', label = 'Tienes experiencia en este trabajo?', options = {
                {value = 'Yes', label = 'Yes'},
                {value = 'No', label = 'No'}
            }, required = true},
            {type = 'textarea', label = 'Por qué quieres convertirte en Mecanico?', required = true, min = 10, max = 300},
            {type = 'input', label = 'Discord:', required = true},
          })
    
         TriggerServerEvent('ld_jobapplys:sendApply', input, "mechanic")
    end
end)