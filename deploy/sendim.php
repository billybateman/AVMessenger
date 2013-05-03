<?php
include("config.php");

$connect = mysql_connect("$user_hostname", "$user_username", "$user_password");

$uID = $_REQUEST['uID'];
$receiver = $_REQUEST['receiver'];


$lang = $_REQUEST['lang'];
if ($lang == ""){
	$lang = "en";
}



mysql_select_db("$user_database", $connect);
		// Check to make sure user is not blocked
		$rst = "False";
		
		$querystart2 = "SELECT * FROM blocked WHERE user='$receiver'";
		$resultstart2 = mysql_query($querystart2);
		if ($resultstart2){
			while ($row2 =mysql_fetch_array ($resultstart2) )
				{
				$buddy = $row2[buddy];
					if ($buddy == $uID){
					$rst = "True";
					}
				}
		}
		
// Do something if user is blocked or not blocked				
if ($rst == "True"){
	// User is blocked
	header('Location: logout.php');
} else {
	// User is not blocked
	
	
	
	$str = "True";
	$query = "SELECT * FROM invites WHERE user='$uID'";
	$result = mysql_query($query);
		if ($result){
			while ($row =mysql_fetch_array ($result) ){
			$dbbuddy = $row[buddy];
				if ($dbbuddy == $receiver){
				$str = "False";
				} else {
				$str = "True";
				}
			}
		}

		if ($str == "True")
		{
		$query3 = "INSERT INTO invites (user, buddy) values ('$uID', '$receiver')";
		
		$result3 = mysql_query($query3);
		mysql_close($connect);
		}
		
	?>
	<html>
	
	<head>
	<title><?php echo $receiver; ?></title>
	<script language=JavaScript>
		window.focus();
	</script>
	<SCRIPT LANGUAGE=JavaScript>
	<!--
	var InternetExplorer = navigator.appName.indexOf("Microsoft") != -1;
	function myFlash_DoFSCommand(command, args){
	 var fet = 'menubar=no, width=400, height=500';
	 window.open(args,command,fet);
	}
	if (navigator.appName && navigator.appName.indexOf("Microsoft") != -1 && 
	  navigator.userAgent.indexOf("Windows") != -1 && navigator.userAgent.indexOf("Windows 3.1") == -1) {
	  document.write('<SCRIPT LANGUAGE=VBScript\> \n');
	  document.write('on error resume next \n');
	  document.write('Sub myFlash_FSCommand(ByVal command, ByVal args)\n');
	  document.write(' call myFlash_DoFSCommand(command, args)\n');
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
	
	<body bgcolor="#FFFFFF" topmargin="0" leftmargin="0" marginwidth="0" marginheight="0">
	<OBJECT 
		classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
		codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0"
		WIDTH="400"
		HEIGHT="493"
		id="myFlash"
		ALIGN="right"
		border="0">
	 <PARAM NAME=movie VALUE="<?php echo $baseurl; ?>messenger.swf?lang=<?php echo $lang; ?>&instance=<?php echo $uID; ?><?php echo $receiver; ?>&sender=<?php echo $uID; ?>&receiver=<?php echo $receiver; ?>&uID=<?php echo $uID; ?>"> 
	 <PARAM NAME=quality VALUE=high>
	 <PARAM NAME=bgcolor value=#FFFFFF> 
	  <EMBED 
		src="<?php echo $baseurl; ?>messenger.swf?lang=<?php echo $lang; ?>&instance=<?php echo $uID; ?><?php echo $receiver; ?>&sender=<?php echo $uID; ?>&receiver=<?php echo $receiver; ?>&uID=<?php echo $uID; ?>" 
		quality=high
		bgcolor=#FFFFFF
		WIDTH="400"
		HEIGHT="493"
		border="0"
		NAME="myFlash"
		swLiveConnect="true"
		ALIGN="right"
		TYPE="application/x-shockwave-flash"
		PLUGINSPAGE="http://www.macromedia.com/go/getflashplayer">
	  </EMBED>
	</OBJECT>
	
	</body>
	
	</html>
<?php		 
}
?>