defmodule Aoc2018 do
  def file_to_list(filename) do
    {:ok, data} = File.read(filename)

    String.split(data, "\n")
  end
end
