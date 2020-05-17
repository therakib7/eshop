defmodule EshopWeb.Schema.Resolvers.InvoiceItemVariant do
  def list_invoice_item_variants(_parent, _args, _resolution) do
    {:ok, Eshop.Orders.list_invoice_item_variants()}
  end

  def get_invoice_item_variant(_, %{id: id}, _) do
    {:ok, Eshop.Orders.get_invoice_item_variant!(id)}
  end

  def create_invoice_item_variant(_parent, args, _resolution) do
    Eshop.Orders.create_invoice_item_variant(args)
  end

  def update_invoice_item_variant(
        %{id: id, invoice_item_variant_params: invoice_item_variant_params},
        _info
      ) do
    case {:ok, Eshop.Orders.get_invoice_item_variant!(id)} do
      {:ok, invoice_item_variant} ->
        invoice_item_variant
        |> Eshop.Orders.update_invoice_item_variant(invoice_item_variant_params)
    end
  end

  def delete_invoice_item_variant(%{id: id}, _info) do
    case {:ok, Eshop.Orders.get_invoice_item_variant!(id)} do
      {:ok, invoice_item_variant} ->
        invoice_item_variant |> Eshop.Orders.delete_invoice_item_variant()
    end
  end
end
