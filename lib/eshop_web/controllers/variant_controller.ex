defmodule EshopWeb.VariantController do
  use EshopWeb, :controller

  alias Eshop.Components
  alias Eshop.Components.Variant

  action_fallback EshopWeb.FallbackController

  def index(conn, _params) do
    variants = Components.list_variants()
    render(conn, "index.json", variants: variants)
  end

  def create(conn, %{"variant" => variant_params}) do
    with {:ok, %Variant{} = variant} <- Components.create_variant(variant_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.variant_path(conn, :show, variant))
      |> render("show.json", variant: variant)
    end
  end

  def show(conn, %{"id" => id}) do
    variant = Components.get_variant!(id)
    render(conn, "show.json", variant: variant)
  end

  def update(conn, %{"id" => id, "variant" => variant_params}) do
    variant = Components.get_variant!(id)

    with {:ok, %Variant{} = variant} <- Components.update_variant(variant, variant_params) do
      render(conn, "show.json", variant: variant)
    end
  end

  def delete(conn, %{"id" => id}) do
    variant = Components.get_variant!(id)

    with {:ok, %Variant{}} <- Components.delete_variant(variant) do
      send_resp(conn, :no_content, "")
    end
  end
end
