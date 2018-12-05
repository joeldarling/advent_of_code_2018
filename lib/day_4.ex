defmodule Aoc2018.Day4 do
  def start do

    char_map = Aoc2018.file_to_list("day_4_input.txt")
    # |> Enum.flat_map(&map_claim(&1))
    # |> get_dupes
    # |> MapSet.new
    # |> MapSet.size
    
  end

  def get_coords(str) do
    Regex.run(~r/[0-9]{1,10},[0-9]{1,10}/, str)
    |> List.first
    |> String.split(",")
    |> Enum.map(&String.to_integer(&1))
  end
  
end