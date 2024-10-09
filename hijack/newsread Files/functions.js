function otvor(adresa, xova, yova)
{
	xova=xova+20
	yova=yova+20
	okno=window.open(adresa,"","toolbar=no,scrollbars=yes,location=no,status=no,screenX=20,screenY=20,width="+xova+",height="+yova+",resizable=1")
}
function SetCookie(cookieName,cookieValue,nDays) {
	var today = new Date();
	var expire = new Date();
	if (nDays==null || nDays==0) nDays=1;
	expire.setTime(today.getTime() + 3600000*24*nDays);
        document.cookie = cookieName+"="+escape(cookieValue)+ ";expires="+expire.toGMTString(),";path=/";
}
function getZone() {
	var d = new Date();
        var offset = (( -1 * d.getTimezoneOffset()) / 60) * 100;
	SetCookie('boxtz', offset, 30);
}
function openSpellChecker() {
	var speller = new spellChecker();
	speller.spellCheckAll();
}
getZone();
if (window != top)         
	top.location.href=location.href 
