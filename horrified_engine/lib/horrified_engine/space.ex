defmodule HorrifiedEngine.Space do
  alias __MODULE__
  @enforce_keys [:name, :type, :neighbors, :items, :heroes, :monsters, :villagers]
  defstruct [:name, :type, :neighbors, :items, :heroes, :monsters, :villagers]

  def new(name, type, neighbors), do:
    %Space{name: name, type: type, neighbors: neighbors, items: MapSet.new(), heroes: MapSet.new(), monsters: MapSet.new(), villagers: MapSet.new()}

end