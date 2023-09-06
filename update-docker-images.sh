#!/bin/bash

# Constants (uppercase)
BRED='\033[1;31m'
COLOR_OFF='\033[0m'
BCYAN='\033[1;36m'
YELLOW='\033[0;33m'
LOG_FILE="updater-error.log"

# Function to log with timestamp
log() {
  local message="$1"
  local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
  echo -e "${timestamp} ${BCYAN} ${message} ${COLOR_OFF}"
}

# Function to log an error
log_error() {
  local message="$1"
  log "${BRED}Error: ${message}${COLOR_OFF}" | tee -a "$LOG_FILE"
}

# Function to update an image
update_image() {
  local image="$1"
  
  if ! docker image inspect "$image" > /dev/null 2>&1; then
    log_error "Image ${image} does not exist, skipping."
    return
  fi

  log "Updating ${image}..."
  echo -e "${YELLOW}"
  if ! docker pull "$image" 2>&1 | tee -a "$LOG_FILE"; then
    log_error "Updating ${image} failed"
  fi
  echo -e "${COLOR_OFF}"

  log "Process for ${image} completed."
}

# Check if Docker is running
if ! docker info > /dev/null 2>&1; then
  log_error "Docker is not running, exiting."
  exit 1
fi

# Get a list of all images
images=$(docker images --format "{{.Repository}}" | grep -v '<none>' | sort)

# Loop through each image
for image in $images; do
  update_image "$image"
done

log "Update process completed."
exit 0
