# Thunderbolt-Unraid

## Background
I have two Envoy Express drives (https://www.owc.com/solutions/envoy-express) working with Unraid. Below are instructions that I followed to get it working.

1. Navigate to `/sys/bus/thunderbolt/devices/domain0/0-0/`(0-1 or 0-3 are my devices)
2. Display the contents of the authorized file: `cat authorized`
3. If this is currently a 0 then: `echo 1 > authorized`
4. Confirm it is now a 1: `cat authorized`
5. Run `echo 1 > /sys/bus/pci/rescan`

## Helpful Commands:
- `cat device_name` - used to identify you're working with the correct device.

### Reference Links:
- (https://forums.unraid.net/topic/123906-list-of-working-thunderbolt-services-and-supported-thunderbolt-card-host-combinations-in-unraid/)
  - Note: Add the following line to the /etc/udev/rules.d/99-local.rules file: `ACTION=="add", SUBSYSTEM=="thunderbolt", ATTR{authorized}=="0", ATTR{authorized}="1"` (this didn't work for me, as .rules file is not persistant after boot)
- (https://www.kernel.org/doc/html/v4.13/admin-guide/thunderbolt.html)

