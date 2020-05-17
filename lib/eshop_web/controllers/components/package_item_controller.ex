defmodule EshopWeb.PackageItemController do
  use EshopWeb, :controller

  alias Eshop.Components
  alias Eshop.Components.PackageItem

  action_fallback EshopWeb.FallbackController

  def index(conn, _params) do
    package_items = Components.list_package_items()
    render(conn, "index.json", package_items: package_items)
  end

  def create(conn, %{"package_item" => package_item_params}) do
    with {:ok, %PackageItem{} = package_item} <-
           Components.create_package_item(package_item_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.package_item_path(conn, :show, package_item))
      |> render("show.json", package_item: package_item)
    end
  end

  def show(conn, %{"id" => id}) do
    package_item = Components.get_package_item!(id)
    render(conn, "show.json", package_item: package_item)
  end

  def update(conn, %{"id" => id, "package_item" => package_item_params}) do
    package_item = Components.get_package_item!(id)

    with {:ok, %PackageItem{} = package_item} <-
           Components.update_package_item(package_item, package_item_params) do
      render(conn, "show.json", package_item: package_item)
    end
  end

  def delete(conn, %{"id" => id}) do
    package_item = Components.get_package_item!(id)

    with {:ok, %PackageItem{}} <- Components.delete_package_item(package_item) do
      send_resp(conn, :no_content, "")
    end
  end
end
