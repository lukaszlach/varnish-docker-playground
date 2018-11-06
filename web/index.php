<?php

$delay = $_GET['delay'] ?? false; // whether to delay the response by random time
$cache = $_GET['cache'] ?? false; // whether to send caching response header

$cacheTtl = $_GET['cache-ttl'] ?? 10;
$graceTtl = $_GET['grace-ttl'] ?? 0;

header($cache ?
    "Cache-Control: public, max-age=$cacheTtl, stale-while-revalidate=$graceTtl" :
    'Cache-Control: no-cache'
);
if ($delay) {
    sleep(random_int(1, 3));
}
var_dump(
    getallheaders(),
    time()
);