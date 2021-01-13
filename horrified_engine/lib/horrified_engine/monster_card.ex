defmodule HorrifiedEngine.MonsterCard do
  alias HorrifiedEngine.{Board, MonsterCard, Villager}

  @enforce_keys [:name, :text]
  defstruct [:name, :text, :item_tokens, :monsters, :movement, :dice, :action
]

  def new(name, text, item_tokens, monsters, movement, dice), do:
    new(name, text, item_tokens, monsters, movement, dice, [])

  def new(name, text, item_tokens, monsters, movement, dice, action
  ), do:
    %MonsterCard{name: name, text: text, item_tokens: item_tokens, monsters: monsters, movement: movement, dice: dice, action
    : action
  }

  def get_deck() do
    [
      new("Worried Fiancee",
          "Place Elizabeth at the Mansion",
          3,
          ["frankenstein", "bride", "frenzy"],
          1,
          2, 
          fn(board) ->
            beth = Villager.get_villager("Elizabeth")
            Board.place_villager_and_update_board(board, "mansion", beth)
          end
      ),
      new("Egyptian Expert", "Place Prof. Pearson at the Cave", 3, ['mummy', 'frenzy'], 2, 2, [])
    ] |> Enum.shuffle
  end

end