defmodule HorrifiedEngine.Player do
  alias __MODULE__

  @enforce_keys [:name, :hero, :status, :items, :perks]
  defstruct [:name, :hero, :items, :perks, :status]

  def new(name) do
    hero = ""
    items = MapSet.new()
    perks = MapSet.new()
    
    %Player{name: name, hero: hero, status: :in_play, items: items, perks: perks}
  end

end