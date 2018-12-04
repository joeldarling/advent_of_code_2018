defmodule Aoc2018.Day3 do
  def start do

    char_map = Aoc2018.file_to_list("day_3_input.txt")
    |> Enum.map(&map_claim(&1))

    [first, second | rest] = char_map
    initial_val = MapSet.intersection(first, second)
    Enum.reduce(rest, initial_val, fn curr, acc ->
      overlap = MapSet.intersection(acc, curr)
      if MapSet.size(overlap) > 0 do MapSet.put(acc, overlap) else acc end
    end)
    |> Enum.count
  end

  def merge_sets(input) do
    
  end

  def map_claim(input) do
    [w, h] = get_dimenions(input)
    [x, y] = get_coords(input)
    
    for dx <- x..x + (w - 1), dy <- y..y + (h - 1), into: %MapSet{}, do: {dx, dy}
  end

  def get_dimenions(str) do
    Regex.run(~r/[0-9]{1,10}x[0-9]{1,10}/, str)
    |> List.first
    |> String.split("x")
    |> Enum.map(&String.to_integer(&1))
  end

  def get_coords(str) do
    Regex.run(~r/[0-9]{1,10},[0-9]{1,10}/, str)
    |> List.first
    |> String.split(",")
    |> Enum.map(&String.to_integer(&1))
  end
  
end