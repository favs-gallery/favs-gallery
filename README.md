# favs-gallery
Browse local images, select favorites, then use a download manager to download the favorites

mongoose-free-5.6.exe will be reported as malware because it is a simple, lightweight, portable http server for Windows and that kind of software is usually malware. This is not. Check it out if you don't want to trust it.

You need to put all of these files into one directory:
	bootstrap.min.css
	jquery.justifiedGallery.min.js
	jquery-1.10.2.js
	justifiedGallery.min.css
	MakePreviewImages.ps1
	MakeThumbs.ps1
	mongoose.conf
	mongoose-free-5.6.exe
	README.txt
	template-foot
	template-head
	temp/ (this is a directory)

This guide assumes that you are placing these files and this folder into X:\Temp. If you are using a different directory then you must change two files:
	MakeThumbs.ps1
		- Change line 7 to point to the temp/ directory above, e.g., X:\Temp\temp
	mongoose.conf
		- Change line 15 to point to the directory where you placed all the files, e.g., X:\Temp

To use the gallery, copy the images that should be displayed in the gallery to the temp/ directory, e.g., X:\Temp\temp.
	- Only copy files with .jpg extension (seriously, nothing else, not even .jpeg)
	- Do not copy subdirectories, only put files directly into the temp/ directory

Open an elevated PowerShell prompt (Start > PowerShell > right-click > Run as Administrator):
	- Run this command: Set-ExecutionPolicy Unrestricted
	- Close PowerShell

Open a normal PowerShell prompt (Start > PowerShell)
	- Run this command: X:\Temp\MakeThumbs.ps1
	- In the future you can run this command by right-clicking the file and selecting Run with PowerShell

PowerShell will either finish the command or it will report some errors. If there are errors then figure them out and try again. Otherwise continue.

Check the temp/ folder. There should be twice as many images now; PowerShell will have generated thumbnails for each image and saved each thumbnail as "exactsamefilename_thumb.jpg".

Check the folder X:\Temp (or whatever you changed it to). There will be a new file named index.html. Don't edit this file or open it. PowerShell will overwrite the file automatically and only the webserver should access the file because it uses JavaScript that won't load if you open it directly.

Run X:\Temp\mongoose-free-5.6.exe. Allow Private networks when the Windows Firewall prompt comes up. Don't worry, it only listens on 127.0.0.1 so it will not be reachable from the network.

Open http://localhost:8080/ in a browser. The image gallery will appear. The maximum number of images that you can view in the gallery is: as many as your computer/browser/RAM can load in a single page at once.

At the very bottom of the gallery is a section named "Favorites". While browsing the gallery images can be added to the Favorites section by clicking on them. You cannot click on an image and have it load directly (nor middle click to open in a new tab). It'll just add it to the Favorites gallery.

After an image is in the Favorites section you can click it to browse to it (warning: browsing away from the page will clear your favorites) or middle-click it to open in a new tab (this will not clear your favorites).

There's another section of text links directly to the Favorites images, so you can add them to a download manager or otherwise make them easier to click/browse/save.

If you try to close the tab or try to navigate away from the page then you will be prompted before navigating away. This is done so the favorites list is not accidentally cleared by accidentally clicking on an image.

TO DO:
	- Change MakeThumbs.ps1 to support more/other file types
	- Or maybe just change to an entirely different thumbnail generator
	- Make a way to bulk download the images from Favorites
