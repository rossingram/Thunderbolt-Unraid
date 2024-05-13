#!/bin/bash
# Navigate to the Thunderbolt devices directory
echo "Navigating to Thunderbolt devices directory..."
cd /sys/bus/thunderbolt/devices/domain0/0-0/

# Perform the actions for device 0-1
echo "Setting up device 0-1..."
cd 0-1
authorized=$(cat authorized)
if [ $authorized -eq 0 ]; then
  echo "Setting authorized to 1 for device 0-1..."
  echo 1 > authorized
  authorized=$(cat authorized)
fi
echo "Rescanning PCI devices..."
echo 1 > /sys/bus/pci/rescan
cd ..

# Perform the actions for device 0-3
echo "Setting up device 0-3..."
cd 0-3
authorized=$(cat authorized)
if [ $authorized -eq 0 ]; then
  echo "Setting authorized to 1 for device 0-3..."
  echo 1 > authorized
  authorized=$(cat authorized)
fi
echo "Rescanning PCI devices..."
echo 1 > /sys/bus/pci/rescan
cd ..
echo 1 > /sys/bus/pci/rescan

echo "Script execution completed."

exit 0
