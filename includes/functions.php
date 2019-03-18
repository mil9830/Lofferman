<?php
	// encrypt password, a crazy alogirthm I made up with a challenge.
	function encPWD($s)
	{
		$challenge = decbin(substr(hexdec(~md5($s)), 3, 8));
		return strtoupper(md5(sha1(md5($s) . sha1($s) . md5(strrev($challenge)))));
	}
	
	function is_admin()
	{	
		if (!isset($_SESSION['auth'])) { return 0; }
		$str = $_SESSION['auth'];
		if ($str == 1) { return 1; }

		return 0;
	}
	
	function redirect($str)
	{
		header("Location: " . $str);
	}
?>