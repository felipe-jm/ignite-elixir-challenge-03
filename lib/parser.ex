defmodule ReportsGenerator.Parser do
  def parse_file() do
    "test.csv"
    |> File.stream!()
    |> Stream.map(fn line -> parse_line(line) end)
  end

  defp parse_line(line) do
    line
    |> String.trim()
    |> String.split(",")
    |> List.update_at(0, &String.downcase/1)
    |> List.update_at(1, &String.to_integer/1)
    |> List.update_at(2, &String.to_integer/1)
    |> List.update_at(3, &number_to_month(String.to_integer(&1)))
  end

  def file_professionals_names() do
    parse_file()
    |> Enum.map(fn professional -> String.downcase(hd(professional)) end)
    |> Enum.uniq()
    |> Enum.into(%{}, &{&1, 0})
  end

  defp number_to_month(number) when number in 1..12 do
    case number do
      1 -> "janeiro"
      2 -> "fevereiro"
      3 -> "marco"
      4 -> "abril"
      5 -> "maio"
      6 -> "junho"
      7 -> "julho"
      8 -> "agosto"
      9 -> "setembro"
      10 -> "outubro"
      11 -> "novembro"
      12 -> "dezembro"
    end
  end

  defp number_to_month(number) when number not in 1..12 do
    {:error, "Plase provide a number between 1 and 12"}
  end
end
