<h1 align="center">
    <img width="120" alt="Ignite" src="https://res.cloudinary.com/dqcqifjms/image/upload/v1615216700/felipejung/ignite.png" />
    <br>
    Ignite - Elixir - Challenge 03
</h1>

<h4 align="center">
  A application that reads a csv and extracts how many hours professionals worked per month and year
</h4>

## :information_source: How To Use

```bash
# In your terminal, open iex:
iex -S mix

# Then run the function build:
iex(1)> HoursReport.build("gen_report")
%{:ok,
  "all_hours" => %{
    "cleiton" => 13797,
    "daniele" => 13264,
    "danilo" => 13583,
    ...
  },
  "hours_per_month" => %{
    "cleiton" => %{
      "abril" => 1161,
      "agosto" => 1149,
      "dezembro" => 1100,
      ...
    },
    "daniele" => %{
      "abril" => 1138,
      "agosto" => 1018,
      "dezembro" => 1019,
      ...
    },
  },
  "hours_per_year" => %{
    "cleiton" => %{
      "2016" => 2699,
      "2017" => 2684,
      "2018" => 2805,
      "2019" => 2714,
      "2020" => 2895
    },
    "daniele" => %{
      "2016" => 2573,
      "2017" => 2862,
      "2018" => 2633,
      "2019" => 2562,
      "2020" => 2634
    },
  }
}
```

Running it in parallel:

```bash
# This function processes the 3 files in parallel and creates the final report
iex(1)> HoursReport.build_from_many(["report_1", "report_2", "report_3"])
%{:ok,
  "all_hours" => %{
    "cleiton" => 13797,
    "daniele" => 13264,
    "danilo" => 13583,
    ...
  },
  "hours_per_month" => %{
    "cleiton" => %{
      "abril" => 1161,
      "agosto" => 1149,
      "dezembro" => 1100,
      ...
    },
    "daniele" => %{
      "abril" => 1138,
      "agosto" => 1018,
      "dezembro" => 1019,
      ...
    },
  },
  "hours_per_year" => %{
    "cleiton" => %{
      "2016" => 2699,
      "2017" => 2684,
      "2018" => 2805,
      "2019" => 2714,
      "2020" => 2895
    },
    "daniele" => %{
      "2016" => 2573,
      "2017" => 2862,
      "2018" => 2633,
      "2019" => 2562,
      "2020" => 2634
    },
  }
}
```

## :zap: :clock10: Running bechmark

Running the application benchmark located in [test/benchmark.exs](test/benchmark.exs)

```bash
mix run test/benchmark.exs
Operating System: Linux
CPU Information: Intel(R) Core(TM) i5-9300H CPU @ 2.40GHz
Number of Available Cores: 8
Available memory: 15.47 GB
Elixir 1.11.3
Erlang 23.2.5

Benchmark suite executing with the following configuration:
warmup: 2 s
time: 5 s
memory time: 0 ns
parallel: 1
inputs: none specified
Estimated total run time: 14 s

Benchmarking parallel...
Benchmarking single...

Name               ips        average  deviation         median
parallel          5.56      179.75 ms     ±2.25%      181.00 ms      18
single            4.93      203.00 ms    ±14.28%      200.45 ms      27

Comparison:
parallel          5.56
single            4.93 - 1.13x slower +23.25 ms
```

## :heavy_check_mark: Running the tests

```bash
mix test
.......

Finished in 0.4 seconds
7 tests, 0 failures

Randomized with seed 560684
```

## :memo: License

This project is under the MIT license. See the [LICENSE](https://github.com/felipe-jm/elixir-ignite-reports-generator/blob/master/LICENSE) for more information.

---

Made with much :heart: and :muscle: by Felipe Jung :blush: <a href="https://www.linkedin.com/in/felipe-jung/">Talk to me!</a>
