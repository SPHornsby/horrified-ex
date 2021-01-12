defmodule HorrifiedEngine.Perk do
  alias __MODULE__
  @enforce_keys [:name, :text]
  defstruct [:name, :text]

  def new(name, text), do:
    %Perk{name: name, text: text}

  def get_deck() do
    [
      new("Hurry", "Move each Hero up to 2 spaces"),
      new("Late Into The Night", "The current player takes 2 additional actions"),
      new("Late Into The Night", "The current player takes 2 additional actions"),
      new("Rush", "Move a Hero up to 4 spaces."),
      new("Rush", "Move a Hero up to 4 spaces.")
    ] |> Enum.shuffle
  end

end