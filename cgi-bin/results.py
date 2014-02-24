#!C:\Python33\python.exe -u
# -*- coding: UTF-8 -*-

# enable debugging
import cgi
import cgitb
cgitb.enable()
import struct
import array

def getCharsAndDeaths():
	chars = []
	form = cgi.FieldStorage()
	if "dsSaveFile" not in form:
		print("No save file input. You can either <a href='/index.html'>submit a save file</a> or <a href='stats.py'>view other players' stats.</a><br>")
	else:
		saveFile = form["dsSaveFile"]
		if saveFile.file and saveFile.done != -1 and len(saveFile.value) == 4330480:
			saveFile.file.seek(0x2c0, 0)
			for slot in range(0, 10):
				saveFile.file.seek(0x100, 1)
				name = saveFile.file.read(32)
				if name[0] != '\00':
					saveFile.file.seek(-0x120, 1)
					saveFile.file.seek(0x1f128, 1)
					deaths = saveFile.file.read(4)
					saveFile.file.seek(-0x04, 1)
					saveFile.file.seek(-0x1f128, 1)
					charName = name.decode('utf-16').split('\00')[0]
					charDeaths = struct.unpack('i', deaths)[0]
					if charName != "":
						chars.append([charName, charDeaths])
				else:
					saveFile.file.seek(-0x120, 1)
				saveFile.file.seek(0x60190, 1)
		else:
			print("Did not input a valid file. However, enjoy everyone else's stats:<br>")
	return chars

print("Content-Type: text/html")
print("""
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<noscript>
<p>Sorry, we can't analyze your stats without scripting enabled.</p>
</noscript>
<html>
<head>
<title>Dark Souls death counter - Results</title>
<link rel="stylesheet" type="text/css" href="../styles.css">
<style type="text/css">
html
{
 background-image:url(../images/BG_torchbastards_fade.jpg);
}
</style>
</head>
<body>
<div class="header">
</div>
<div class="wrapper">
<div class="container">
	<div class="navbar">
  	<ul>
  		<li><a href="../index.html">Home</a></li>
  		<li><a href="stats.py">Stats</a></li>
  		<li><a href="../about.html">About</a></li>
  	</ul>
	</div>
	<div class="content">
	<p>Here are your results!  Click the link next to one of your characters to refine your stats.</p>
  	<table id="table-results">""")

charList = 	getCharsAndDeaths()

for x in range(0, len(charList)):
	print("""
  		<tr id="char{x}" class="tr-char" style='display: block;'>
    		<td>Character: <span id="span-char{x}">{name}</span></td>
    		<td>Total deaths: <span id="span-deaths{x}">{deaths}</span></td>
				<td><form id="saveFile" method="POST" action="submit.py" target="_blank" >
						<input type="hidden" name="name" value="{name}" />
						<input type="hidden" name="deaths" value="{deaths}" />
						<input type="submit" id="submit" value="Stats for this character" />
					</form>
  		</tr>""".format(x=x, name=charList[x][0], deaths=charList[x][1]))
		
print("""
		</table>
	</div>
</div>
</div>
""")

