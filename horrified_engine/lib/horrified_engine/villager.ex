defmodule HorrifiedEngine.Villager do
  alias __MODULE__
  
  @villagers [
    %{name: "Lucy", goal: "mansion"},
    %{name: "Maleva", goal: "shop"},
    %{name: "Dr. Reed", goal: "camp"},
    %{name: "Maria", goal: "camp"},
    %{name: "Wilbur & Chick", goal: "dungeon"},
    %{name: "Dr. Cranley", goal: "precinct"},
    %{name: "Fritz", goal: "institute"},
    %{name: "Renfield", goal: "hospital"},
    %{name: "Elizabeth", goal: "tower"},
    %{name: "Prof. Pearson", goal: "museum"}
  ]

  def get_villager(name) do
    Enum.find(@villagers, fn villager -> villager.name == name end)
  end
end