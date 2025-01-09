sbar.exec('killall stats_provider >/dev/null; $CONFIG_DIR/helpers/event_providers/stats_provider --cpu usage --memory ram_used --network en0')


require("items.widgets.battery")
require("items.widgets.volume")
require("items.widgets.wifi")
require("items.widgets.cpu")
require("items.widgets.memory")
require("items.widgets.vpn")
