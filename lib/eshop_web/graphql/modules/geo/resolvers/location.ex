defmodule EshopWeb.Schema.Resolvers.Location do
  def list_locations(_parent, _args, _resolution) do
    {:ok, Eshop.Geo.list_locations()}
  end

  def get_location(_, %{id: id}, _) do
    {:ok, Eshop.Geo.get_location!(id)}
  end

  def create_location(_parent, args, _resolution) do
    Eshop.Geo.create_location(args)
  end

  def update_location(%{id: id, location_params: location_params}, _info) do
    case {:ok, Eshop.Geo.get_location!(id)} do
      {:ok, location} -> location |> Eshop.Geo.update_location(location_params)
    end
  end

  def delete_location(%{id: id}, _info) do
    case {:ok, Eshop.Geo.get_location!(id)} do
      {:ok, location} -> location |> Eshop.Geo.delete_location()
    end
  end
end
