defmodule EshopWeb.ItemLocationView do
  use EshopWeb, :view
  alias EshopWeb.ItemLocationView

  def render("index.json", %{item_locations: item_locations}) do
    %{data: render_many(item_locations, ItemLocationView, "item_location.json")}
  end

  def render("show.json", %{item_location: item_location}) do
    %{data: render_one(item_location, ItemLocationView, "item_location.json")}
  end

  def render("item_location.json", %{item_location: item_location}) do
    %{id: item_location.id}
  end
end
