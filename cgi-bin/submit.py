#!C:\Python33\python.exe -u
# -*- coding: UTF-8 -*-

# enable debugging
import cgi
import cgitb
cgitb.enable()
import struct
import array

form = cgi.FieldStorage()

print("Content-Type: text/html")
print("""
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<noscript>
<p>Sorry, we can't analyze your stats without scripting enabled.</p>
</noscript>
<title>Dark Souls death counter - Submit your stats</title>
<link rel="stylesheet" type="text/css" href="../styles.css">
<style type="text/css">
html
{
 background-image:url(../images/BG_capra2_fade.jpg);
}
</style>
</head>
<body>
<div class="header"></div>
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
  	<table id="table-char">
  		<tr>""")
print("""
    		<td>Character: <span id="span-char">{name}</span></td>
    		<td>Total deaths: <span id="span-deaths">{deaths}</span></td>
  		</tr>
		</table>
  	<form name="playerInfo" method="POST" action="stats.py" enctype="multipart/form-data" >
  		<p>Help us make pretty graphs!  Fill in a little extra information about your progress so we can make the stats page more useful and show you how you stack up against everyone else.  Don't worry; everything is anonymous, so nobody will have to know how much you suck at this game.</p>
		<div id="extraCharInfos"><div class="extra-info">
			<label for="playthrough">What's the highest <a href="http://darksouls.wikidot.com/new-game-plus" class="spoiler-link">playthrough</a> you've COMPLETED with this character?</label>
			<select id="playthrough" name="playthrough" >
				<option value="0">None</option>
				<option value="1">New game</option>
				<option value="2">New game +</option>
				<option value="3">New game +2</option>
				<option value="4">New game +3</option>
				<option value="5">New game +4</option>
				<option value="6">New game +5</option>
				<option value="7">New game +6</option>
				<option value="8">I have beaten NG+7 or higher.  Please send help.</option>
			</select>
				<p></p>
			<label for="progress">What's the furthest <a href="http://darksouls.wikidot.com/areas" class="spoiler-link">area</a> you've COMPLETED with this character in your latest playthrough?</label>
			<select id="progress" name="progress" >
				<option value="0">None</option>
				<option value="0.05">Undead Asylum</option>
				<option value="0.20">1st Bell (Undead Parish)</option>
				<option value="0.30">2nd Bell (Quelaag's Domain)</option>
				<option value="0.40">Sen's Fortress</option>
				<option value="0.50">Anor Londo</option>
				<option value="0.60">1/4 Lord Souls (Seath/Nito/etc.)</option>
				<option value="0.70">2/4 Lord Souls</option>
				<option value="0.80">3/4 Lord Souls</option>
				<option value="0.95">4/4 Lord Souls</option>
			</select>
			<p>Check all of the optional areas that you've COMPLETED:</p>
			
			<input type="checkbox" id="optional-shitholes" name="optional-shitholes" />
			<label for="optional-shitholes">Lower Undead Burg/Depths</label>
			
			<input type="checkbox" id="optional-dragonbros" name="optional-dragonbros" />
			<label for="optional-dragonbros">Great Hollow/Ash Lake</label>
			
			<input type="checkbox" id="optional-asylum" name="optional-asylum" />
			<label for="optional-asylum">Undead Asylum (2nd visit)</label>
			
			<input type="checkbox" id="optional-paintedworld" name="optional-paintedworld" />
			<label for="optional-paintedworld">Painted World of Ariamis</label>
			
			<input type="checkbox" id="optional-manus" name="optional-manus" />
			<label for="optional-manus">Additional Content (beat Manus)</label>
			<br />
			<p>What is your favorite nickname for Ornstein &amp; Smough?</p>
			<select id="smornstein" name="smornstein" >
				<option value="0">None</option>
				<option value="1">Anor Londo Attorneys</option>
				<option value="2">Asterix &amp; Obelix</option>
				<option value="3">Atlas &amp; P-body</option>
				<option value="4">Biggie Smalls</option>
				<option value="5">Fatboy Slim</option>
				<option value="6">Fatman &amp; Robin</option>
				<option value="7">Fuck This I Quit</option>
				<option value="8">James and the Giant Peach</option>
				<option value="9">Jay &amp; Silent Bob</option>
				<option value="10">Jonah and the Whale</option>
				<option value="11">Knight and the Round Table</option>
				<option value="12">Laurel &amp; Hardy</option>
				<option value="13">Penn &amp; Teller</option>
				<option value="14">Pikachu &amp; Snorlax</option>
				<option value="15">Ren &amp; Stimpy</option>
				<option value="16">Spade &amp; Farley</option>
				<option value="17">Super Londo Bros</option>
				<option value="18">Thunder &amp; Thighs</option>
				<option value="19">Timon &amp; Pumba</option>
			</select>
		</div>
		<input type="hidden" name="name" value="{name}" />
		<input type="hidden" name="deaths" value="{deaths}" />
  		<input type="submit" id="submit" value="Enough dicking around. How'd I do?" />
  		</form>""".format(name=form['name'].value, deaths=form['deaths'].value))
print("""
	<p></p>
	</div>
</div>
</div>
</body>
<script type="text/javascript">
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-47846181-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();
</script>
</html>
""")