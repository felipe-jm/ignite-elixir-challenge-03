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
%{
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

## :heavy_check_mark: Running the tests

```bash
mix test
......

Finished in 0.03 seconds
6 tests, 0 failures

Randomized with seed 605182
```

## :memo: License

This project is under the MIT license. See the [LICENSE](https://github.com/felipe-jm/elixir-ignite-reports-generator/blob/master/LICENSE) for more information.

---

Made with much :heart: and :muscle: by Felipe Jung :blush: <a href="https://www.linkedin.com/in/felipe-jung/">Talk to me!</a>
