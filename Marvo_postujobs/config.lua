Config = {}

Config.Target = "OX" -- QB / OX

Config.PDWebHook = "WEBHOOK AQUI" -- Your webhook for police applications
Config.EMSWebHook = "WEBHOOK AQUI" -- Your webhook for EMS applications
Config.MechanicWebHook = "WEBHOOK AQUI" -- Your webhook for mechanic applications

Config.Applys = {
    -- PFA:
    [1] = {
        type = "police",
        name = "mrpd",
        label = "Postulacion PFA",
        coords = vector4(441.0, -980.25, 31.0, 0.0),
        ped = false,
        pedModel = "",
    },
     -- SAME
    [2] = {
        type = "ems",
        name = "pillbox_hospital",
        label = "SAME Postulacion",
        coords = vector4(299.08, -584.64, 43.26, 71.61),
        ped = true,
        pedModel = "s_m_m_scientist_01",
    },
    -- Mecanico
    [3] = {
        type = "mechanic",
        name = "ls_customs",
        label = "Mecanico Postulacion",
        coords = vector4(-355.44, -129.54, 39.43, 86.9),
        ped = true,
        pedModel = "s_m_m_lathandy_01",
    },
}