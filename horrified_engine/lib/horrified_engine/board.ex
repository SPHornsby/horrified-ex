defmodule HorrifiedEngine.Board do
  alias HorrifiedEngine.{Board, Space}
  @enforce_keys [:spaces]
  defstruct [:spaces]


  def new(), do:
    %Board{spaces: MapSet.new([
      Space.new("hospital", :land, MapSet.new([
        "church"
      ])),
      Space.new("graveyard", :land, MapSet.new([
        "church"
      ])),
      Space.new("institute", :land, MapSet.new([
        "laboratory", "waterfront"
      ])),
      Space.new("crypt", :land, MapSet.new([
        "abbey"
      ])),
      Space.new("museum", :land, MapSet.new([
        "lamp"
      ])),
      Space.new("church", :land, MapSet.new([
        "hospital", "graveyard", "lamp"
      ])),
      Space.new("laboratory", :land, MapSet.new([
        "institute", "shop"
      ])),
      Space.new("waterfront", :water, MapSet.new([
        "institute", "bridge - east", "docks"
      ])),
      Space.new("abbey", :land, MapSet.new([
        "crypt", "mansion"
      ])),
      Space.new("lamp", :land, MapSet.new([
        "museum", "church", "shop", "mansion"
      ])),
      Space.new("shop", :land, MapSet.new([
        "lamp", "laboratory", "bridge - east"
      ])),
      Space.new("mansion", :land, MapSet.new([
        "abbey", "lamp", "bridge - west"
      ])),
      Space.new("river", :water, MapSet.new([
        "bridge - west", "bridge - east"
      ])),
      Space.new("bridge - east", :land, MapSet.new([
        "river", "shop", "waterfront", "theatre"
      ])),
      Space.new("docks", :land, MapSet.new([
        "tower", "waterfront"
      ])),
      Space.new("lagoon", :water, MapSet.new([
        "cave", "abbey", "bridge - west"
      ])),
      Space.new("bridge - west", :land, MapSet.new([
        "lagoon", "mansion", "river", "fountain", "camp"
      ])),
      Space.new("fountain", :land, MapSet.new([
        "bridge-west", "precinct", "inn", "theatre"
      ])),
      Space.new("theatre", :land, MapSet.new([
        "fountain", "bridge - east", "tower", "barn"
      ])),
      Space.new("tower", :land, MapSet.new([
        "theatre", "docks", "dungeon"
      ])),
      Space.new("cave", :land, MapSet.new([
        "lagoon", "camp"
      ])),
      Space.new("camp", :land, MapSet.new([
        "cave", "bridge - west"
      ])),
      Space.new("precinct", :land, MapSet.new([
        "fountain"
      ])),
      Space.new("inn", :land, MapSet.new([
        "fountain"
      ])),
      Space.new("barn", :land, MapSet.new([
        "theatre"
      ])),
      Space.new("dungeon", :land, MapSet.new([
        "tower"
      ])),
    ]) }

end