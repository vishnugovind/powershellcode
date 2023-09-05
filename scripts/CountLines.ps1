param
(
    [String] $path = "",
    [String] $strings_to_count = "",
)

$filecontent = Get-Content -Path $path

foreach ($word in $strings_to_count)
{
    $count = 0
    foreach($line in $filecontent)
    {         
        if ($line -match $word)
        {
            $count++
        }
    }
}