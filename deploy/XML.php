<?php
include("config.php");

// Connect the database
$connect = mysql_connect("$user_hostname", "$user_username", "$user_password");
mysql_select_db("$user_database", $connect);

// Get the option passed in to run the correct function. 
$option = $_REQUEST['option'];

// This is the switch function to run the correct function 
// depending on the option variable being passed in.
switch($option){
		case "getSettings":
			getSettings();
		break;
		case "getAccess":
			// Get uID variable
			$uID = $_REQUEST['uID'];
			getAccess($uID);
		break;
		case "getProfile":
			// Get uID and buddy variables
			$uID = $_REQUEST['uID'];
			$buddy = $_REQUEST['buddy'];			
			getProfile($uID, $buddy);
		break;
		case "getUsers":
			// Get uID, stat variables
			$uID = $_REQUEST['uID'];
			$stat = $_REQUEST['stat'];
			$lang = $_REQUEST['lang'];			
			getUsers($uID, $stat, $lang);
		break;
		case "getOnlineInvites":
			$uID = $_REQUEST['uID'];
			$stat = $_REQUEST['stat'];			
			getOnlineInvites($uID, $stat);
		break;
		case "addBuddy":
			$uID = $_REQUEST['uID'];
			$buddy = $_REQUEST['buddy'];
			addBuddy($uID, $buddy);
		break;
		case "getBuddys":
			$uID = $_REQUEST['uID'];
			getBuddys($uID);
		break;
		case "deleteBuddy":
			$uID = $_REQUEST['uID'];
			$buddy = $_REQUEST['buddy'];
			deleteBuddy($uID, $buddy);
		break;
		case "blockBuddy":
			$uID = $_REQUEST['uID'];
			$buddy = $_REQUEST['buddy'];
			blockBuddy($uID, $buddy);
		break;
		case "getBlocked":
			$uID = $_REQUEST['uID'];
			getBlocked($uID);
		break;
		case "unblockBuddy":
			$uID = $_REQUEST['uID'];
			$buddy = $_REQUEST['buddy'];
			unblockBuddy($uID,$buddy);
		break;
		case "checkOnline":
			$user = $_REQUEST['user'];
			checkOnline($user);
		break;	
}

function checkOnline($user){
	$bstatus = "offline";
	$query2 = "SELECT * FROM online WHERE user='$user'";
	$result2 = mysql_query($query2);
	if ($result2){	
			while ($row =mysql_fetch_array ($result2) ){
						$bstatus = $row[status];						
			}
																		
	}
	echo $bstatus;
}

function getSettings(){
include("config.php");
$output = "<?xml version=\"1.0\"?>";
print $output;
print "<dataSet>";
print "<data>";
print "<flashcommserver>".$flashcommserver."</flashcommserver>";
print "<flashcommserver2>".$flashcommserver."</flashcommserver2>";
print "<backgroundcolor>".$backgroundcolor."</backgroundcolor>";
print "<textcolor>".$textcolor."</textcolor>";
print "<fontsize>".$fontsize."</fontsize>";
print "<fontfamily>".$fontfamily."</fontfamily>";
print "<fontcolor>".$fontcolor."</fontcolor>";
print "<rollovercolor>".$rollovercolor."</rollovercolor>";
print "<selectioncolor>".$selectioncolor."</selectioncolor>";
print "<textselectedcolor>".$textselectedcolor."</textselectedcolor>";
print "<textrollovercolor>".$textrollovercolor."</textrollovercolor>";
print "<bandwidthlevel>".$bandwidthlevel."</bandwidthlevel>";
print "<audiolevel>".$audiolevel."</audiolevel>";
print "<addButton>".$addButton."</addButton>";
print "<blockButton>".$blockButton."</blockButton>";
print "<profileButton>".$profileButton."</profileButton>";
print "<fileButton>".$fileButton."</fileButton>";
print "<siteID>".$siteID."</siteID>";
print "<altflashcommserver>".$altflashcommserver."</altflashcommserver>";
print "<altflashcommserver2>".$altflashcommserver."</altflashcommserver2>";
print "<dataRow>Done</dataRow>";
print "</data>";		
print "</dataSet>";
}

function getAccess($uID){
$output = "<?xml version=\"1.0\"?>";
print $output;
print "<dataSet>";
print "<data>";
print "<uID>".$uID."</uID>";
print "<allowAccess>True</allowAccess>";
print "<dataRow>Done</dataRow>";
print "</data>";		
print "</dataSet>";
}

function getProfile($uID, $buddy){
$output = "<?xml version=\"1.0\"?>";
print $output;
print "<dataSet>";
print "<data>";
print "<uID>$uID</uID>";
print "<buddy>$buddy</buddy>";
print "<username>$uID</username>";
print "<buddyname>$buddy</buddyname>";
print "<one>Line One</one>";
print "<two>Line Two</two>";
print "<three>Line Three</three>";
print "<four>Line Four</four>";
print "<pic></pic>";
print "<pictwo></pictwo>";
print "<profileurl></profileurl>";
print "<profiletarget>blank</profiletarget>";
print "<profileheight>550</profileheight>";
print "<profilewidth>750</profilewidth>";
print "<dataRow>Done</dataRow>";
print "</data>";						
print "</dataSet>";					
}					

function getUsers($uID, $stat, $lang){
include("config.php");

for($i=0;$i<=count($labelarray);$i++) {
	
   if($labelarray[$i][1] == $lang){
   $contactslabel = $labelarray[$i][2];
   $alllabel = $labelarray[$i][3];
   }
}


			$query2 = "SELECT * FROM online WHERE user='$uID'";
					$result3 = mysql_query($query2);
					if ($result3){
						while ($row =mysql_fetch_array ($result3) ){
							$mytime = $row[stamp];
							
							$thetime = $mytime; 
							$year1=substr($thetime,0,4); 
							
							$month1=substr($thetime,4,2); 
							$day1=substr($thetime,6,2);
							$hour1=substr($thetime,8,2);
							$min1=substr($thetime,10,2);
							$sec1=substr($thetime,12,2);
							if($min1 > 58){
								$min1 = 56;
								$sec1 = 00;
							} else {
								$min1 = $min1 - 3;
							}
							
							$newtime = $year1.$month1.$day1.$hour1.$min1.$sec1;
							
							$query3 = "SELECT * FROM online";
							$result4 = mysql_query($query3);
							if ($result4){
								while ($row =mysql_fetch_array ($result4) ){
								$user = $row[user];
								$mytime = $row[stamp];
								
									if($newtime > $mytime){
									$sql = "DELETE FROM online WHERE user='$user'";	
									$result5 = mysql_query($sql);
									}
								}
							}						
						}

					}
												
$thetime = date("Ymdhis"); 
$year1=substr($thetime,0,4); 
$month1=substr($thetime,4,2); 
$day1=substr($thetime,6,2);
$hour1=substr($thetime,8,2);
$min1=substr($thetime,10,2);
$sec1=substr($thetime,12,2);
if($sec1 < 25){
	$sec1 = 00;
} else {
	$sec1 = $sec1 - 15;
}
$newtime = $year1.$month1.$day1.$hour1.$min1.$sec1;

// Get your time and delete all old sessions
$sql2 = "DELETE FROM online WHERE stamp < $newtime";	
$result2 = mysql_query($sql2);						 


$sql1 = "DELETE FROM online WHERE user='$uID'";	
$result = mysql_query($sql1);

// Add user back to database, ultimatley updating the stamp field in the online table to the cuurent time.
$query1 = "INSERT INTO online (user, status) values ('$uID', '$stat')";
$result = mysql_query($query1);



	$output = "<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>";
	print $output;
	$output = "<node label = \"".$contactslabel."\" icon=\"userFriends\" >";
	print $output;
	
	$rst = "False";
	$query27 = "SELECT * FROM online ORDER by user";
	$result27 = mysql_query($query27);
		   if ($result27){								
					while ($row =mysql_fetch_array ($result27) ){
							$buddy = $row[user];
							$bstatus = $row[status];
									  if ($bstatus == "online"){	
											$query37 = "SELECT * FROM buddys WHERE user='$uID' AND buddy='$buddy'";
											$result37 = mysql_query($query37);
											$rst = "False";
									    
											if ($result37){
												while ($row =mysql_fetch_array ($result37) ){
												$buddy = $row[buddy];
												$rst = "True";
												}
											}
											
											if ($rst == "True"){
						$output = "<node label = \"".$buddy."\"  icon=\"user".$bstatus."\" isa = \"contacts\" />";
											print $output;
											}
									  }								
					}	
						if ($rst == "False"){
						$output = "<node label = \"None\"  icon=\"userOffline\" isa = \"contacts\" />";
						print $output;
						}									
		}
						
	print "</node>";
	$output = "<node label = \"".$alllabel."\" icon=\"userOthers\" >";
	print $output;
		
	
	$query2 = "SELECT * FROM online ORDER by user";
	$result2 = mysql_query($query2);
	if ($result2){								
			$lastbuddy = "";
			while ($row =mysql_fetch_array ($result2) ){
						$buddy = $row[user];
						$bstatus = $row[status];
								if ($lastbuddy != $buddy){
										$lastbuddy = $buddy;
											if ($bstatus == "online"){
											$output = "<node label = \"".$buddy."\" icon=\"user".$bstatus."\" isa = \"all\"/>";
											print $output;										
											}
																		
			                	}
			}
																		
	}
										
print "</node>";					
}

function deleteInvite($id){
$sql = "DELETE FROM invites WHERE id='$id'";
$result = mysql_query($sql);
}

function getOnlineInvites($uID, $stat){
// Add user back to database, ultimatley updating the stamp field in the online table to the cuurent time.
$query1 = "INSERT INTO online (user, status) values ('$uID', '$stat')";
$result = mysql_query($query1);

$output = "<?xml version=\"1.0\"?>";
print $output;
print "<dataSet>";
	
						
						$query = "SELECT * FROM invites WHERE buddy='$uID'";
						$result = mysql_query($query);
						if ($result){
							while ($row =mysql_fetch_array ($result) ){
							$myid = $row[id];
							$myname = $row[buddy];
							$mybuddy = $row[user];							
							deleteInvite($myid);									
							print "<data>";
							print "<invitesender>".$mybuddy."</invitesender>";
							print "<dataRow>".$mybuddy."</dataRow>";
							print "</data>";
							
							}						
						}
print "</dataSet>";					
print "</xml>";						
}


function addBuddy($uID, $buddy){
$output = "<?xml version=\"1.0\"?>";
print $output;
print "<dataSet>";
	if ($uID == $buddy){
		print "<data>";
		print "<msg>Try Again!</msg>";
		print "<dataRow>BadAdd</dataRow>";
		print "</data>";
	} else { 


		$str = "";
		$query = "SELECT * FROM buddys WHERE user='$uID'";
		$result = mysql_query($query);
		if ($result){
			while ($row =mysql_fetch_array ($result) ){
			$dbbuddy = $row[buddy];
				if ($dbbuddy == $buddy){
				$str = "False";
				}
			}
		}

		if ($str != "False"){
			$query2 = "INSERT INTO buddys (user, buddy) values ('$uID', '$buddy')";
			$result2 = mysql_query($query2);
			print "<data>";
			print "<msg>Buddy $buddy Added</msg>";
			print "<dataRow>GoodAdd</dataRow>";
			print "</data>";
		} else {
			print "<data>";
			print "<msg>Already Added $buddy!</msg>";
			print "<dataRow>BadAdd</dataRow>";
			print "</data>";
		}
	}
print "</dataSet>";					
print "</xml>";	
}

function getBuddys($uID){
$output = "<?xml version=\"1.0\"?>";
print $output;

$querystart = "SELECT * FROM buddys WHERE user='$uID'";
						$resultstart = mysql_query($querystart);
						if ($resultstart){
							print "<dataSet>";
							while ($row =mysql_fetch_array ($resultstart) ){
								print "<data>";
								print "<name>".$row['buddy']."</name>";
								print "<dataRow>Done</dataRow>";
								print "</data>";
								}
							print "</dataSet>";
						}


print "</xml>";
}

function deleteBuddy($uID, $buddy){
$sql = "DELETE FROM buddys WHERE buddy='$buddy' AND user='$uID'";	
$result = mysql_query($sql);
$output = "<?xml version=\"1.0\"?>";
print $output;
print "<dataSet>";
print "<data>";
print "<msg>Deleted</msg>";
print "<dataRow>Done</dataRow>";
print "</data>";		
print "</dataSet>";
print "</xml>";
}

function blockBuddy($uID, $buddy){
$output = "<?xml version=\"1.0\"?>";
print $output;
print "<dataSet>";
		if ($uID == $buddy){
			print "<data>";
			print "<msg>Try Again!</msg>";
			print "<dataRow>BadAdd</dataRow>";
			print "</data>";
		} else { 
			$str = "";
			$query = "SELECT * FROM blocked WHERE user='$uID'";
			$result = mysql_query($query);
			if ($result){
				while ($row =mysql_fetch_array ($result) ){
				$dbbuddy = $row[user2];
					if ($dbbuddy == $buddy){
					$str = "False";
					}
				}
			}

			if ($str != "False"){
				$query2 = "INSERT INTO blocked (user, buddy) values ('$uID', '$buddy')";
				$result2 = mysql_query($query2);
				print "<data>";
				print "<msg>Buddy $buddy Blocked</msg>";
				print "<dataRow>GoodAdd</dataRow>";
				print "</data>";
			} else {
				print "<data>";
				print "<msg>Already Blocked $buddy!</msg>";
				print "<dataRow>BadAdd</dataRow>";
				print "</data>";
			}	

}	

print "</dataSet>";
print "</xml>";
}

function getBlocked($uID){
$output = "<?xml version=\"1.0\"?>";
print $output;
print "<dataSet>";
$querystart = "SELECT * FROM blocked WHERE user='$uID'";
						$resultstart = mysql_query($querystart);
						if ($resultstart){
							while ($row =mysql_fetch_array ($resultstart) ){
								print "<data>";
								print "<name>".$row['buddy']."</name>";
								print "<dataRow>Done</dataRow>";
								print "</data>";
								}
						}

print "</dataSet>";
print "</xml>";
}

function unblockBuddy($uID, $buddy){
$sql = "DELETE FROM blocked WHERE user='$uID' AND buddy='$buddy'";	
$result = mysql_query($sql);
$output = "<?xml version=\"1.0\"?>";
print $output;
print "<dataSet>";
print "<data>";
print "<name>UnBlocked</name>";
print "<dataRow>Done</dataRow>";
print "</data>";		
print "</dataSet>";
print "</xml>";
}

mysql_close($connect);

?>