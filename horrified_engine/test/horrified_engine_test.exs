defmodule HorrifiedEngineTest do
  use ExUnit.Case
  doctest HorrifiedEngine

  test "greets the world" do
    assert HorrifiedEngine.hello() == :world
  end
end
