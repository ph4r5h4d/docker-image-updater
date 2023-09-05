# Project Name: Docker Image Updater

## Overview
This project hosts a Bash script designed to automate the process of updating Docker images. It checks for the existence of each specified image, pulls the latest version if available, and logs the results, including any errors, to a log file.

## Usage
To use this script, follow these steps:

1. Clone the Git repository:
```Bash
git clone git@github.com:ph4r5h4d/docker-image-updater.git
```

2. Make the script executable:
```Bash
chmod +x update-docker-images.sh
```

3. Run the script:
```Bash
./update-docker-images.sh
```

The script will perform the following tasks:
  - Check if Docker is running.
  - Get a list of all Docker images excluding those with "\<none\>" as the repository name.
    - Loop through each image and attempt to update it.

## Logging
All logs and errors are recorded in the `updater-error.log` file. If any errors occur during the update process, they will be logged in red text in this file for reference.

## Prerequisites
- Docker must be installed and running for this script to work.
- Ensure that the script has execute permission (`chmod +x`) before running it.

## License
This script is provided under the MIT License. You can find the license details in the [LICENSE](LICENSE) file.

## Issues and Contributions
If you encounter any issues or have suggestions for improvements, please feel free to open an issue or submit a pull request on the GitHub repository.

## Author
This script was created by @Ph4r5h4d and is maintained on GitHub at [ph4r5h4d/docker-image-updater](https://github.com/ph4r5h4d/docker-image-updater). 

Thank you for using the Docker Image Updater script!