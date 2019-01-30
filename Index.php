<?php
$db_host = "localhost";
$db_username = "vistor";
$db_pass = "visitor";
$db_name = "test";
$db = new PDO('mysql:host='.$db_host.';dbname='.$db_name,$db_username,$db_pass);
$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_WARNING);
$query = $db->query('SELECT * FROM pet');
?>
<html class="home">
<link rel="stylesheet" type="text/css" href="Style.css">

<head>
    <title>
        Waynesburgh Barrel Series
    </title>
    <!--Nav bar for admin login and contact page-->
    <div class="headwrapper">
        <h1 id="main-title">Waynesburgh Barrel Series</h1>
        <nav class="main-nav">
            <a href="Authentication.php" class="mainbtn">Admin Login</a>
        </nav>
    </div>
    <!-- END OF Nav bar for admin login and contact page-->
</head>


<body>
    <!--Table of races statistics-->


    <!--Table buttons-->
    <div class="bodywapper">
        <h1>
            Recent races
        </h1>
        <div>
            <a href="#" onclick='show(1);' class="RButton">Friday Poles</a>
            <a href="#" onclick='show(2);' class="RButton">Friday Open</a>
            <a href="#" onclick='show(3);' class="RButton">Exhibition</a>
        </div>
        <!--END OF Table buttons-->
        <div class="grid-container">
                    <!--Table data-->
                    <td>
                    <div id="table1"> 
                        <hr>
                    <table border = '2'>
                    <tr>
                    <th>id</th>
                    <th>name</th>
                    </tr>

                    <?php
                    while ($row = $query->fetch()) 
                    {
                        echo "<tr>";
                        echo "<td>" . $row['id'] ."</td>";
                        echo "<td>" . $row['name'] . "</td>";
                        echo "<td>" . $row['price'] . "</td>";
                        echo "</tr>";
                    }
                    ?>
                        
                        
                     </div>
                        <div id="table2"> 
                        <hr>
                        <tr>
                        <th>id</th>
                        <th>name</th>
                        </tr>

                        <?php
                        while ($row = $query->fetch()) 
                        {
                            echo "<tr>";
                            echo "<td>" . $row['id'] ."</td>";
                            echo "<td>" . $row['name'] . "</td>";
                            echo "<td>" . $row['price'] . "</td>";
                            echo "</tr>";
                        }
                        ?> </div>
                        <div id="table3"> 
                        <hr>
                        <tr>
                        <th>id</th>
                        <th>name</th>
                        </tr>

                        <?php
                        while ($row = $query->fetch()) 
                        {
                        echo "<tr>";
                        echo "<td>" . $row['id'] ."</td>";
                        echo "<td>" . $row['name'] . "</td>";
                        echo "<td>" . $row['price'] . "</td>";
                        echo "</tr>";
                        }
                        ?></div>`
                        <div id="table4"> Content of 4 </div>
                    
                    <!--END OF Table data-->
               
        </div>
        <!--END OF Table of races statistics-->
    </div>
</body>

<script>
    //Script to show table
    function show(nr) {
        document.getElementById("table1").style.display = "none";
        document.getElementById("table2").style.display = "none";
        document.getElementById("table3").style.display = "none";
        document.getElementById("table4").style.display = "none";
        document.getElementById("table" + nr).style.display = "block";
    }
    //END OF Script to show table
</script>

</html>