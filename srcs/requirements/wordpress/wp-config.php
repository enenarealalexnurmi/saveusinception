<?php
define( 'DB_NAME', _MYSQL_DB_NAME );
define( 'DB_USER', _MYSQL_USER );
define( 'DB_PASSWORD', _MYSQL_PASSWORD );
define( 'DB_HOST', _MYSQL_HOST );
define( 'DB_CHARSET', 'utf8' );
define( 'WP_DEBUG', true );
define( 'WP-DEBUG_LOG', true );
define( 'WP_DEBUG_DISPLAY', false );
	
$table_prefix = _WP_TABLE_PREFIX;
require_once(ABSPATH . 'wp-settings.php');