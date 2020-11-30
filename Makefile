.PHONY: start stop kill update clean run-varnish ab-cache ab-no-cache watch-cache watch-no-cache

start:
	docker-compose up -d varnish

stop:
	docker-compose down

kill:
	docker-compose kill

logs:
	docker-compose logs -f --tail=0

update: clean
	docker-compose pull

run-varnish:
	docker-compose up varnish

varnishlog:
	docker-compose exec varnish varnishlog

varnishncsa:
	docker-compose exec varnish varnishncsa

varnishstat:
	docker-compose exec varnish varnishstat

clean:
	docker-compose down
	docker-compose rm -f

ab-cache:
	ab -c20 -n100 -t10 'http://localhost/?cache=1&delay=1'

ab-no-cache:
	ab -c20 -n100 -t10 'http://localhost/?cache=0&delay=1'

watch-cache:
	watch -n 1 curl -s 'localhost?cache=1&delay=1'

watch-no-cache:
	watch -n 1 curl -s 'localhost?cache=0&delay=1'
