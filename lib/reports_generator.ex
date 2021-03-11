defmodule ReportsGenerator do
  alias ReportsGenerator.Parser

  @years %{
    "2016" => 0,
    "2017" => 0,
    "2018" => 0,
    "2019" => 0,
    "2020" => 0
  }

  @months %{
    "janeiro" => 0,
    "fevereiro" => 0,
    "marco" => 0,
    "abril" => 0,
    "maio" => 0,
    "junho" => 0,
    "julho" => 0,
    "agosto" => 0,
    "setembro" => 0,
    "outubro" => 0,
    "novembro" => 0,
    "dezembro" => 0
  }

  def build() do
    Parser.parse_file()
    |> Enum.reduce(report_initial_format(), fn line, report -> sum_values(line, report) end)
  end

  defp sum_values(
         [name, hours, _day, month, year],
         %{
           "all_hours" => all_hours,
           "hours_per_month" => hours_per_month,
           "hours_per_year" => hours_per_year
         }
       ) do
    all_hours = Map.put(all_hours, name, all_hours[name] + hours)
    hours_per_month = sum_hours_by_month(hours_per_month, name, month, hours)
    hours_per_year = sum_hours_by_year(hours_per_year, name, year, hours)

    build_reports(all_hours, hours_per_month, hours_per_year)
  end

  defp sum_hours_by_month(hours_per_month, name, month, hours) do
    current_hours_sum = hours_per_month[name][month]
    Map.put(hours_per_month, hours_per_month[name][month], current_hours_sum + hours)
  end

  defp sum_hours_by_year(hours_per_year, name, year, hours) do
    current_hours_sum = hours_per_year[name][year]
    Map.put(hours_per_year, hours_per_year[name][year], current_hours_sum + hours)
  end

  def report_initial_format() do
    professionals = Parser.file_professionals_names()
    all_hours = Enum.into(%{}, professionals)
    hours_per_month = months_structure(professionals)
    hours_per_year = years_structure(professionals)

    build_reports(all_hours, hours_per_month, hours_per_year)
  end

  defp months_structure(professionals) do
    Enum.reduce(professionals, %{}, fn {name, _value}, acc ->
      Enum.into(acc, %{name => @months})
    end)
  end

  defp years_structure(professionals) do
    Enum.reduce(professionals, %{}, fn {name, _value}, acc ->
      Enum.into(acc, %{name => @years})
    end)
  end

  defp build_reports(all_hours, hours_per_month, hours_per_year) do
    %{
      "all_hours" => all_hours,
      "hours_per_month" => hours_per_month,
      "hours_per_year" => hours_per_year
    }
  end
end
