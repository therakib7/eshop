defmodule EshopWeb.TypeCategoryController do
  use EshopWeb, :controller

  alias Eshop.Components
  alias Eshop.Components.TypeCategory

  action_fallback EshopWeb.FallbackController

  def index(conn, _params) do
    type_categories = Components.list_type_categories()
    render(conn, "index.json", type_categories: type_categories)
  end

  def create(conn, %{"type_category" => type_category_params}) do
    with {:ok, %TypeCategory{} = type_category} <-
           Components.create_type_category(type_category_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.type_category_path(conn, :show, type_category))
      |> render("show.json", type_category: type_category)
    end
  end

  def show(conn, %{"id" => id}) do
    type_category = Components.get_type_category!(id)
    render(conn, "show.json", type_category: type_category)
  end

  def update(conn, %{"id" => id, "type_category" => type_category_params}) do
    type_category = Components.get_type_category!(id)

    with {:ok, %TypeCategory{} = type_category} <-
           Components.update_type_category(type_category, type_category_params) do
      render(conn, "show.json", type_category: type_category)
    end
  end

  def delete(conn, %{"id" => id}) do
    type_category = Components.get_type_category!(id)

    with {:ok, %TypeCategory{}} <- Components.delete_type_category(type_category) do
      send_resp(conn, :no_content, "")
    end
  end
end
