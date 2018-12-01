defmodule Aoc2018.Day1 do
  def start do
    {:ok, data} = File.read("day_1_input.txt")

    data
    |> String.split("\n")
    |> Enum.reduce(0, fn x, acc -> String.to_integer(x) + acc end)
  end
end