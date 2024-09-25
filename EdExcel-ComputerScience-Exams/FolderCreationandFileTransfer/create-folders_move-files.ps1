# Define the root folder where subfolders are located
$rootFolderPath = "\\cro-fs\mischome$\Exam Accounts\Computer Science"

# Define the source folder where the files will be copied from
$sourceFolderPath = "\\cro-fs\shared$\Technical\Computer Science Exams\Exam Files"

# Check if the root folder exists
if (-not (Test-Path $rootFolderPath)) {
    Write-Host "Root folder does not exist: $rootFolderPath"
    exit
}

# Check if the source folder exists
if (-not (Test-Path $sourceFolderPath)) {
    Write-Host "Source folder does not exist: $sourceFolderPath"
    exit
}

# Get all subfolders within the root folder
$subfolders = Get-ChildItem -Path $rootFolderPath -Directory

# Loop through each subfolder
foreach ($subfolder in $subfolders) {
    # Define the path for the current subfolder
    $subfolderPath = $subfolder.FullName

    # Define the "STUDENT CODING" and "COMPLETED CODING" folder paths
    $studentCodingPath = Join-Path -Path $subfolderPath -ChildPath "STUDENT CODING"
    $completedCodingPath = Join-Path -Path $subfolderPath -ChildPath "COMPLETED CODING"

    # Create the "STUDENT CODING" folder if it doesn't exist
    if (-not (Test-Path $studentCodingPath)) {
        New-Item -Path $studentCodingPath -ItemType Directory
        Write-Host "Created folder: $studentCodingPath"
    } else {
        Write-Host "Folder already exists: $studentCodingPath"
    }

    # Create the "COMPLETED CODING" folder if it doesn't exist
    if (-not (Test-Path $completedCodingPath)) {
        New-Item -Path $completedCodingPath -ItemType Directory
        Write-Host "Created folder: $completedCodingPath"
    } else {
        Write-Host "Folder already exists: $completedCodingPath"
    }

    # Copy all files from the source folder to the "STUDENT CODING" folder
    Get-ChildItem -Path $sourceFolderPath | ForEach-Object {
        Copy-Item -Path $_.FullName -Destination $studentCodingPath -Force
        Write-Host "Copied file: $($_.Name) to $studentCodingPath"
    }
}
