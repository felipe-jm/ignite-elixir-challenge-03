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

  describe "build_from_many/1" do
    test "processes files in parallel and return report" do
      filenames = ["report_1", "report_2"]

      response = HoursReport.build_from_many(filenames)

      expected_response =
        {:ok,
         %{
           "all_hours" => %{
             "cleiton" => 9093,
             "daniele" => 8710,
             "danilo" => 9305,
             "diego" => 8683,
             "giuliano" => 8859,
             "jakeliny" => 9237,
             "joseph" => 8739,
             "mayk" => 8892,
             "rafael" => 9043,
             "vinicius" => 9216
           },
           "hours_per_month" => %{
             "cleiton" => %{
               "abril" => 740,
               "agosto" => 777,
               "dezembro" => 700,
               "fevereiro" => 741,
               "janeiro" => 866,
               "julho" => 828,
               "junho" => 769,
               "maio" => 672,
               "marco" => 672,
               "novembro" => 783,
               "outubro" => 717,
               "setembro" => 828
             },
             "daniele" => %{
               "abril" => 795,
               "agosto" => 651,
               "dezembro" => 595,
               "fevereiro" => 666,
               "janeiro" => 703,
               "julho" => 820,
               "junho" => 764,
               "maio" => 822,
               "marco" => 765,
               "novembro" => 692,
               "outubro" => 659,
               "setembro" => 778
             },
             "danilo" => %{
               "abril" => 821,
               "agosto" => 855,
               "dezembro" => 707,
               "fevereiro" => 773,
               "janeiro" => 801,
               "julho" => 741,
               "junho" => 650,
               "maio" => 787,
               "marco" => 848,
               "novembro" => 734,
               "outubro" => 865,
               "setembro" => 723
             },
             "diego" => %{
               "abril" => 751,
               "agosto" => 730,
               "dezembro" => 782,
               "fevereiro" => 703,
               "janeiro" => 693,
               "julho" => 780,
               "junho" => 679,
               "maio" => 754,
               "marco" => 730,
               "novembro" => 688,
               "outubro" => 609,
               "setembro" => 784
             },
             "giuliano" => %{
               "abril" => 793,
               "agosto" => 709,
               "dezembro" => 677,
               "fevereiro" => 746,
               "janeiro" => 715,
               "julho" => 735,
               "junho" => 775,
               "maio" => 809,
               "marco" => 728,
               "novembro" => 705,
               "outubro" => 750,
               "setembro" => 717
             },
             "jakeliny" => %{
               "abril" => 849,
               "agosto" => 731,
               "dezembro" => 755,
               "fevereiro" => 770,
               "janeiro" => 809,
               "julho" => 825,
               "junho" => 793,
               "maio" => 681,
               "marco" => 814,
               "novembro" => 648,
               "outubro" => 766,
               "setembro" => 796
             },
             "joseph" => %{
               "abril" => 676,
               "agosto" => 806,
               "dezembro" => 763,
               "fevereiro" => 787,
               "janeiro" => 769,
               "julho" => 796,
               "junho" => 751,
               "maio" => 721,
               "marco" => 633,
               "novembro" => 627,
               "outubro" => 660,
               "setembro" => 750
             },
             "mayk" => %{
               "abril" => 654,
               "agosto" => 723,
               "dezembro" => 814,
               "fevereiro" => 763,
               "janeiro" => 706,
               "julho" => 796,
               "junho" => 742,
               "maio" => 763,
               "marco" => 706,
               "novembro" => 811,
               "outubro" => 678,
               "setembro" => 736
             },
             "rafael" => %{
               "abril" => 738,
               "agosto" => 786,
               "dezembro" => 612,
               "fevereiro" => 693,
               "janeiro" => 762,
               "julho" => 725,
               "junho" => 813,
               "maio" => 787,
               "marco" => 827,
               "novembro" => 773,
               "outubro" => 826,
               "setembro" => 701
             },
             "vinicius" => %{
               "abril" => 780,
               "agosto" => 712,
               "dezembro" => 816,
               "fevereiro" => 747,
               "janeiro" => 765,
               "julho" => 682,
               "junho" => 775,
               "maio" => 791,
               "marco" => 879,
               "novembro" => 759,
               "outubro" => 723,
               "setembro" => 787
             }
           },
           "hours_per_year" => %{
             "cleiton" => %{
               "2016" => 1822,
               "2017" => 1723,
               "2018" => 1894,
               "2019" => 1823,
               "2020" => 1831
             },
             "daniele" => %{
               "2016" => 1765,
               "2017" => 1875,
               "2018" => 1777,
               "2019" => 1627,
               "2020" => 1666
             },
             "danilo" => %{
               "2016" => 1788,
               "2017" => 1821,
               "2018" => 2098,
               "2019" => 1867,
               "2020" => 1731
             },
             "diego" => %{
               "2016" => 1689,
               "2017" => 1771,
               "2018" => 1871,
               "2019" => 1663,
               "2020" => 1689
             },
             "giuliano" => %{
               "2016" => 1822,
               "2017" => 1782,
               "2018" => 1668,
               "2019" => 1892,
               "2020" => 1695
             },
             "jakeliny" => %{
               "2016" => 1911,
               "2017" => 1744,
               "2018" => 1802,
               "2019" => 1817,
               "2020" => 1963
             },
             "joseph" => %{
               "2016" => 1776,
               "2017" => 1812,
               "2018" => 1580,
               "2019" => 1749,
               "2020" => 1822
             },
             "mayk" => %{
               "2016" => 1770,
               "2017" => 1716,
               "2018" => 1857,
               "2019" => 1872,
               "2020" => 1677
             },
             "rafael" => %{
               "2016" => 1820,
               "2017" => 1632,
               "2018" => 1734,
               "2019" => 1861,
               "2020" => 1996
             },
             "vinicius" => %{
               "2016" => 1821,
               "2017" => 1816,
               "2018" => 1830,
               "2019" => 1779,
               "2020" => 1970
             }
           }
         }}

      assert response == expected_response
    end
  end
end
