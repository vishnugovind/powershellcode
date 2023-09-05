
New-Item -ItemType Directory -Path C:\Users\vishn\PowershllExercises\TestingPurpose
$folders = @('SubFolder1', 'SubFolder2') 

$folder1 = "C:\Users\vishn\PowershllExercises\TestingPurpose\SubFolder1" 
$folder2 = "C:\Users\vishn\PowershllExercises\TestingPurpose\SubFolder2"

foreach( $folder in $folders)
{
    New-Item -ItemType Directory -Path C:\Users\vishn\PowershllExercises\TestingPurpose\$folder 
    for($i =0; ($i -lt 51) -and ($folder -eq 'SubFolder1') ;$i++)
    {
        New-Item -ItemType File -Path C:\Users\vishn\PowershllExercises\TestingPurpose\$folder\TypeAtest$i
    }

    for($i =51; ($i -lt 101) -and ($folder -eq 'SubFolder2') ;$i++)
    {
        New-Item -ItemType File -Path C:\Users\vishn\PowershllExercises\TestingPurpose\$folder\TypeBtest$i
    }
}

foreach( $folder in $folders)
{
    if ($folder -eq 'SubFolder1') 
    {
    $oddfiles = Get-ChildItem -Path C:\Users\vishn\PowershllExercises\TestingPurpose\$folder -Recurse | 
                Where-Object {(($_.Name -like "*1") -or ($_.Name -like "*3") -or ($_.Name -like "*5") -or ($_.Name -like "*7") -or ($_.Name -like "*9"))}
    }

    if ($folder -eq 'SubFolder2') 
    {
    $evenfiles = Get-ChildItem -Path C:\Users\vishn\PowershllExercises\TestingPurpose\$folder -Recurse | 
                Where-Object {(($_.Name -like "*2") -or ($_.Name -like "*4") -or ($_.Name -like "*6") -or ($_.Name -like "*8") -or ($_.Name -like "*0"))}
    }
}

foreach($oddfile in $oddfiles)
{
    Move-Item -Path $oddfile -Destination $folder2
}
foreach($evenfile in $evenfiles)
{
    Move-Item -Path $evenfile -Destination $folder1
}

Rename-Item -Path $folder1 -NewName "OddFilesContainer" 
Rename-Item -Path $folder2 -NewName "EvenFilesContainer" 

Get-ChildItem -Path C:\Users\vishn\PowershllExercises\TestingPurpose -Recurse | Where-Object {($_.Name -like "TypeA*")} | Remove-Item
