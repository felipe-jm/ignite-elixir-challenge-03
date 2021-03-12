defmodule HoursReport.ParserTest do
  use ExUnit.Case

  alias HoursReport.Parser

  describe "parse_file" do
    test "parses the file" do
      filename = "reports_test"

      response =
        filename
        |> Parser.parse_file()
        |> Enum.map(& &1)

      expected_response = [
        ["daniele", 7, 29, "abril", "2018"],
        ["mayk", 4, 9, "dezembro", "2019"],
        ["daniele", 5, 27, "dezembro", "2016"],
        ["mayk", 1, 2, "dezembro", "2017"],
        ["giuliano", 3, 13, "fevereiro", "2017"]
      ]

      assert response == expected_response
    end
  end

  describe "file_professionals_names/1" do
    test "returns a list of names from file" do
      response = Parser.file_professionals_names()

      expected_response = %{
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
      }

      assert response == expected_response
    end
  end

  describe "number_to_month/1" do
    test "returns the month as text" do
      month = 1

      response = Parser.number_to_month(month)

      expected_response = "janeiro"

      assert response == expected_response
    end

    test "returns an error if month is not between 1 and 12" do
      month = 13

      response = Parser.number_to_month(month)

      expected_response = {:error, "Plase provide a number between 1 and 12"}

      assert response == expected_response
    end
  end
end
