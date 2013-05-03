<?php
include("config.php");
$yourip = md5($REMOTE_ADDR);

$uID = $_REQUEST['uID'];

$siteID = $_REQUEST['siteID'];

if ($siteID == ""){
	$siteID = "default";
}

if ($uID == ""){
	$uID = "default";
}

$lang = $_REQUEST['lang'];

if ($lang == ""){
	$lang = "en";
}
?>
<HTML>
<HEAD>
<meta http-equiv=Content-Type content="text/html;  charset=ISO-8859-1">
<title><?php echo"$servicename"?></title>
<script language=JavaScript>
	window.focus();
</script>

<script language="JavaScript"> 
function openNewWindow(URLtoOpen, windowName, windowFeatures) {
newWindow=window.open(URLtoOpen, windowName, windowFeatures);
 if(!newWindow){
  alert("Please Disable Your Pop up Blocker. You are missing messages people are sending you!");
  }
 }
</script>
</HEAD>
<body bgcolor="<?php echo $bgcolor;?>" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="230" height="365" id="myFlash" align="middle">
<param name="allowScriptAccess" value="sameDomain" />
<param name="movie" value="flashcommunicator.swf?lang=<?php echo $lang; ?>&uID=<?php echo"$uID"?>&siteID=<?php echo"$siteID"?>" />
<param name="quality" value="high" />
<param name="bgcolor" value="<?php echo $bgcolor;?>" />
<embed src="flashcommunicator.swf?lang=<?php echo $lang; ?>&uID=<?php echo"$uID"?>&siteID=<?php echo"$siteID"?>" quality="high" bgcolor="#<?php echo $bgcolor;?>" width="230" height="365" swLiveConnect="true" name="myFlash" align="middle" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
</object>

</BODY>
</HTML>