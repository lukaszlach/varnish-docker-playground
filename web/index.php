<?php

$delay = $_GET['delay'] ?? false; // whether to delay the response by random time
$cache = $_GET['cache'] ?? false; // whether to send caching response header

$cacheTtl = $_GET['cache-ttl'] ?? 10;
$graceTtl = $_GET['grace-ttl'] ?? 0;

$cacheHeader = $cache ?
    "Cache-Control: public, s-maxage=$cacheTtl, stale-while-revalidate=$graceTtl" :
    'Cache-Control: no-cache';
header($cacheHeader);
if ($delay) {
    sleep(3);
}
var_dump(
    date('d.m.Y H:i:s'),
    $cacheHeader,
    gethostname()
);
