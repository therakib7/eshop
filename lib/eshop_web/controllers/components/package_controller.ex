defmodule EshopWeb.PackageController do
  use EshopWeb, :controller

  alias Eshop.Components
  alias Eshop.Components.Package

  action_fallback EshopWeb.FallbackController

  def index(conn, _params) do
    packages = Components.list_packages()
    render(conn, "index.json", packages: packages)
  end

  def create(conn, %{"package" => package_params}) do
    with {:ok, %Package{} = package} <- Components.create_package(package_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.package_path(conn, :show, package))
      |> render("show.json", package: package)
    end
  end

  def show(conn, %{"id" => id}) do
    package = Components.get_package!(id)
    render(conn, "show.json", package: package)
  end

  def update(conn, %{"id" => id, "package" => package_params}) do
    package = Components.get_package!(id)

    with {:ok, %Package{} = package} <- Components.update_package(package, package_params) do
      render(conn, "show.json", package: package)
    end
  end

  def delete(conn, %{"id" => id}) do
    package = Components.get_package!(id)

    with {:ok, %Package{}} <- Components.delete_package(package) do
      send_resp(conn, :no_content, "")
    end
  end
end
