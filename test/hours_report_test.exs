defmodule HoursReportTest do
  use ExUnit.Case

  describe "build/0" do
    test "builds the report" do
      filename = "reports_test"

      response = HoursReport.build(filename)

      expected_response = %{
        "all_hours" => %{
          "daniele" => 12,
          "giuliano" => 3,
          "mayk" => 5,
          "cleiton" => 0,
          "danilo" => 0,
          "diego" => 0,
          "jakeliny" => 0,
          "joseph" => 0,
          "rafael" => 0,
          "vinicius" => 0
        },
        "hours_per_month" => %{
          "daniele" => %{
            "abril" => 7,
            "agosto" => 0,
            "dezembro" => 5,
            "fevereiro" => 0,
            "janeiro" => 0,
            "julho" => 0,
            "junho" => 0,
            "maio" => 0,
            "marco" => 0,
            "novembro" => 0,
            "outubro" => 0,
            "setembro" => 0
          },
          "giuliano" => %{
            "abril" => 0,
            "agosto" => 0,
            "dezembro" => 0,
            "fevereiro" => 3,
            "janeiro" => 0,
            "julho" => 0,
            "junho" => 0,
            "maio" => 0,
            "marco" => 0,
            "novembro" => 0,
            "outubro" => 0,
            "setembro" => 0
          },
          "mayk" => %{
            "abril" => 0,
            "agosto" => 0,
            "dezembro" => 5,
            "fevereiro" => 0,
            "janeiro" => 0,
            "julho" => 0,
            "junho" => 0,
            "maio" => 0,
            "marco" => 0,
            "novembro" => 0,
            "outubro" => 0,
            "setembro" => 0
          },
          "cleiton" => %{
            "abril" => 0,
            "agosto" => 0,
            "dezembro" => 0,
            "fevereiro" => 0,
            "janeiro" => 0,
            "julho" => 0,
            "junho" => 0,
            "maio" => 0,
            "marco" => 0,
            "novembro" => 0,
            "outubro" => 0,
            "setembro" => 0
          },
          "danilo" => %{
            "abril" => 0,
            "agosto" => 0,
            "dezembro" => 0,
            "fevereiro" => 0,
            "janeiro" => 0,
            "julho" => 0,
            "junho" => 0,
            "maio" => 0,
            "marco" => 0,
            "novembro" => 0,
            "outubro" => 0,
            "setembro" => 0
          },
          "diego" => %{
            "abril" => 0,
            "agosto" => 0,
            "dezembro" => 0,
            "fevereiro" => 0,
            "janeiro" => 0,
            "julho" => 0,
            "junho" => 0,
            "maio" => 0,
            "marco" => 0,
            "novembro" => 0,
            "outubro" => 0,
            "setembro" => 0
          },
          "jakeliny" => %{
            "abril" => 0,
            "agosto" => 0,
            "dezembro" => 0,
            "fevereiro" => 0,
            "janeiro" => 0,
            "julho" => 0,
            "junho" => 0,
            "maio" => 0,
            "marco" => 0,
            "novembro" => 0,
            "outubro" => 0,
            "setembro" => 0
          },
          "joseph" => %{
            "abril" => 0,
            "agosto" => 0,
            "dezembro" => 0,
            "fevereiro" => 0,
            "janeiro" => 0,
            "julho" => 0,
            "junho" => 0,
            "maio" => 0,
            "marco" => 0,
            "novembro" => 0,
            "outubro" => 0,
            "setembro" => 0
          },
          "rafael" => %{
            "abril" => 0,
            "agosto" => 0,
            "dezembro" => 0,
            "fevereiro" => 0,
            "janeiro" => 0,
            "julho" => 0,
            "junho" => 0,
            "maio" => 0,
            "marco" => 0,
            "novembro" => 0,
            "outubro" => 0,
            "setembro" => 0
          },
          "vinicius" => %{
            "abril" => 0,
            "agosto" => 0,
            "dezembro" => 0,
            "fevereiro" => 0,
            "janeiro" => 0,
            "julho" => 0,
            "junho" => 0,
            "maio" => 0,
            "marco" => 0,
            "novembro" => 0,
            "outubro" => 0,
            "setembro" => 0
          }
        },
        "hours_per_year" => %{
          "daniele" => %{"2016" => 5, "2017" => 0, "2018" => 7, "2019" => 0, "2020" => 0},
          "giuliano" => %{"2016" => 0, "2017" => 3, "2018" => 0, "2019" => 0, "2020" => 0},
          "mayk" => %{"2016" => 0, "2017" => 1, "2018" => 0, "2019" => 4, "2020" => 0},
          "cleiton" => %{"2016" => 0, "2017" => 0, "2018" => 0, "2019" => 0, "2020" => 0},
          "danilo" => %{"2016" => 0, "2017" => 0, "2018" => 0, "2019" => 0, "2020" => 0},
          "diego" => %{"2016" => 0, "2017" => 0, "2018" => 0, "2019" => 0, "2020" => 0},
          "jakeliny" => %{"2016" => 0, "2017" => 0, "2018" => 0, "2019" => 0, "2020" => 0},
          "joseph" => %{"2016" => 0, "2017" => 0, "2018" => 0, "2019" => 0, "2020" => 0},
          "rafael" => %{"2016" => 0, "2017" => 0, "2018" => 0, "2019" => 0, "2020" => 0},
          "vinicius" => %{"2016" => 0, "2017" => 0, "2018" => 0, "2019" => 0, "2020" => 0}
        }
      }

      assert response == expected_response
    end
  end

  describe "report_initial_format/1" do
    test "returns a map with the correct structure" do
      response = HoursReport.report_initial_format()

      expected_response = %{
        "all_hours" => %{
          "daniele" => 0,
          "giuliano" => 0,
          "mayk" => 0,
          "cleiton" => 0,
          "danilo" => 0,
          "diego" => 0,
          "jakeliny" => 0,
          "joseph" => 0,
          "rafael" => 0,
          "vinicius" => 0
        },
        "hours_per_month" => %{
          "daniele" => %{
            "abril" => 0,
            "agosto" => 0,
            "dezembro" => 0,
            "fevereiro" => 0,
            "janeiro" => 0,
            "julho" => 0,
            "junho" => 0,
            "maio" => 0,
            "marco" => 0,
            "novembro" => 0,
            "outubro" => 0,
            "setembro" => 0
          },
          "giuliano" => %{
            "abril" => 0,
            "agosto" => 0,
            "dezembro" => 0,
            "fevereiro" => 0,
            "janeiro" => 0,
            "julho" => 0,
            "junho" => 0,
            "maio" => 0,
            "marco" => 0,
            "novembro" => 0,
            "outubro" => 0,
            "setembro" => 0
          },
          "mayk" => %{
            "abril" => 0,
            "agosto" => 0,
            "dezembro" => 0,
            "fevereiro" => 0,
            "janeiro" => 0,
            "julho" => 0,
            "junho" => 0,
            "maio" => 0,
            "marco" => 0,
            "novembro" => 0,
            "outubro" => 0,
            "setembro" => 0
          },
          "cleiton" => %{
            "abril" => 0,
            "agosto" => 0,
            "dezembro" => 0,
            "fevereiro" => 0,
            "janeiro" => 0,
            "julho" => 0,
            "junho" => 0,
            "maio" => 0,
            "marco" => 0,
            "novembro" => 0,
            "outubro" => 0,
            "setembro" => 0
          },
          "danilo" => %{
            "abril" => 0,
            "agosto" => 0,
            "dezembro" => 0,
            "fevereiro" => 0,
            "janeiro" => 0,
            "julho" => 0,
            "junho" => 0,
            "maio" => 0,
            "marco" => 0,
            "novembro" => 0,
            "outubro" => 0,
            "setembro" => 0
          },
          "diego" => %{
            "abril" => 0,
            "agosto" => 0,
            "dezembro" => 0,
            "fevereiro" => 0,
            "janeiro" => 0,
            "julho" => 0,
            "junho" => 0,
            "maio" => 0,
            "marco" => 0,
            "novembro" => 0,
            "outubro" => 0,
            "setembro" => 0
          },
          "jakeliny" => %{
            "abril" => 0,
            "agosto" => 0,
            "dezembro" => 0,
            "fevereiro" => 0,
            "janeiro" => 0,
            "julho" => 0,
            "junho" => 0,
            "maio" => 0,
            "marco" => 0,
            "novembro" => 0,
            "outubro" => 0,
            "setembro" => 0
          },
          "joseph" => %{
            "abril" => 0,
            "agosto" => 0,
            "dezembro" => 0,
            "fevereiro" => 0,
            "janeiro" => 0,
            "julho" => 0,
            "junho" => 0,
            "maio" => 0,
            "marco" => 0,
            "novembro" => 0,
            "outubro" => 0,
            "setembro" => 0
          },
          "rafael" => %{
            "abril" => 0,
            "agosto" => 0,
            "dezembro" => 0,
            "fevereiro" => 0,
            "janeiro" => 0,
            "julho" => 0,
            "junho" => 0,
            "maio" => 0,
            "marco" => 0,
            "novembro" => 0,
            "outubro" => 0,
            "setembro" => 0
          },
          "vinicius" => %{
            "abril" => 0,
            "agosto" => 0,
            "dezembro" => 0,
            "fevereiro" => 0,
            "janeiro" => 0,
            "julho" => 0,
            "junho" => 0,
            "maio" => 0,
            "marco" => 0,
            "novembro" => 0,
            "outubro" => 0,
            "setembro" => 0
          }
        },
        "hours_per_year" => %{
          "daniele" => %{"2016" => 0, "2017" => 0, "2018" => 0, "2019" => 0, "2020" => 0},
          "giuliano" => %{"2016" => 0, "2017" => 0, "2018" => 0, "2019" => 0, "2020" => 0},
          "mayk" => %{"2016" => 0, "2017" => 0, "2018" => 0, "2019" => 0, "2020" => 0},
          "cleiton" => %{"2016" => 0, "2017" => 0, "2018" => 0, "2019" => 0, "2020" => 0},
          "danilo" => %{"2016" => 0, "2017" => 0, "2018" => 0, "2019" => 0, "2020" => 0},
          "diego" => %{"2016" => 0, "2017" => 0, "2018" => 0, "2019" => 0, "2020" => 0},
          "jakeliny" => %{"2016" => 0, "2017" => 0, "2018" => 0, "2019" => 0, "2020" => 0},
          "joseph" => %{"2016" => 0, "2017" => 0, "2018" => 0, "2019" => 0, "2020" => 0},
          "rafael" => %{"2016" => 0, "2017" => 0, "2018" => 0, "2019" => 0, "2020" => 0},
          "vinicius" => %{"2016" => 0, "2017" => 0, "2018" => 0, "2019" => 0, "2020" => 0}
        }
      }

      assert response == expected_response
    end
  end
end
