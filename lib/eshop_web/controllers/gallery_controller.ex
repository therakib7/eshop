defmodule EshopWeb.GalleryController do
  use EshopWeb, :controller

  alias Eshop.Attachments
  alias Eshop.Attachments.Gallery

  action_fallback EshopWeb.FallbackController

  def index(conn, _params) do
    galleries = Attachments.list_galleries()
    render(conn, "index.json", galleries: galleries)
  end

  def create(conn, %{"gallery" => gallery_params}) do
    with {:ok, %Gallery{} = gallery} <- Attachments.create_gallery(gallery_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.gallery_path(conn, :show, gallery))
      |> render("show.json", gallery: gallery)
    end
  end

  def show(conn, %{"id" => id}) do
    gallery = Attachments.get_gallery!(id)
    render(conn, "show.json", gallery: gallery)
  end

  def update(conn, %{"id" => id, "gallery" => gallery_params}) do
    gallery = Attachments.get_gallery!(id)

    with {:ok, %Gallery{} = gallery} <- Attachments.update_gallery(gallery, gallery_params) do
      render(conn, "show.json", gallery: gallery)
    end
  end

  def delete(conn, %{"id" => id}) do
    gallery = Attachments.get_gallery!(id)

    with {:ok, %Gallery{}} <- Attachments.delete_gallery(gallery) do
      send_resp(conn, :no_content, "")
    end
  end
end
