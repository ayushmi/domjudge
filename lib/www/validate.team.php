<?php
/**
 * This file is included to check whether this is a known team, and sets
 * the $login variable accordingly. It checks this by the IP from the
 * database, if not present it returns an error 403 (Forbidden).
 *
 * $Id$
 *
 * Part of the DOMjudge Programming Contest Jury System and licenced
 * under the GNU GPL. See README and COPYING for details.
 */

$ip = $_SERVER['REMOTE_ADDR'];
$row = $DB->q('MAYBETUPLE SELECT * FROM team WHERE ipaddress = %s', $ip);

// not found in database
if(!$row) {
	if (NONINTERACTIVE) error("Not authenticated");
	$title = 'Not Authenticated';
	$menu = false;
	include(SYSTEM_ROOT . '/lib/www/header.php');
	echo "<h1>Not Authenticated</h1>\n\n<p>Sorry, we're unable to identify you as a valid team (IP " .
		htmlspecialchars($_SERVER['REMOTE_ADDR']) . ").</p>\n\n";
		?>
<p>
Please supply team credentials below, or contact a staff member for assistance.
</p>

<form action="checkpasswd.php" method="post">
<table>
<tr><td><label for="login">Login:</label></td><td><input type="text" id="login" name="login" value="" size="15" maxlength="15" accesskey="l" /></td></tr>
<tr><td><label for="passwd">Password:</label></td><td><input type="password" id="passwd" name="passwd" value="" size="15" maxlength="255" accesskey="p" /></td></tr>
<tr><td colspan="2" align="center"><input type="submit" value="Login" /></td></tr>
</table>
</form>

	<?php
	putDOMjudgeVersion();
	include(SYSTEM_ROOT . '/lib/www/footer.php');
	exit;
}

// make the following fields available for the scripts
$login = $row['login'];
$name = $row['name'];

// is this the first visit? record that in the team table
if ( empty($row['teampage_first_visited']) ) {
	$DB->q('UPDATE team SET teampage_first_visited = %s WHERE login = %s',
	       now(), $login);
}

unset($row);
