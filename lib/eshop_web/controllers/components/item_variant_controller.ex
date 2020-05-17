defmodule EshopWeb.ItemVariantController do
  use EshopWeb, :controller

  alias Eshop.Components
  alias Eshop.Components.ItemVariant

  action_fallback EshopWeb.FallbackController

  def index(conn, _params) do
    item_variants = Components.list_item_variants()
    render(conn, "index.json", item_variants: item_variants)
  end

  def create(conn, %{"item_variant" => item_variant_params}) do
    with {:ok, %ItemVariant{} = item_variant} <-
           Components.create_item_variant(item_variant_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.item_variant_path(conn, :show, item_variant))
      |> render("show.json", item_variant: item_variant)
    end
  end

  def show(conn, %{"id" => id}) do
    item_variant = Components.get_item_variant!(id)
    render(conn, "show.json", item_variant: item_variant)
  end

  def update(conn, %{"id" => id, "item_variant" => item_variant_params}) do
    item_variant = Components.get_item_variant!(id)

    with {:ok, %ItemVariant{} = item_variant} <-
           Components.update_item_variant(item_variant, item_variant_params) do
      render(conn, "show.json", item_variant: item_variant)
    end
  end

  def delete(conn, %{"id" => id}) do
    item_variant = Components.get_item_variant!(id)

    with {:ok, %ItemVariant{}} <- Components.delete_item_variant(item_variant) do
      send_resp(conn, :no_content, "")
    end
  end
end
