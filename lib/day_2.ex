defmodule Aoc2018.Day2 do
  def start do

    char_map = Aoc2018.file_to_list("day_2_input.txt")
    |> Enum.map(&string_to_char_map(&1))

    count_by_2 = char_map
    |> Enum.flat_map(&filter_by_count(&1, 2))
    |> Enum.count

    count_by_3 = char_map
    |> Enum.flat_map(&filter_by_count(&1, 3))
    |> Enum.count

    count_by_2 * count_by_3
  end

  def string_to_char_map(string) do
    string
    |> String.graphemes
    |> Enum.reduce(%{}, fn char, acc ->
      Map.update(acc, char, 1, &(&1 + 1))
    end)
    |> Map.to_list
  end
  
  def filter_by_count(input, target_count) do
    input
    |> Enum.filter(fn {_, count} -> count === target_count end)
    |> Enum.uniq_by(fn {_, count} -> count end)
  end
  
end