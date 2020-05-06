defmodule EshopWeb.ItemController do
  use EshopWeb, :controller

  alias Eshop.Objects
  alias Eshop.Objects.Item

  action_fallback EshopWeb.FallbackController

  def index(conn, _params) do
    items = Objects.list_items()
    render(conn, "index.json", items: items)
  end

  def create(conn, %{"item" => item_params}) do
    with {:ok, %Item{} = item} <- Objects.create_item(item_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.item_path(conn, :show, item))
      |> render("show.json", item: item)
    end
  end

  def show(conn, %{"id" => id}) do
    item = Objects.get_item!(id)
    render(conn, "show.json", item: item)
  end

  def update(conn, %{"id" => id, "item" => item_params}) do
    item = Objects.get_item!(id)

    with {:ok, %Item{} = item} <- Objects.update_item(item, item_params) do
      render(conn, "show.json", item: item)
    end
  end

  def delete(conn, %{"id" => id}) do
    item = Objects.get_item!(id)

    with {:ok, %Item{}} <- Objects.delete_item(item) do
      send_resp(conn, :no_content, "")
    end
  end
end
