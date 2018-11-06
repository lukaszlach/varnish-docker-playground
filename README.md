# lukaszlach / uw-varnish

Playground for learning basics of Varnish 5.2, all set up in Docker with two upstreams on PHP 7.2.

## Running

```bash
make start
```

## Testing

Test scripts accepts following query string parameters:

* `cache` - whether to send caching headers to Varnish
* `delay` - whether to delay the response by random number of seconds
* `cache-ttl`
* `grace-ttl`

```bash
curl -v 'localhost?cache=1&delay=1&cache-ttl=10&grace-ttl=5'
```