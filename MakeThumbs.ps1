# Delete all images in thumbs folder
# Make new thumbs
# Make new gallery


# Set the path to the images
$images = "X:\Temp\temp"

# Delete all thumbs in the images folder
Get-ChildItem $images | Where{$_.Name -Match "_thumb.jpg"} | Remove-Item



# Make new thumbnails
Get-ChildItem .\temp -Recurse -Include *.jpg | Foreach-Object {
	$newName = $_.FullName.Substring(0, $_.FullName.Length - 4) + "_thumb.jpg"
	.\MakePreviewImages.ps1 $_.FullName $newName 75
}



# Set the name of the gallery file to work on
$index = "index.html"

# Overwrite the existing file and add the header
Get-Content template-head | Set-Content $index

# Add to the new file appending the images
$files = (Get-ChildItem $images | Where{$_.Name -NotMatch "_thumb.jpg"})
foreach ($file in $files) {
	($base = ($file.name.substring(0, ($file.name.length - 4))))
	($append = "_thumb.jpg")
	Add-Content $index "`t`t`t`t<a href=""temp/$base.jpg""><img src=""temp/$base$append"" /></a>"
}

# Add to the new file appending the footer
Get-Content template-foot | Add-Content $index

