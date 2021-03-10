defmodule ReportsGenerator.Parser do
  def parse_file() do
    "gen_report.csv"
    |> File.stream!()
    |> Stream.map(fn line -> parse_line(line) end)
    |> Enum.map(& &1)
  end

  defp parse_line(line) do
    line
    |> String.trim()
    |> String.split(",")
    |> List.update_at(1, &String.to_integer/1)
    |> List.update_at(2, &String.to_integer/1)
    |> List.update_at(3, &String.to_integer/1)
  end

  def file_professionals_names() do
    parse_file()
    |> Enum.map(fn professional -> String.downcase(hd(professional)) end)
    |> Enum.uniq()
    |> Enum.into(%{}, &{&1, 0})
  end
end
