local icons = require("icons")
local settings = require("settings")
local colors = require("colors")

local vpn = sbar.add("item","widgets.vpn", {
    position = "right",
    update_freq = 15,
    label = {
        padding_right = 4,
        drawing = "off"
    },
    icon = {
        padding_right = 0,
        padding_left = 4,
        drawing = "off"
    }
})

local vpn_bracket = sbar.add("bracket", "widgets.vpn.bracket", { vpn.name }, {
    background = { color = colors.bg1, drawing="off" }
})

local function update_vpn_status()
    local cisco_vpn = io.popen("ifconfig -a | grep 'flags=80d1<UP,POINTOPOINT,RUNNING,NOARP,MULTICAST> mtu'"):read("*a")
    local wireguard_vpn = io.popen("scutil --nc list | grep -E 'Connected.*glebchanskiy_wb'"):read("*a")
    local tunnelbear_vpn = io.popen("scutil --nc list | grep -E 'Connected.*TunnelBear'"):read("*a")

    print(tunnelbear_vpn)
    local is_vpn_active = false
    local current_drawing = vpn:query().drawing
    
    print(tunnelbear_vpn)
    if cisco_vpn ~= "" then
        vpn:set({
            icon = {
                string =  "􁅏",
                drawing = "on"
            }, -- Значок для TunnelBear
            label = {
                string = "cisco",
                drawing = "on"
            },
        })
        vpn_bracket:set({ background = { drawing = "on" } })
        is_vpn_active = true
    end

    if not is_vpn_active and wireguard_vpn ~= "" then
        vpn:set({
            icon = {
                string =  "􀀰",
                drawing = "on"
            }, -- Значок для TunnelBear
            label = {
                string = "guard",
                drawing = "on"
            },
        })
        vpn_bracket:set({ background = { drawing = "on" } })
        is_vpn_active = true
    end

    if not is_vpn_active and tunnelbear_vpn ~= "" then
        vpn:set({
            icon = {
                string =  "􀲭",
                drawing = "on"
            }, -- Значок для TunnelBear
            label = {
                string = "TunnelBear",
                drawing = "on"
            },
        })
        vpn_bracket:set({ background = { drawing = "on" } })
        is_vpn_active = true
    end

    -- Проверяем текущее состояние drawing перед установкой
    if not is_vpn_active and current_drawing ~= "off" then
        vpn:set({
            label = {
                drawing = "off"
            },
            icon = {
                drawing = "off"
            }
        })
        vpn_bracket:set({ background = { drawing = "off" } })
    end
end

vpn:subscribe("routine", update_vpn_status)