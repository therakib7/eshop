defmodule EshopWeb.VariantValueView do
  use EshopWeb, :view
  alias EshopWeb.VariantValueView

  def render("index.json", %{variant_values: variant_values}) do
    %{data: render_many(variant_values, VariantValueView, "variant_value.json")}
  end

  def render("show.json", %{variant_value: variant_value}) do
    %{data: render_one(variant_value, VariantValueView, "variant_value.json")}
  end

  def render("variant_value.json", %{variant_value: variant_value}) do
    %{id: variant_value.id, value: variant_value.value, native_value: variant_value.native_value}
  end
end
