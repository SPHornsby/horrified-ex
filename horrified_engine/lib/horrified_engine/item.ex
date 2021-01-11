defmodule HorrifiedEngine.Item do
  alias __MODULE__

  @enforce_keys [:name, :color, :value, :start_location]
  defstruct [:name, :color, :value, :start_location]

  def new(name, color, value, start_location), do:
    %Item{name: name, color: color, value: value, start_location: start_location}


end