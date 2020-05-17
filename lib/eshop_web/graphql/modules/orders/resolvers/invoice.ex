defmodule EshopWeb.Schema.Resolvers.Invoice do
  def list_invoices(_parent, _args, _resolution) do
    {:ok, Eshop.Orders.list_invoices()}
  end

  def get_invoice(_, %{id: id}, _) do
    {:ok, Eshop.Orders.get_invoice!(id)}
  end

  def create_invoice(_parent, args, _resolution) do
    Eshop.Orders.create_invoice(args)
  end

  def update_invoice(%{id: id, invoice_params: invoice_params}, _info) do
    case {:ok, Eshop.Orders.get_invoice!(id)} do
      {:ok, invoice} -> invoice |> Eshop.Orders.update_invoice(invoice_params)
    end
  end

  def delete_invoice(%{id: id}, _info) do
    case {:ok, Eshop.Orders.get_invoice!(id)} do
      {:ok, invoice} -> invoice |> Eshop.Orders.delete_invoice()
    end
  end
end
