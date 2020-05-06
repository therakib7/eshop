defmodule EshopWeb.ProductView do
  use EshopWeb, :view
  alias EshopWeb.ProductView

  def render("index.json", %{products: products}) do
    %{data: render_many(products, ProductView, "product.json")}
  end

  def render("show.json", %{product: product}) do
    %{data: render_one(product, ProductView, "product.json")}
  end

  def render("product.json", %{product: product}) do
    %{id: product.id,
      mfg_date: product.mfg_date,
      exp_date: product.exp_date,
      sku: product.sku,
      barcode: product.barcode}
  end
end
