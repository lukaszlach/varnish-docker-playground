.PHONY: start stop kill update clean run-varnish

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
