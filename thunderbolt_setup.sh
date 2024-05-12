#!/bin/bash

# Navigate to the Thunderbolt devices directory
echo "Navigating to Thunderbolt devices directory..."
cd /sys/bus/thunderbolt/devices/domain0/0-0/

# Display the contents of the authorized file
echo "Displaying contents of the authorized file..."
authorized=$(cat authorized)

if [ $authorized -eq 0 ]; then
  # Set authorized to 1
  echo "Setting authorized to 1..."
  echo 1 > authorized
  # Confirm it is set to 1
  echo "Confirming authorized is set to 1..."
  authorized=$(cat authorized)
fi

# Rescan PCI devices
echo "Rescanning PCI devices..."
echo 1 > /sys/bus/pci/rescan

echo "Script execution completed."

exit 0
