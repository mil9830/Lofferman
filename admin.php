<?php	
	include("main.php");

	function login()
	{
		include("header.php");
		$content = "<form action=\"admin.php?act=login\" method=\"post\">\n"
				 . "<table width=\"150\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n"
				 . "   <tr>\n"
				 . "      <td width=\"30%\"><div align=\"right\">Username</div></td>\n"
				 . "      <td width=\"70%\"><div align=\"right\">&nbsp;<input name=\"aduser\" type=\"text\" maxlength=\"32\" size=\"20\"></div></td>\n"
				 . "   </tr>\n"
				 . "   <tr>\n"
				 . "      <td width=\"30%\"><div align=\"right\">Password</div></td>\n"
				 . "      <td width=\"70%\"><div align=\"right\">&nbsp;<input name=\"adpass\" type=\"password\" maxlength=\"32\" size=\"20\"></div></td>\n"
				 . "   </tr>\n"
				 . "   <tr>\n"
				 . "      <td width=\"30%\"><div align=\"right\"></div></td>\n"
				 . "      <td width=\"90%\"><div align=\"right\"><input type=\"submit\" value=\"Login\" name=\"submit\" /></div></td>\n"
				 . "   </tr>\n"
				 . "</table>\n"
				 //. "<input type=\"hidden\" name=\"act\" value=\"login\">\n"
				 . "</form>\n";
					 

		echo("<br />" . "<div align=\"center\" style=\"height: 25px; margin-top: 10px\"><strong>Administration Login</strong></div>\n" . "<br />" . $content);		   
		include("footer.php");
	}

	function logout()
	{
		session_destroy();
	}

	if (isset($_POST['submit']))
	{
		if (isset($_POST['aduser'])) 
		{
			// secure the strings
			$aduser = $db->real_escape_string($_POST['aduser']);
			$adpass = encPWD($db->real_escape_string($_POST['adpass']));
			
			//$query = "SELECT user, pass FROM admin WHERE user=" . $aduser . " AND pass=" . encPWD($adpass) . ";";
			$query = "SELECT user, pass FROM admin WHERE user = '$aduser' AND pass = '$adpass';";
			
			// Retreivew resource handle by querying the database and then check if the result came back a 1. 
			// 	  If it did, we have logged in, otherwise the password and username is a wrong combination.
			
			if (($result = mysqli_query($db, $query) AND (mysqli_num_rows($result) == 1)))
			{
					$_SESSION['auth'] = 1;
					header("Location: admin.php");
					
					include("header.php");
					echo("   <div align=\"center\"><strong>You have successfully logged in!</strong>\n"
					   . "   <br>\n"
					   . "   <br>\n"
					   . "   <strong><a href=\"admin.php\">Click here</a></strong> if you aren't redirected automatically.</div>");
					include("footer.php");
			}
			else
			{
				redirect("admin.php?act=login");
			}
		}
		else
		{
			if ($_SESSION['auth'] == 1)
			{
				echo("You are currently logged in!<br /><a href=\"admin.php?act=logout\">Click here</a> to logout.");
			}
			else
			{
				redirect("admin.php?act=login");
			}
		}
	}
	else
	{
	
		if (isset($_GET['act']))
		{
			switch ($_GET['act']) 
			{
				case "login":
					if (is_admin() == 0) {
						login();
					}
					else {
						echo("You are currently logged in!<br /><a href=\"admin.php?act=logout\">Click here</a> to logout.");
					}
					break;
					
				case "logout":
					logout();
					redirect("admin.php?act=login");
					break;
					
				default:
					redirect("admin.php?act=login");
					break;
			}		
		}
		else
		{
			redirect("admin.php?act=login");
		}
	}

?>