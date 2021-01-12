defmodule HorrifiedEngine.Board do
  alias HorrifiedEngine.{Board, Space, Item, Perk}
  @enforce_keys [:spaces, :items, :perk_deck]
  defstruct [:spaces, :items, :perk_deck, :players]


  def new(), do:
    %Board{
      perk_deck: Perk.get_deck(),
      spaces: [
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
      ],
      items: Item.get_item_bag(),
      players: [
        %{name: "test", perks: []}
      ]
    }

  def draw_perk_card_and_update_board(board, player_name) do
    {perk_deck, draw} = draw_perk_card(board.perk_deck)
    players = assign_perk_card(board.players, player_name, draw)
    board = %{board | perk_deck: perk_deck, players: players}
  end

  defp draw_perk_card(perk_deck) do
    [draw | perk_deck] = perk_deck
    {perk_deck, draw}
  end

  defp assign_perk_card(players, player_name, card) do
    player = Enum.find(players, fn sp -> sp.name == player_name end)
    new_perks = [card | player.perks]
    player = %{player | perks: new_perks } 
    List.replace_at(players, Enum.find_index(players, fn player -> player.name == player_name end), player)
  end

  def draw_item_and_update_board(board) do
    draw_item_and_update_board(board, 1)
  end
  
  def draw_item_and_update_board(board, n) do
    {items, draw} = draw_items(board.items, n)
    board = %{board | items: items}
    {board, draw}
  end

  defp draw_items(items, n), do:
    draw_items(items, n, [])

  defp draw_items(items, n, draw) when n <= 0 do
    {items, draw}
  end

  defp draw_items(items, n, draw) do
    [head | items] = items |> Enum.shuffle
    draw = [head | draw]
    draw_items(items, n - 1, draw)
  end

  def place_item_and_update_board(board, items) do
    new_spaces = place_item(board.spaces, items)
    %{board | spaces: new_spaces}  
  end

  defp place_item(spaces, items) when items == [] do
    spaces
  end

  defp place_item(spaces, items) do
    {item, items} = List.pop_at(items, 0)
    space = Enum.find(spaces, fn sp -> sp.name == item.start_location end)
    new_items = [item | space.items]
    space = %{space | items: new_items }   
    new_spaces = List.replace_at(spaces, Enum.find_index(spaces, fn sp -> sp.name == item.start_location end), space)
    place_item(new_spaces, items)
  end

  def place_villager_and_update_board(board, space_name, villager) do
    new_spaces = place_villager(board.spaces, space_name, villager)
    %{board | spaces: new_spaces}
  end

  defp place_villager(spaces, space_name, villager) do
    space = Enum.find(spaces, fn sp -> sp.name == space_name end)
    new_villagers = [villager | space.villagers]
    space = %{space | villagers: new_villagers } 
    List.replace_at(spaces, Enum.find_index(spaces, fn sp -> sp.name == space_name end), space)
  end
end