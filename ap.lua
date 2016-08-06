print("Running AP")

cfg={}
cfg.ssid="Shrimp"
cfg.pwd="prawnprawn"
wifi.ap.config(cfg)

cfg={}
cfg.ip="192.168.42.1"
cfg.netmask="255.255.255.0"
wifi.ap.setip(cfg)
wifi.setmode(wifi.SOFTAP)

cfg={}
cfg.start="192.168.42.100"
wifi.ap.dhcp.config(cfg)
print(wifi.ap.dhcp.start())

print("Started AP Shrimp")
