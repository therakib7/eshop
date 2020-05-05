defmodule EshopWeb.LocationView do
  use EshopWeb, :view
  alias EshopWeb.LocationView

  def render("index.json", %{locations: locations}) do
    %{data: render_many(locations, LocationView, "location.json")}
  end

  def render("show.json", %{location: location}) do
    %{data: render_one(location, LocationView, "location.json")}
  end

  def render("location.json", %{location: location}) do
    %{id: location.id,
      is_active: location.is_active,
      country_id: location.country_id,
      stage_id: location.stage_id,
      parent_id: location.parent_id,
      name: location.name,
      native_name: location.native_name,
      order: location.order,
      code: location.code,
      lat: location.lat,
      long: location.long,
      web: location.web,
      user_id: location.user_id}
  end
end
