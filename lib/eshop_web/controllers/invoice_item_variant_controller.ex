defmodule EshopWeb.InvoiceItemVariantController do
  use EshopWeb, :controller

  alias Eshop.Orders
  alias Eshop.Orders.InvoiceItemVariant

  action_fallback EshopWeb.FallbackController

  def index(conn, _params) do
    invoice_item_variants = Orders.list_invoice_item_variants()
    render(conn, "index.json", invoice_item_variants: invoice_item_variants)
  end

  def create(conn, %{"invoice_item_variant" => invoice_item_variant_params}) do
    with {:ok, %InvoiceItemVariant{} = invoice_item_variant} <- Orders.create_invoice_item_variant(invoice_item_variant_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.invoice_item_variant_path(conn, :show, invoice_item_variant))
      |> render("show.json", invoice_item_variant: invoice_item_variant)
    end
  end

  def show(conn, %{"id" => id}) do
    invoice_item_variant = Orders.get_invoice_item_variant!(id)
    render(conn, "show.json", invoice_item_variant: invoice_item_variant)
  end

  def update(conn, %{"id" => id, "invoice_item_variant" => invoice_item_variant_params}) do
    invoice_item_variant = Orders.get_invoice_item_variant!(id)

    with {:ok, %InvoiceItemVariant{} = invoice_item_variant} <- Orders.update_invoice_item_variant(invoice_item_variant, invoice_item_variant_params) do
      render(conn, "show.json", invoice_item_variant: invoice_item_variant)
    end
  end

  def delete(conn, %{"id" => id}) do
    invoice_item_variant = Orders.get_invoice_item_variant!(id)

    with {:ok, %InvoiceItemVariant{}} <- Orders.delete_invoice_item_variant(invoice_item_variant) do
      send_resp(conn, :no_content, "")
    end
  end
end
