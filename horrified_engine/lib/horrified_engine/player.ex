defmodule HorrifiedEngine.Player do
  alias __MODULE__

  @enforce_keys [:name]
  defstruct [:name]

  def new(name), do:
    %Player{name: name}

end