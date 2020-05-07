defmodule EshopWeb.VariantView do
  use EshopWeb, :view
  alias EshopWeb.VariantView

  def render("index.json", %{variants: variants}) do
    %{data: render_many(variants, VariantView, "variant.json")}
  end

  def render("show.json", %{variant: variant}) do
    %{data: render_one(variant, VariantView, "variant.json")}
  end

  def render("variant.json", %{variant: variant}) do
    %{id: variant.id,
      name: variant.name,
      native_name: variant.native_name,
      type: variant.type}
  end
end
