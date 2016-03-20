## Rails vs Phoenix

This repository compares a rails and phoenix app that implement a basic application.

The application shows a list of talks for a conference. The list is fetched from the database and rendered as html through the framework's out-of-the-box scaffolding support.

### Benchmark

**TL;DR:** In this simple benchmark, Phoenix has 6 times higher throughput at a much lower and more consistent latency.

The tests were run on a 2015 13" MacBook Retina (2.7Ghz Core i5).

#### Rails

```shell
RACK_ENV=production bin/rake db:setup
RACK_ENV=production bin/rake assets:precompile
RAILS_SERVE_STATIC_FILES=true RACK_ENV=production bundle exec puma -w 4
wrk -d 20s -c 20 http://localhost:9292/talks
```

The results are decent: 444 req/s at 46.98ms +- 35.62ms

```shell
Running 20s test @ http://localhost:9292/talks
  2 threads and 20 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    46.98ms   35.62ms 160.71ms   50.43%
    Req/Sec   223.57    123.59   430.00     62.25%
  8933 requests in 20.09s, 23.50MB read
Requests/sec:    444.58
Transfer/sec:      1.17MB
```

Memory usage for 4 puma processes: 4x104MB = 416MB.

#### Phoenix

```shell
mix deps.get
MIX_ENV=prod mix ecto.setup
MIX_ENV=prod PORT=4001 elixir --detached -S mix phoenix.server
wrk -d 20s -c 20 http://localhost:4001/talks
```

The results are great: 2440 req/s at 8.18ms +- 2.50ms

```shell
Running 20s test @ http://localhost:4001/talks
  2 threads and 20 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     8.18ms    2.50ms  25.10ms   69.38%
    Req/Sec     1.23k    54.44     1.38k    72.75%
  48891 requests in 20.04s, 190.43MB read
Requests/sec:   2440.13
Transfer/sec:      9.50MB
```

Memory usage for 1 beam.smp process: 63MB.
