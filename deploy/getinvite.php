<?php
include("config.php");
$yourip = md5($REMOTE_ADDR);
$connect = mysql_connect("$user_hostname", "$user_username", "$user_password");

$uID = $_REQUEST['uID'];
$u = $_REQUEST['u'];
$sender = $_REQUEST['sender'];
$receiver = $_REQUEST['uID'];
$lang = $_REQUEST['lang'];
?>

<html>

<head>
<title><?php echo $sender; ?></title>
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

</head>

<body topmargin="0" leftmargin="0" marginwidth="0" marginheight="0">

<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="250" height="200" id="myFlash<?php echo $sender; ?><?php echo $receiver; ?>" align="middle">
<param name="allowScriptAccess" value="sameDomain" />
<param name="movie" value="<?php echo $baseurl; ?>AcceptDecline.swf?lang=<?php echo $lang; ?>&instance=<?php echo $sender; ?><?php echo $receiver; ?>&receiver=<?php echo $receiver; ?>&sender=<?php echo $sender; ?>&uID=<?php echo $receiver; ?>&u=<?php echo $u; ?>" />
<param name="quality" value="high" />
<param name="bgcolor" value="<?php echo $bgcolor;?>" />
<embed src="<?php echo $baseurl; ?>AcceptDecline.swf?lang=<?php echo $lang; ?>&instance=<?php echo $sender; ?><?php echo $receiver; ?>&receiver=<?php echo $receiver; ?>&sender=<?php echo $sender; ?>&uID=<?php echo $receiver; ?>&u=<?php echo $u; ?>" quality="high" bgcolor="#<?php echo $bgcolor;?>" width="250" height="200" swLiveConnect="true" name="myFlash<?php echo $sender; ?><?php echo $receiver; ?>" align="middle" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
</object>

</body>

</html>

