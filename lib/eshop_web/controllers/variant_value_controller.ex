defmodule EshopWeb.VariantValueController do
  use EshopWeb, :controller

  alias Eshop.Components
  alias Eshop.Components.VariantValue

  action_fallback EshopWeb.FallbackController

  def index(conn, _params) do
    variant_values = Components.list_variant_values()
    render(conn, "index.json", variant_values: variant_values)
  end

  def create(conn, %{"variant_value" => variant_value_params}) do
    with {:ok, %VariantValue{} = variant_value} <- Components.create_variant_value(variant_value_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.variant_value_path(conn, :show, variant_value))
      |> render("show.json", variant_value: variant_value)
    end
  end

  def show(conn, %{"id" => id}) do
    variant_value = Components.get_variant_value!(id)
    render(conn, "show.json", variant_value: variant_value)
  end

  def update(conn, %{"id" => id, "variant_value" => variant_value_params}) do
    variant_value = Components.get_variant_value!(id)

    with {:ok, %VariantValue{} = variant_value} <- Components.update_variant_value(variant_value, variant_value_params) do
      render(conn, "show.json", variant_value: variant_value)
    end
  end

  def delete(conn, %{"id" => id}) do
    variant_value = Components.get_variant_value!(id)

    with {:ok, %VariantValue{}} <- Components.delete_variant_value(variant_value) do
      send_resp(conn, :no_content, "")
    end
  end
end
