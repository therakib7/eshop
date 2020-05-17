defmodule EshopWeb.ItemCategoryController do
  use EshopWeb, :controller

  alias Eshop.Components
  alias Eshop.Components.ItemCategory

  action_fallback EshopWeb.FallbackController

  def index(conn, _params) do
    item_categories = Components.list_item_categories()
    render(conn, "index.json", item_categories: item_categories)
  end

  def create(conn, %{"item_category" => item_category_params}) do
    with {:ok, %ItemCategory{} = item_category} <-
           Components.create_item_category(item_category_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.item_category_path(conn, :show, item_category))
      |> render("show.json", item_category: item_category)
    end
  end

  def show(conn, %{"id" => id}) do
    item_category = Components.get_item_category!(id)
    render(conn, "show.json", item_category: item_category)
  end

  def update(conn, %{"id" => id, "item_category" => item_category_params}) do
    item_category = Components.get_item_category!(id)

    with {:ok, %ItemCategory{} = item_category} <-
           Components.update_item_category(item_category, item_category_params) do
      render(conn, "show.json", item_category: item_category)
    end
  end

  def delete(conn, %{"id" => id}) do
    item_category = Components.get_item_category!(id)

    with {:ok, %ItemCategory{}} <- Components.delete_item_category(item_category) do
      send_resp(conn, :no_content, "")
    end
  end
end
