defmodule HorrifiedEngine.Board do
  alias HorrifiedEngine.{Board, Space, Item}
  @enforce_keys [:spaces, :items]
  defstruct [:spaces, :items]


  def new(), do:
    %Board{
      spaces: MapSet.new([
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
      ]),
      items: [
        Item.new("kite_1", :blue, 1, "tower"),
        Item.new("kite_2", :blue, 1, "tower"),
        Item.new("anatomy_text_1", :blue, 1, "institute"),
        Item.new("anatomy_text_2", :blue, 1, "institute"),
        Item.new("centrifuge_1", :blue, 1, "laboratory"),
        Item.new("centrifuge_2", :blue, 1, "laboratory"),
        Item.new("analysis_1", :blue, 2, "institute"),
        Item.new("analysis_2", :blue, 2, "institute"),
        Item.new("microscope_1", :blue, 2, "tower"),
        Item.new("microscope_2", :blue, 2, "tower"),
        Item.new("experiment_1", :blue, 2, "laboratory"),
        Item.new("experiment_2", :blue, 2, "laboratory"),
        Item.new("searchlight_1", :blue, 2, "precinct"),
        Item.new("telescope_1", :blue, 2, "mansion"),
        Item.new("rotenone_1", :blue, 3, "institute"),
        Item.new("monocane_mixture_1", :blue, 3, "inn"),
        Item.new("fossil_1", :blue, 3, "camp"),
        Item.new("camera_1", :blue, 3, "laboratory"),
        Item.new("cosmic_ray_diffuser_1", :blue, 3, "tower"),
        Item.new("nebularium_1", :blue, 3, "tower"),
      ]
    }

  def draw_item(items), do:
    draw_items(items, 1, [])

  def draw_items(items, n), do:
    draw_items(items, n, [])

  def draw_items(items, n, draw) when n <= 0 do
    {:ok, items, draw}
  end

  def draw_items(items, n, draw) do
    [head | items] = items |> Enum.shuffle
    draw = [head | draw]
    draw_items(items, n - 1, draw)
  end
end