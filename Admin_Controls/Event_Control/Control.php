<?php
$db_host = "localhost";
$db_username = "vistor";
$db_pass = "visitor";
$db_name = "test";
$db = new PDO('mysql:host='.$db_host.';dbname='.$db_name,$db_username,$db_pass);
$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_WARNING);
$query = $db->query('SELECT * FROM pet');
?> 
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Admin Controls</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="AdminStyles.css" />
    <h1 id="wbsHead" >Waynesburgh Barrel Series</h1>
    <h2 id="acHead">Admin Controls - Event Control</h2>
</head>
<body>
<!-- Start of the admin selection sidebar -->
<nav class="main-nav"> 
    <a href="Index.php" class="SideBarbtn">Home</a>
    <a href="../Index.php" class="SideBarbtn">Exit</a>
</nav>
<!-- End of the admin selection sidebar -->

<!-- Start of the Event Control -->






<!-- End of the Event Control -->



<!-- Start of the data queries -->

<!-- End of the data queries -->

<!-- Start of the Next nav -->
<a href="Draw.php" class="Nextbtn">Next</a>
<!-- End of the Next nav -->


</body>
</html>