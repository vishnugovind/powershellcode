$deletes = Get-Content -Raw $configPath | ConvertFrom-Json
$dirPath = $deletes.DirectoryPath
$files  = $deletes.FilesToRemove

foreach($file in $files)
{
    $fullpath = join-path -path $dirPath -childPath $file
    if(Test-Path -Path $fullpath)
    {
        Remove-Item -Path $fullpath
    }
}
