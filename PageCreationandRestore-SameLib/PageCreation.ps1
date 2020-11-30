try 
   {
    $srcUrl = "Site Url" 
    $pageName = "Home"   
    
     Connect-PnPOnline -Url $srcUrl
     $tempFile = 'C:\MediaFiles\Test\'+ $pageName +'.xml'
     Export-PnPClientSidePage -Force -Identity $pageName -Out $tempFile

     $con = Get-Content $tempFile
     $sourcepage=$pageName +".aspx"
     $targetpage="Duplicate"+$pageName +".aspx"
     
     $con | % { $_.Replace($sourcepage, $targetpage) } | Set-Content $tempFile
     Apply-PnPProvisioningTemplate -Path  $tempFile
     write -host' Page created successfully'   
   
} 
catch {
    Write-Host - ForegroundColor Red 'Error ', ':'
    $Error[0].ToString();
   
}
