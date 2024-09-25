# Define the root folder where the subfolders (e.g., Project1, Project2) are located
$rootFolderPath = "\\cro-fs\mischome$\Exam Accounts\Computer Science"

# Define the destination folder where the "COMPLETED CODING" files will be moved to
$destinationPath = "\\cro-fs\shared$\Technical\Computer Science Exams\Completed Work"

# Check if the root folder exists
if (-not (Test-Path $rootFolderPath)) {
    Write-Host "Root folder does not exist: $rootFolderPath" -ForegroundColor Red
    exit
}

# Check if the destination folder exists; if not, create it
if (-not (Test-Path $destinationPath)) {
    try {
        New-Item -Path $destinationPath -ItemType Directory -ErrorAction Stop
        Write-Host "Created destination folder: $destinationPath" -ForegroundColor Green
    } catch {
        Write-Host "Failed to create destination folder: $destinationPath" -ForegroundColor Red
        Write-Host $_.Exception.Message
        exit
    }
}

# Get all subfolders within the root folder
$subfolders = Get-ChildItem -Path $rootFolderPath -Directory

# Loop through each subfolder (e.g., Project1, Project2)
foreach ($subfolder in $subfolders) {
    try {
        # Define the path for the current subfolder
        $subfolderPath = $subfolder.FullName

        # Define the "COMPLETED CODING" folder path inside the current subfolder
        $completedCodingPath = Join-Path -Path $subfolderPath -ChildPath "COMPLETED CODING"

        # Check if the "COMPLETED CODING" folder exists
        if (Test-Path $completedCodingPath) {
            # Define the corresponding folder in the destination (e.g., "Project1" in destination)
            $projectDestinationPath = Join-Path -Path $destinationPath -ChildPath $subfolder.Name

            # Create the destination folder for this project if it doesn't exist
            if (-not (Test-Path $projectDestinationPath)) {
                try {
                    New-Item -Path $projectDestinationPath -ItemType Directory -ErrorAction Stop
                    Write-Host "Created destination folder for project: $projectDestinationPath" -ForegroundColor Green
                } catch {
                    Write-Host "Failed to create destination folder: $projectDestinationPath" -ForegroundColor Red
                    Write-Host $_.Exception.Message
                    continue
                }
            }

            # Move all files from the "COMPLETED CODING" folder to the project's destination folder
            Get-ChildItem -Path $completedCodingPath | ForEach-Object {
                try {
                    Move-Item -Path $_.FullName -Destination $projectDestinationPath -Force -ErrorAction Stop
                    Write-Host "Moved file: $($_.Name) to $projectDestinationPath" -ForegroundColor Green
                } catch {
                    Write-Host "Failed to move file: $($_.Name)" -ForegroundColor Red
                    Write-Host $_.Exception.Message
                }
            }

            # OPTIONAL: After moving, check if "COMPLETED CODING" folder is empty, and delete it
            try {
                if (-not (Get-ChildItem -Path $completedCodingPath)) {
                    Remove-Item -Path $completedCodingPath -Force -ErrorAction Stop
                    Write-Host "Deleted empty 'COMPLETED CODING' folder: $completedCodingPath" -ForegroundColor Green
                }
            } catch {
                Write-Host "Failed to delete 'COMPLETED CODING' folder: $completedCodingPath" -ForegroundColor Red
                Write-Host $_.Exception.Message
            }
        } else {
            Write-Host "'COMPLETED CODING' folder does not exist in $subfolderPath" -ForegroundColor Yellow
        }
    } catch {
        Write-Host "Error processing subfolder: $subfolderPath" -ForegroundColor Red
        Write-Host $_.Exception.Message
    }
}