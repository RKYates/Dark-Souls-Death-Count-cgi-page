#!C:\Python33\python.exe -u
# -*- coding: UTF-8 -*-

# enable debugging
import cgi
import cgitb
cgitb.enable()
import struct
import array

def getDeathCountString(fo):
	writer = open("deaths.txt", "at", encoding="utf-8")
	fo.seek(0x2c0, 0)
	for slot in range(0, 10):
		fo.seek(0x100, 1)
		name = fo.read(32)
		if name[0] != '\00':
			fo.seek(-0x120, 1)
			fo.seek(0x1f128, 1)
			deaths = fo.read(4)
			fo.seek(-0x04, 1)
			fo.seek(-0x1f128, 1)
			charName = name.decode('utf-16').split('\00')[0]
			charDeaths = struct.unpack('i', deaths)[0]
			if charName != "" and charDeaths != 0:
				writer.write("%s,%d\n" % (charName, charDeaths))
		else:
			fo.seek(-0x120, 1)

		fo.seek(0x60190, 1)

print("Content-Type: text/html")
print()
print("""
<html>
 
<head><title>Dark Souls Death Count</title></head>

<body>""")

form = cgi.FieldStorage()
if "dsSaveFile" not in form:
	print("File somehow not in form!<br>")
else:
	saveFile = form["dsSaveFile"]
	if saveFile.file and saveFile.done != -1:
		getDeathCountString(saveFile.file)
		reader = open("deaths.txt")
		allCharsAndDeaths = []
		sum = 0
		for line in reader:
			dude = line.strip().split(',')
			allCharsAndDeaths.append(dude)
			sum += int(dude[1])
		print("Sum of all deaths: " + str(sum) + "<br>")
		print("Average deaths/character: " + str(sum / len(allCharsAndDeaths)) + "<br><br>All Characters:<br>")
		for dude in allCharsAndDeaths:
			print("name: %s\tdeaths: %s <br>" % (dude[0], dude[1]))
	else:
		print("Not a valid file!")
		print(saveFile)
		print(cgi.print_form(form))

print("""
</body>
</html>
""")
