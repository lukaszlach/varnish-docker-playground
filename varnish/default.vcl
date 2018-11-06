vcl 4.0;
import directors;

backend web1 { .host = "web1"; .port = "80"; }
backend web2 { .host = "web2"; .port = "80"; }

sub vcl_init {

    // set up a round-robin director with two backends
    new round_robin_director = directors.round_robin();
    round_robin_director.add_backend(web1);
    round_robin_director.add_backend(web2);
}

sub vcl_recv {

    // bypass the cache when requested in Cache-Control header
    if (req.http.Cache-Control ~ "no-cache") {
        return (pass);
    }
    // lookup the cached object
    return (hash);
}

sub vcl_backend_fetch {

    // pick one healthy backend from the director
    set bereq.backend = round_robin_director.backend();
}

sub vcl_deliver {

    // disable further caching by downstreams and the client
    set resp.http.Cache-Control = "private, max-age=0, no-store, no-cache, must-revalidate";
    // set the hit/miss indicator
    if (obj.hits > 0) {
        set resp.http.X-Cache = "HIT hits=" + obj.hits;
    } else {
        set resp.http.X-Cache = "MISS";
    }
}