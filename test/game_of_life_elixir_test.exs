defmodule GameOfLifeElixirTest do
  use ExUnit.Case
  doctest GameOfLifeElixir

  test "greets the world" do
    assert GameOfLifeElixir.hello() == :world
  end
end
