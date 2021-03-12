defmodule HoursReport do
  alias HoursReport.Parser

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

  def build(filename) do
    Parser.parse_file(filename)
    |> Enum.reduce(report_initial_format(), fn line, report ->
      sum_values(line, report)
    end)
  end

  def build_from_many(filenames) when not is_list(filenames) do
    {:error, "Plase provide a list of filenames"}
  end

  def build_from_many(filenames) do
    result =
      filenames
      |> Task.async_stream(&build/1)
      |> Enum.reduce(report_initial_format(), fn {:ok, result}, report ->
        sum_reports(report, result)
      end)

    {:ok, result}
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

  defp sum_reports(
         %{
           "all_hours" => all_hours1,
           "hours_per_month" => hours_per_month1,
           "hours_per_year" => hours_per_year1
         },
         %{
           "all_hours" => all_hours2,
           "hours_per_month" => hours_per_month2,
           "hours_per_year" => hours_per_year2
         }
       ) do
    all_hours = merge_maps(all_hours1, all_hours2)
    hours_per_month = merge_months_maps(hours_per_month1, hours_per_month2)
    hours_per_year = merge_years_maps(hours_per_year1, hours_per_year2)

    build_reports(all_hours, hours_per_month, hours_per_year)
  end

  defp merge_maps(map1, map2) do
    Map.merge(map1, map2, fn _key, value1, value2 -> value1 + value2 end)
  end

  defp merge_months_maps(months1, months2) do
    Map.merge(months1, months2, fn _key, month1, month2 ->
      merge_maps(month1, month2)
    end)
  end

  defp merge_years_maps(years1, years2) do
    Map.merge(years1, years2, fn _key, year1, year2 ->
      merge_maps(year1, year2)
    end)
  end

  defp sum_hours_by_month(hours_per_month, name, month, hours) do
    current_hours_sum = hours_per_month[name][month]
    put_in(hours_per_month, [name, month], current_hours_sum + hours)
  end

  defp sum_hours_by_year(hours_per_year, name, year, hours) do
    current_hours_sum = hours_per_year[name][year]
    put_in(hours_per_year, [name, year], current_hours_sum + hours)
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
