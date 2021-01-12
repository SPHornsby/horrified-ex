defmodule HorrifiedEngine.Item do
  alias __MODULE__

  @enforce_keys [:name, :color, :value, :start_location]
  defstruct [:name, :color, :value, :start_location]

  def new(name, color, value, start_location), do:
    %Item{name: name, color: color, value: value, start_location: start_location}

  def get_item_bag() do
    [
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
    ] |> Enum.shuffle
  end
end