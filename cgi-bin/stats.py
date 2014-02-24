#!C:\Python33\python.exe -u
# -*- coding: UTF-8 -*-

# enable debugging
import cgi
import cgitb
cgitb.enable()
import struct
import array
import uuid
import mysql.connector
from mysql.connector import errorcode
import configparser
import re

def printRowsForChart(counts):
	for row in counts[:-1]:
		print("['{option}', {count}],".format(option=row[0], count=row[1]))
	print("['{option}', {count}]".format(option=counts[-1][0], count=counts[-1][1]))

def printRowsForChartNoQuotes(counts):
	for row in counts[:-1]:
		print("[{option}, {count}],".format(option=row[0], count=row[1]))
	print("[{option}, {count}]".format(option=counts[-1][0], count=counts[-1][1]))


print("Content-Type: text/html")
print("""
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Dark Souls death counter - Stats</title>
<link rel="stylesheet" type="text/css" href="../styles.css">
<style type="text/css">
</style>
</head>""")

#lists of various info to use in charts
countsOfDeaths = []
countsOfAdpp = []
countsOfPlaythroughs = []
countsOfProgress = []
countsOfSmornstein = []
countsOfOptionals = []

#default player info
name = ""
deaths = 0
progress = 0
playthrough = 0
adpp = 0

#get DB connection info
config = configparser.ConfigParser()
config.read('../conf/settings.ini')
dbInfo = config['db']

#connect to DB
try:
	dbConn = mysql.connector.connect(user=dbInfo['user'], password=dbInfo['password'], host=dbInfo['host'], database=dbInfo['database'])
	cursor = dbConn.cursor()
except mysql.connector.Error as err:
	if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
		print("Error: could not connect to the database")
	elif err.errno == errorcode.ER_BAD_DB_ERROR:
		print("Error: Database does not exists")
	else:
		print("Error: " + str(err))
else:
	# get data from form
	form = cgi.FieldStorage()
	if "name" in form:
		playerId = uuid.uuid4()
		name = form["name"].value
		deaths = form["deaths"].value
		shitholes = 1 if "optional-shitholes" in form else 0
		dragonbros = 1 if "optional-dragonbros" in form else 0
		asylum = 1 if "optional-asylum" in form else 0
		paintedworld = 1 if "optional-paintedworld" in form else 0
		manus = 1 if "optional-manus" in form else 0
		playthrough = form["playthrough"].value
		progress = form["progress"].value
		smornstein = form["smornstein"].value
		totalProgress = float(playthrough) + float(progress)
		if (totalProgress == 0):
			#treat as progress = .02 but don't want to mess up charts by explicitly setting progress as such
			adpp = deaths * 50
		else:
			adpp = round(float(deaths) / totalProgress)
		
		#input validation against patterns
		dataIsValid = False
		if re.match(r"^.{1,13}$", name) and \
		   re.match(r"^\d{1,6}$", deaths) and \
		   re.match(r"^\d$", str(playthrough)) and \
		   re.match(r"^0\.\d\d$", str(progress)) and \
		   re.match(r"^\d\d?$", str(smornstein)):
			dataIsValid = True
			
		if dataIsValid:
			#insert data from form into DB
			insertStatement = ("INSERT INTO characters "
								"(playerid, charactername, deaths, playthrough, progress, shitholes, dragonbros, asylum, paintedworld, manus, smornstein, adpp) "
								"VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)")
			insertData = (str(playerId), name, deaths, playthrough, progress, shitholes, dragonbros, asylum, paintedworld, manus, smornstein, adpp)
			cursor.execute(insertStatement, insertData)
			dbConn.commit()
		else:
			name = "";
			print("<h1 align=\"center\">BAD CHARACTER DATA</h1>")

	#get data from DB
	#ADPP
	queryAdpp = ("select * from adppcounts")
	cursor.execute(queryAdpp)
	countsOfAdpp = cursor.fetchall()

	#deaths
	queryDeaths = ("select * from deathcounts")
	cursor.execute(queryDeaths)
	countsOfDeaths = cursor.fetchall()

	#playthrough
	queryPlaythrough = ("select * from playthroughcounts")
	cursor.execute(queryPlaythrough)
	countsOfPlaythroughs = cursor.fetchall()

	#progress
	queryProgress = ("select * from progresscounts")
	cursor.execute(queryProgress)
	countsOfProgress = cursor.fetchall()

	#smornstein
	querySmornstein = ("select * from smornsteincounts")
	cursor.execute(querySmornstein)
	countsOfSmornstein = cursor.fetchall()

	#optional areas
	queryForOptionalValues = ("SELECT * FROM optionalcounts")
	cursor.execute(queryForOptionalValues)
	countsOfOptionals = cursor.fetchall()
	
	cursor.close()
	dbConn.close()

print("""
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
		<table id="table-char" style="display:none;">
  		<tr>
    		<td>Character: <span id="span-char" class="span-stat"></span></td>
  		</tr>
		</table>
  	<h2 class="your-stats" style="display:none;">Your average deaths per playthrough: <span id="span-ADPP" class="span-stat"></span></h2>
  	<div id="chart-ADPP"></div>
		<h2 class="your-stats" style="display:none;">Your total deaths across all playthroughs: <span id="span-deaths" class="span-stat"></span></h2>
		<div id="chart-deaths"></div>
		<h2 class="your-stats" style="display:none;">Your current playthrough: <span id="span-playthrough" class="span-stat"></span></h2>
		<div id="chart-playthrough"></div>
		<h2 class="your-stats" style="display:none;">Your current progress in this playthrough: <span id="span-progress" class="span-stat"></span> (approximate)</h2>
		<div id="chart-progress"></div>
		<h2 class="all-stats">Percent of players who completed each optional area:</h2>
		<div id="chart-optional"></div>
		<h2 class="all-stats">Top 5 favorite nicknames for Ornstein & Smough:</h2>
		<div id="chart-smornstein"></div>
	</div>
</div>
</div>
</body>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">""")
print("""
var character = "{name}";
var deaths = {deaths};
var ADPP = {adpp};
var playthrough = {playthrough};
var progress = {progress};
var fsize = '25'; // Larger font size if the player-specific titles don't show up.
var fname = 'Marcellus SC' // Fancier font, same deal.
""".format(name=name, deaths=deaths, progress=progress, playthrough=playthrough, adpp=adpp))
print("""
if(character !== "") // Show how the submitted character compares with global stats.
							// Users can still browse global stats without submitting a character,
							// in which case player-specific elements won't display.
{
  document.getElementById('span-char').innerHTML = character;
  document.getElementById('table-char').style.display = "table";
  yourStats = document.getElementsByClassName("your-stats");
  for (var i = 0; i < yourStats.length; i++)
  {
	yourStats[i].style.display = "inline";
  }
  fname = 'Arial';
  fsize = '15';
}
document.getElementById('span-ADPP').innerHTML = ADPP;
document.getElementById('span-deaths').innerHTML = deaths;
switch(playthrough)
{
 case 0:
 			document.getElementById('span-playthrough').innerHTML = "New Game";
			break;
 case 1:
 			document.getElementById('span-playthrough').innerHTML = "New Game +";
			break;
 case 2:
 			document.getElementById('span-playthrough').innerHTML = "New Game +2";
			break;
 case 3:
 			document.getElementById('span-playthrough').innerHTML = "New Game +3";
			break;
 case 4:
 			document.getElementById('span-playthrough').innerHTML = "New Game +4";
			break;
 case 5:
 			document.getElementById('span-playthrough').innerHTML = "New Game +5";
			break;
 case 6:
 			document.getElementById('span-playthrough').innerHTML = "New Game +6";
			break;
 case 7:
 			document.getElementById('span-playthrough').innerHTML = "New Game +7";
			break;
}
if(progress > 1)
{
 progress = 1;
}
document.getElementById('span-progress').innerHTML = progress * 100 + '%';

// Load the Visualization API and the piechart package.
google.load('visualization', '1.0', {'packages':['corechart']});

// Set a callback to run when the Google Visualization API is loaded.
google.setOnLoadCallback(drawChartADPP);
google.setOnLoadCallback(drawChartDeaths);
google.setOnLoadCallback(drawChartPlaythrough);
google.setOnLoadCallback(drawChartProgress);
google.setOnLoadCallback(drawChartOptional);
google.setOnLoadCallback(drawChartSmornstein);

// Callback that creates and populates a data table,
// instantiates the pie chart, passes in the data and
// draws it.
function drawChartADPP() {
  // Create and populate the data table.
  var data = new google.visualization.DataTable();
  data.addColumn('string', 'Deaths');
  data.addColumn('number', 'Players');
  data.addRows([""")
if len(countsOfAdpp) > 0:
	printRowsForChart(countsOfAdpp)
print("""]);
  
  var options = {
    title:"Average Deaths per Playthrough for All Players:",
		titleTextStyle: {color: '#CCBB00', fontSize: fsize, fontName: fname},
    width:1000, height:400,
    hAxis: {title: 'Deaths', titleTextStyle: {color: '#CCCCCC'}, textStyle: {color: '#CCCCCC'}},
    vAxis: {title: 'Players', titleTextStyle: {color: '#CCCCCC'}, textStyle: {color: '#CCCCCC'}},
    curveType: 'function',
    legend: {position: 'none'},
		backgroundColor: 'none',
		colors: ['#CCBB00']
  };

  // Create and draw the visualization.
  new google.visualization.LineChart(document.getElementById('chart-ADPP')).
      draw(data, options);
}

function drawChartDeaths() {
  // Create and populate the data table.
  var data = new google.visualization.DataTable();
  data.addColumn('string', 'Deaths');
  data.addColumn('number', 'Players');
  data.addRows([""")
if len(countsOfDeaths) > 0:
	printRowsForChart(countsOfDeaths)
print("""]);
  
  var options = {
    title:"Total Death Counts for All Players:",
		titleTextStyle: {color: '#CCBB00', fontSize: fsize, fontName: fname},
    width:1000, height:400,
    hAxis: {title: 'Deaths', titleTextStyle: {color: '#CCCCCC'}, textStyle: {color: '#CCCCCC'}},
    vAxis: {title: 'Players', titleTextStyle: {color: '#CCCCCC'}, textStyle: {color: '#CCCCCC'}},
    bar: {groupWidth: '90%'},
    legend: {position: 'none'},
		backgroundColor: 'none',
		colors: ['#CCBB00']
  };

  // Create and draw the visualization.
  new google.visualization.ColumnChart(document.getElementById('chart-deaths')).
      draw(data, options);
}

function drawChartPlaythrough() {
  // Create and populate the data table.
  var data = new google.visualization.DataTable();
  data.addColumn('number', 'Playthrough');
  data.addColumn('number', 'Survivors');
  data.addRows([""")
if len(countsOfPlaythroughs) > 0:
	printRowsForChartNoQuotes(countsOfPlaythroughs)
print("""]);

  var options = {
    title:"Global Completion Rate:",
		titleTextStyle: {color: '#CCBB00', fontSize: fsize, fontName: fname},
		curveType: "function",
    width: 1000, height: 400,
    vAxis: {title:"% of players completed", titleTextStyle: {color: '#CCCCCC'}, textStyle: {color: '#CCCCCC'}},
    hAxis: {ticks: [{v:0, f:'NG'},{v:1, f:'NG+'},{v:2, f:'NG+2'},{v:3, f:'NG+3'},{v:4, f:'NG+4'},{v:5, f:'NG+5'},{v:6, f:'NG+6'},{v:7, f:'NG+7'}], textStyle: {color: '#CCCCCC'}},
    legend: {position: 'none'},
    backgroundColor: 'none',
		colors: ['#CCBB00']
                }
                 
  // Create and draw the visualization.
  new google.visualization.LineChart(document.getElementById('chart-playthrough')).
      draw(data, options);
}

function drawChartProgress() {
  // Create and populate the data table.
  var data = new google.visualization.DataTable();
  data.addColumn('number', 'Playthrough');
  data.addColumn('number', 'Survivors');
  data.addRows([""")
if len(countsOfProgress) > 0:
	printRowsForChartNoQuotes(countsOfProgress)
print("""]);

  var options = {
    title:"Global Completion Rate (within current playthrough):",
		titleTextStyle: {color: '#CCBB00', fontSize: fsize, fontName: fname},
		curveType: "none",
    width: 1000, height: 400,
    vAxis: {title:"% of players completed", titleTextStyle: {color: '#CCCCCC'}, textStyle: {color: '#CCCCCC'}},
    hAxis: {ticks: [{v:0, f:' '},{v:1, f:'Asylum Demon'},{v:2, f:'1st Bell'},{v:3, f:'2nd Bell'},{v:4, f:"Sen\'s Fortress"},{v:5, f:'Anor Londo'},{v:6, f:'1/4 Lord Souls'},{v:7, f:'2/4 Lord Souls'}, {v:8, f:'3/4 Lord Souls'}, {v:9, f:'4/4 Lord Souls'}], textStyle: {color: '#CCCCCC'}},
    legend: {position: 'none'},
    backgroundColor: 'none',
		colors: ['#CCBB00']
                }
                 
  // Create and draw the visualization.
  new google.visualization.LineChart(document.getElementById('chart-progress')).
      draw(data, options);
}

function drawChartOptional() {
  // Create and populate the data table.
  var data = new google.visualization.DataTable();
  data.addColumn('string', 'Deaths');
  data.addColumn('number', 'Frequency');
  data.addRows([""")
if len(countsOfOptionals) > 0:
	printRowsForChart(countsOfOptionals)
print("""]);
  
  var options = {
    width:1000, height:400,
		hAxis: {textStyle: {color: '#CCCCCC'}},
    vAxis: {title: '% of players completed', titleTextStyle: {color: '#CCCCCC'},textStyle: {color: '#CCCCCC'}},
    bar: {groupWidth: '90%'},
    legend: {position: 'none'},
		backgroundColor: 'none',
		colors: ['#CCBB00']
  };

  // Create and draw the visualization.
  new google.visualization.ColumnChart(document.getElementById('chart-optional')).
      draw(data, options);
}

function drawChartSmornstein() {
  // Create and populate the data table.
  var data = new google.visualization.DataTable();
  data.addColumn('string', 'Deaths');
  data.addColumn('number', 'Frequency');
  data.addRows([""")
if len(countsOfSmornstein) > 0:
	printRowsForChart(countsOfSmornstein)
print("""]);
  
  var options = {
    width:1000, height:400,
		hAxis: {textStyle: {color: '#CCCCCC'}},
    vAxis: {title: 'Votes', titleTextStyle: {color: '#CCCCCC'}, textStyle: {color: '#CCCCCC'}},
    bar: {groupWidth: '90%'},
    legend: {position: 'none'},
		backgroundColor: 'none',
		colors: ['#CCBB00']
  };

  // Create and draw the visualization.
  new google.visualization.ColumnChart(document.getElementById('chart-smornstein')).
      draw(data, options);
}
</script>
</html>
""")
