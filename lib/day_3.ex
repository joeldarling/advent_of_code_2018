defmodule Aoc2018.Day3 do
  def start do

    char_map = Aoc2018.file_to_list("day_3_input.txt")
    |> Enum.flat_map(&map_claim(&1))
    |> get_dupes
    |> MapSet.new
    |> MapSet.size
    
  end

  def get_dupes(list) do
    acc_dupes = fn(x, {elems, dupes}) ->
      case Map.has_key?(elems, x) do
        true -> {elems, Map.put(dupes, x, nil)}
        false -> {Map.put(elems, x, nil), dupes}
      end
    end

    list |> Enum.reduce({%{}, %{}}, acc_dupes) |> elem(1) |> Map.to_list
  end

  def map_claim(input) do
    [w, h] = get_dimenions(input)
    [x, y] = get_coords(input)
    
    for dx <- x..x + (w - 1), dy <- y..y + (h - 1), into: [], do: {dx, dy}
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