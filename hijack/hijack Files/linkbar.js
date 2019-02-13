var news = new Array(
'juice: <a href=http://juice.box.sk/newsread.php?newsid=1989>:: The Trains Of Death ::  memoirs of...</a>',
'juice: <a href=http://juice.box.sk/newsread.php?newsid=2019>:: Random Story :: Beowulf By Anonymous...</a>',
'juice: <a href=http://juice.box.sk/newsread.php?newsid=2025>query for hackers</a>',
'juice: <a href=http://juice.box.sk/newsread.php?newsid=1987>:: The Trains Of Death :: memoirs of...</a>',
'juice: <a href=http://juice.box.sk/newsread.php?newsid=1988>:: The Trains Of Death :: memoirs of...</a>',
'juice: <a href=http://juice.box.sk/newsread.php?newsid=2022>:: Random Poetry :: by William...</a>',
'juice: <a href=http://juice.box.sk/newsread.php?newsid=2018>:: Random Story :: Beowulf  - prelude</a>',
'story: <a href=http://story.box.sk//newsread.php?newsid=95>The road Home</a>',
'story: <a href=http://story.box.sk//newsread.php?newsid=102>Mikova: The mother of Andy Warhol</a>',
'story: <a href=http://story.box.sk//newsread.php?newsid=93>Like Wild Geese</a>',
'story: <a href=http://story.box.sk//newsread.php?newsid=96>Kojsov: Ceremonial costumes</a>',
'story: <a href=http://story.box.sk//newsread.php?newsid=90>King Ladislav`s miracle</a>',
'story: <a href=http://story.box.sk//newsread.php?newsid=112>Herlany: The first borehole of geyser</a>',
'story: <a href=http://story.box.sk//newsread.php?newsid=111>Mikova: Something about the “flood...</a>',
'story: <a href=http://story.box.sk//newsread.php?newsid=110>Herlany: Villa of the Prime Minister...</a>',
'story: <a href=http://story.box.sk//newsread.php?newsid=109>Medzev: The beginnings of forging</a>',
'story: <a href=http://story.box.sk//newsread.php?newsid=108>Medzev: A view of the Birth of the...</a>',
'story: <a href=http://story.box.sk//newsread.php?newsid=107>Drienovec: Austro-Hungarian soldier</a>',
'story: <a href=http://story.box.sk//newsread.php?newsid=106>Medzev: The hamor (forge) and the...</a>',
'story: <a href=http://story.box.sk//newsread.php?newsid=105>Medzev: Rural houses of the town</a>',
'story: <a href=http://story.box.sk//newsread.php?newsid=104>Medzev: A view of the town in the year...</a>',
'story: <a href=http://story.box.sk//newsread.php?newsid=103>Rovne: Rusyns and the Wallachian right</a>',
'juice: <a href=http://juice.box.sk/newsread.php?newsid=2011>:: Random Movie :: Shortbus (2006)</a>',
'juice: <a href=http://juice.box.sk/newsread.php?newsid=2014>:: Random Poetry :: By Xoandre --...</a>',
'juice: <a href=http://juice.box.sk/newsread.php?newsid=2013>War on Terror, my ass !!!</a>',
'juice: <a href=http://juice.box.sk/newsread.php?newsid=2007>New Zealand police arrest teenage...</a>',
'juice: <a href=http://juice.box.sk/newsread.php?newsid=2005>:: Random Poetry :: Philip Larkin -...</a>',
'juice: <a href=http://juice.box.sk/newsread.php?newsid=2004>:: Juice Updates :: ideas - bug fix\'s...</a>',
'juice: <a href=http://juice.box.sk/newsread.php?newsid=2001>Playing games</a>',
'juice: <a href=http://juice.box.sk/newsread.php?newsid=1986>:: The Trains Of Death :: memoirs of...</a>');
var streams = new Array();
var boards = new Array();

streams[0] = new uroblink("", "select a site");
streams[1] = new uroblink("", "internet & computers");
streams[2] = new uroblink("http://astalavista.box.sk", "Astalavista :: search engine");
streams[3] = new uroblink("http://neworder.box.sk", "NewOrder :: comp. security portal");
streams[4] = new uroblink("", "operating systems");
streams[5] = new uroblink("http://linux.box.sk", "Linux");
streams[6] = new uroblink("http://easy.box.sk", "Windows");
streams[7] = new uroblink("", "development");
streams[8] = new uroblink("http://code.box.sk", "Code :: development portal");
streams[9] = new uroblink("http://edge.dev.box.sk", "Edge :: community engine");
streams[10] = new uroblink("", "multimedia & games");
streams[11] = new uroblink("http://dvd.box.sk", "DVD");
streams[12] = new uroblink("http://mp3.box.sk", "MP3 :: mp3 & music portal");
streams[13] = new uroblink("http://www.ggmania.com", "GG mania :: computer games");
streams[14] = new uroblink("http://eye.box.sk", "Eye :: computer graphics");
streams[15] = new uroblink("", "technology & science");
streams[16] = new uroblink("http://science.box.sk", "Science :: daily news & forums");
streams[17] = new uroblink("http://mobile.box.sk", "Mobile :: downloads & tips");
streams[18] = new uroblink("", "world & leisure");
streams[19] = new uroblink("http://travel.box.sk", "Travel :: articles & guides");
streams[20] = new uroblink("http://photo.box.sk", "Photo :: galleries & articles");
streams[21] = new uroblink("", "communities around box");
streams[22] = new uroblink("http://juice.box.sk", "Juice :: online community");
streams[23] = new uroblink("http://www.cassovia.sk", "Cassovia :: the city project");
streams[24] = new uroblink("http://titles.box.sk", "Titles: divx subtitles");
streams[25] = new uroblink("http://covers.box.sk", "Covers: dvd covers");

boards[0] = new uroblink("", "forums");
boards[1] = new uroblink("http://neworder.box.sk/forumm.php", "New Order computer security");
boards[2] = new uroblink("http://dvd.box.sk/boardm.php", "DVD related board");
boards[3] = new uroblink("http://mp3.box.sk/boardm.php", "MP3 board");
boards[4] = new uroblink("http://www.ggmania.com/forum/", "Computer games board");
boards[5] = new uroblink("http://science.box.sk/forumm.php", "Science board");
boards[6] = new uroblink("http://code.box.sk/boardm.php", "Coding related boards");
boards[7] = new uroblink("http://edge.dev.box.sk/forumm.php", "Edge engine development board");
boards[8] = new uroblink("http://linux.box.sk/forumm.php", "Linux boards");

var outer,inner,elementheight,ref,refX,refY;
var w3c=(document.getElementById)?true:false;
var ns4=(document.layers)?true:false;
var ie4=(document.all && !w3c)?true:false;
var ie5=(document.all && w3c)?true:false;
var ns6=(w3c && navigator.appName.indexOf("Netscape")>=0)?true:false;
var ua		= navigator.userAgent;
var opera	= /opera [56789]|opera\/[56789]/i.test(ua); 

var stop=2;
var boxwidth=270;         // BACKGROUND BOX WIDTH IN PIXELS.
var boxcolor=barbgcolor;   // BACKGROUND BOX COLOR.
var ktory=0;
var txt='';

////////////////////////////////////////////////////////////////////////////////////

function uroblink(url, name) 
{
	this.url = url;
	this.name = name;
}

function change(linka)
{
if(linka != "")
	location=linka;
}

function getElHeight(el){
if(ie4||ie5)return (el.style.height)? el.style.height : el.clientHeight;
else return (el.style.height)? parseInt(el.style.height):parseInt(el.offsetHeight);
}

function getPageLeft(el){
var x;
if(ie4||w3c){
x = 0;
while(el.offsetParent!=null){
x+=el.offsetLeft;
el=el.offsetParent;
}
x+=el.offsetLeft;
return x;
}}

function getPageTop(el){
var y;
if(ie4||w3c){
y=0;
while(el.offsetParent!=null){
y+=el.offsetTop;
el=el.offsetParent;
}
y+=el.offsetTop;
return y;
}}

function scrollbox()
{
//	inner.style.top='12px';
	if (ktory==news.length) ktory=0;
inner.innerHTML='&nbsp;<font style="font-weight:plain;font-family:arial,helvetica;font-size:'+fosize+';color:'+focolor+';">'+news[ktory];
	ktory++;	
	setTimeout('scrollbox()',4000);
}

window.onresize=function(){
if(!ns4){
outer.style.left=0+'px';
outer.style.top=2+'px';
}}

window.onload=function(){


if(!ns4){

outer=(ns4)?document.layers['outer']:(ie4)?document.all['outer']:document.getElementById('outer');
inner=(ns4)?outer.document.layers['inner']:(ie4)?document.all['inner']:document.getElementById('inner');
ref=(ns4)?document.layers['ref']:(ie4)?document.all['ref']:document.getElementById('ref');
elementheight=getElHeight(inner);

outer.style.left=0+'px';
outer.style.top=2+'px';
inner.style.top=20+'px';
inner.style.clip='rect(0px, '+(640)+'px, '+(elementheight)+'px, 0px)';
outer.style.visibility="visible";
inner.style.visibility="visible";
inner.innerHTML='&nbsp;<font style="link:red;font-family:arial,helvetica;font-size:'+fosize+';color:'+focolor+'">'+news[ktory];
scrollbox();
}

}


///////////////////////////////////////////////////////////



if(!ns4 && !opera){
with (document)
{
	writeln('<table border=0 cellpadding=0 cellspacing=0 width=100%><tr><td><FORM NAME="linky">');
	writeln('<div style="border:0px solid black; width:100%; height:20; padding:0; background-color:'+barbgcolor+'">');
	writeln('<div style="float:left; height:20; background:black;">');
	writeln('<a target=_blank href=http://www.box.sk><img border=0 src=http://topbar.box.sk/box.gif width=73 height=20></a></div><div style="float:left;">');
	
	writeln('&nbsp;<font style="font-family:arial,helvetica;color:'+focolor+'"> <SELECT style="width:230px; font-size:11; font-weight:plain; color:'+focolor+'; background:'+bagcolor+';" NAME="streams" onChange="change(this.options[this.selectedIndex].value)">');
	for (var i = 0; i < streams.length; i++) 
	{
		if(streams[i].url != "")
		{
			writeln('<OPTION style="color:'+focolor+'" VALUE="', streams[i].url, '">&nbsp;&nbsp;&nbsp;&nbsp;', streams[i].name);
			writeln('</OPTION>');
		}
		else
		{
			writeln('<OPTION style="background:'+mebagcolor+'; color:'+mefocolor+'"VALUE="', streams[i].url, '">', streams[i].name);
			writeln('</OPTION>');
		}
	}
	writeln('</SELECT>');
	
	writeln('</div><div style="float:left;">&nbsp;');
	
	writeln('<SELECT style="width:200;font-family:arial,helvetica;font-size:11;color:'+focolor+';font-weight:plain; background:'+bagcolor+';" NAME="boards" onChange="change(this.options[this.selectedIndex].value)">');
	for (var i = 0; i < boards.length; i++) 
	{
		if(boards[i].url != "")
			writeln('<OPTION style="color:'+focolor+'" VALUE="', boards[i].url, '">&nbsp;&nbsp;&nbsp;&nbsp;', boards[i].name);
		else	writeln('<OPTION style="background:'+mebagcolor+'; color:'+mefocolor+'" VALUE="', boards[i].url, '">', boards[i].name);
	}
	writeln('</SELECT></div>');
}

txt+='<div id="ref" style="float:left; top:10px;width:270; height:20;background-color:black" >';
txt+='<div id="outer" style="width:270; height:20; visibility:hidden; background-color:'+boxcolor+'; overflow:hidden" >';
txt+='<div id="inner" style="visibility:hidden; left:0px; top:3px; width:270; overflow:hidden; cursor:default;">';
txt+='</div></div></div></FORM></td></tr></table>';
 document.write(txt);
}







