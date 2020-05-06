defmodule EshopWeb.ItemView do
  use EshopWeb, :view
  alias EshopWeb.ItemView

  def render("index.json", %{items: items}) do
    %{data: render_many(items, ItemView, "item.json")}
  end

  def render("show.json", %{item: item}) do
    %{data: render_one(item, ItemView, "item.json")}
  end

  def render("item.json", %{item: item}) do
    %{id: item.id,
      is_active: item.is_active,
      name: item.name,
      native_name: item.native_name,
      desc: item.desc,
      native_desc: item.native_desc,
      views: item.views,
      loves: item.loves,
      vat: item.vat,
      vat_type: item.vat_type,
      unit: item.unit,
      has_variant: item.has_variant,
      has_package: item.has_package,
      total_order: item.total_order,
      low_stock: item.low_stock,
      has_warehouse: item.has_warehouse,
      cost_price: item.cost_price,
      unit_price: item.unit_price,
      sell_price: item.sell_price,
      type: item.type,
      type_id: item.type_id,
      extra_fields: item.extra_fields,
      asin_id: item.asin_id}
  end
end
