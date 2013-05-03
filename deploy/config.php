<?php
$user_hostname = "localhost"; // Hostname to database
$user_username = "whitelbl"; // Username to database
$user_password = "phZ964jk"; // Password to database
$user_database = "main"; // Database name to database

// Title in the VideoIM window.

$servicename = "AV IM: Flash Instant Messenger";

// This is the Flash Communication Server string to your application.
// Add more details here
$flashcommserver = "rtmp://whitelbl.com/avim/";
$altflashcommserver = "rtmp://whitelbl.com/avim/";

// This is the url to your application with slash at end.
$baseurl = "./";

//For each Language you want to allow if not already set, add a new element to the array.
// If already set edit the titles. You must have an .xml file to match each langugae used.
// See JagVideo.com .xml file help in the FAQS section if needed.
$labelarray = array();
$labelarray[1][1] = "en";
$labelarray[1][2] = "My Contacts";
$labelarray[1][3] = "All";
$labelarray[2][1] = "de";
$labelarray[2][2] = "Meine Kontakte";
$labelarray[2][3] = "Alle";

// Fonts
$fontsize = "10";
$fontfamily = "Verdana";
$fontcolor = "#666666";

// IM profile text color
$imfontcolor = "0xFFFFFF";

// Listboxes
$backgroundcolor = "0xFFFFFF";
$textcolor = "0x666666";
$rollovercolor = "0xE1191C";
$selectioncolor = "0xE1191C";
$textselectedcolor = "0x000000";
$textrollovercolor = "0xFFFFFF";

// Butons true or false
$addButton = "true";
$blockButton = "true";
$profileButton = "true";
$fileButton = "false";

// Bandwidth Level 255000 = 255kbs
$bandwidthlevel = "128000";
// Audio level 22,33, or 44
$audiolevel = "22";

$installed=true;
?>