#!/bin/bash
# Save as ~/.config/hypr/scripts/rainbow_solid.sh

# Store original border colors and size
ORIGINAL_BORDER=$(hyprctl -j getoption general:col.active_border | jq -r '.str')
ORIGINAL_SIZE=$(hyprctl -j getoption general:border_size | jq -r '.int')

# Cleanup function to restore original settings on exit
cleanup() {
  hyprctl keyword general:col.active_border "$ORIGINAL_BORDER"
  hyprctl keyword general:border_size "$ORIGINAL_SIZE"
  echo "Restored original border settings"
  exit 0
}

# Set up cleanup on script exit
trap cleanup SIGINT SIGTERM

# Set a larger border size
hyprctl keyword general:border_size 2

echo "Smooth solid rainbow border effect active. Press Ctrl+C to exit."

# Start with red
R=200
G=140
B=140

while true; do
  # Use a solid color instead of a gradient
  hyprctl keyword general:col.active_border "rgb($R,$G,$B)"
  
  # Very small increments and longer pause for smooth transition
  
  # Red to Yellow
  for ((i=0; i<60; i++)); do
    G=$((G+1))
    if [ $G -gt 200 ]; then
      G=200
      break
    fi
    hyprctl keyword general:col.active_border "rgb($R,$G,$B)"
    sleep 0.1
  done
  
  # Yellow to Green
  for ((i=0; i<60; i++)); do
    R=$((R-1))
    if [ $R -lt 140 ]; then
      R=140
      break
    fi
    hyprctl keyword general:col.active_border "rgb($R,$G,$B)"
    sleep 0.1
  done
  
  # Green to Cyan
  for ((i=0; i<60; i++)); do
    B=$((B+1))
    if [ $B -gt 200 ]; then
      B=200
      break
    fi
    hyprctl keyword general:col.active_border "rgb($R,$G,$B)"
    sleep 0.1
  done
  
  # Cyan to Blue
  for ((i=0; i<60; i++)); do
    G=$((G-1))
    if [ $G -lt 140 ]; then
      G=140
      break
    fi
    hyprctl keyword general:col.active_border "rgb($R,$G,$B)"
    sleep 0.1
  done
  
  # Blue to Magenta
  for ((i=0; i<60; i++)); do
    R=$((R+1))
    if [ $R -gt 200 ]; then
      R=200
      break
    fi
    hyprctl keyword general:col.active_border "rgb($R,$G,$B)"
    sleep 0.1
  done
  
  # Magenta to Red
  for ((i=0; i<60; i++)); do
    B=$((B-1))
    if [ $B -lt 140 ]; then
      B=140
      break
    fi
    hyprctl keyword general:col.active_border "rgb($R,$G,$B)"
    sleep 0.1
  done
done