defmodule Aoc2018.Day1 do
  def start do
    Aoc2018.file_to_list("day_1_input.txt")
    |> Enum.reduce(0, fn x, acc -> String.to_integer(x) + acc end)
  end
end