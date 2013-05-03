<?php
include("config.php");
$yourip = md5($REMOTE_ADDR);
$connect = mysql_connect("$user_hostname", "$user_username", "$user_password");

mysql_select_db("$user_database", $connect);
$id = $_REQUEST['id'];
$sql = "DELETE FROM invites WHERE id='$id'";	
$result = mysql_query($sql);
mysql_close($connect);

$uID = $_REQUEST['uID'];
$u = $_REQUEST['u'];
$sender = $_REQUEST['sender'];
$receiver = $_REQUEST['receiver'];
$lang = $_REQUEST['lang'];
?>

<html>

<head>
<title><?php echo $sender; ?></title>
<script language=JavaScript>
	window.focus();
</script>
<SCRIPT LANGUAGE=JavaScript>
<!--
var InternetExplorer = navigator.appName.indexOf("Microsoft") != -1;
function myFlash<?php echo $sender; ?><?php echo $receiver; ?>_DoFSCommand(command, args){
 var fet = 'menubar=no, width=400, height=500';
 window.open(args,command,fet);
}
if (navigator.appName && navigator.appName.indexOf("Microsoft") != -1 && 
  navigator.userAgent.indexOf("Windows") != -1 && navigator.userAgent.indexOf("Windows 3.1") == -1) {
  document.write('<SCRIPT LANGUAGE=VBScript\> \n');
  document.write('on error resume next \n');
  document.write('Sub myFlash<?php echo $sender; ?><?php echo $receiver; ?>_FSCommand(ByVal command, ByVal args)\n');
  document.write(' call myFlash<?php echo $sender; ?><?php echo $receiver; ?>_DoFSCommand(command, args)\n');
  document.write('end sub\n');
  document.write('</SCRIPT\> \n');
} 
//-->
</SCRIPT>
<script language="JavaScript"> 
function openNewWindow(URLtoOpen, windowName, windowFeatures) {
newWindow=window.open(URLtoOpen, windowName, windowFeatures);
 if(!newWindow){
  alert("Please Disable Your Pop up Blocker. You are missing messages people are sending you!");
  }
 }
</script>

</head>

<body topmargin="0" leftmargin="0" marginwidth="0" marginheight="0"><OBJECT classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
 codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0"
 WIDTH="400" HEIGHT="493" id="myFlash<?php echo $sender; ?><?php echo $receiver; ?>" ALIGN="center" border="0">
 <PARAM NAME=movie VALUE="<?php echo $baseurl; ?>messenger.swf?lang=<?php echo $lang; ?>&instance=<?php echo $sender; ?><?php echo $receiver; ?>&receiver=<?php echo $receiver; ?>&sender=<?php echo $sender; ?>&uID=<?php echo $receiver; ?>&u=<?php echo $u; ?>"> <PARAM NAME=quality VALUE=high> <PARAM NAME=bgcolor VALUE=#FFFFFF> <EMBED src="<?php echo $baseurl; ?>messenger.swf?lang=<?php echo $lang; ?>&instance=<?php echo $sender; ?><?php echo $receiver; ?>&receiver=<?php echo $receiver; ?>&sender=<?php echo $sender; ?>&uID=<?php echo $receiver; ?>&u=<?php echo $u; ?>" quality=high bgcolor=#FFFFFF  WIDTH="400" HEIGHT="493" border="0" NAME="myFlash<?php echo $sender; ?><?php echo $receiver; ?>" swLiveConnect="true" ALIGN="center"
 TYPE="application/x-shockwave-flash" PLUGINSPAGE="http://www.macromedia.com/go/getflashplayer"></EMBED>
</OBJECT></body>

</html>

