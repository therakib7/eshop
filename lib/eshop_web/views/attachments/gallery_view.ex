defmodule EshopWeb.GalleryView do
  use EshopWeb, :view
  alias EshopWeb.GalleryView

  def render("index.json", %{galleries: galleries}) do
    %{data: render_many(galleries, GalleryView, "gallery.json")}
  end

  def render("show.json", %{gallery: gallery}) do
    %{data: render_one(gallery, GalleryView, "gallery.json")}
  end

  def render("gallery.json", %{gallery: gallery}) do
    %{id: gallery.id, type: gallery.type, type_id: gallery.type_id}
  end
end
