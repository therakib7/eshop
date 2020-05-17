defmodule EshopWeb.TrackingInvoiceControllerTest do
  use EshopWeb.ConnCase

  alias Eshop.Shipments
  alias Eshop.Shipments.TrackingInvoice

  @create_attrs %{
    tracking_id: "some tracking_id"
  }
  @update_attrs %{
    tracking_id: "some updated tracking_id"
  }
  @invalid_attrs %{tracking_id: nil}

  def fixture(:tracking_invoice) do
    {:ok, tracking_invoice} = Shipments.create_tracking_invoice(@create_attrs)
    tracking_invoice
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all tracking_invoices", %{conn: conn} do
      conn = get(conn, Routes.tracking_invoice_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create tracking_invoice" do
    test "renders tracking_invoice when data is valid", %{conn: conn} do
      conn =
        post(conn, Routes.tracking_invoice_path(conn, :create), tracking_invoice: @create_attrs)

      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.tracking_invoice_path(conn, :show, id))

      assert %{
               "id" => id,
               "tracking_id" => "some tracking_id"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn =
        post(conn, Routes.tracking_invoice_path(conn, :create), tracking_invoice: @invalid_attrs)

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update tracking_invoice" do
    setup [:create_tracking_invoice]

    test "renders tracking_invoice when data is valid", %{
      conn: conn,
      tracking_invoice: %TrackingInvoice{id: id} = tracking_invoice
    } do
      conn =
        put(conn, Routes.tracking_invoice_path(conn, :update, tracking_invoice),
          tracking_invoice: @update_attrs
        )

      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.tracking_invoice_path(conn, :show, id))

      assert %{
               "id" => id,
               "tracking_id" => "some updated tracking_id"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, tracking_invoice: tracking_invoice} do
      conn =
        put(conn, Routes.tracking_invoice_path(conn, :update, tracking_invoice),
          tracking_invoice: @invalid_attrs
        )

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete tracking_invoice" do
    setup [:create_tracking_invoice]

    test "deletes chosen tracking_invoice", %{conn: conn, tracking_invoice: tracking_invoice} do
      conn = delete(conn, Routes.tracking_invoice_path(conn, :delete, tracking_invoice))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.tracking_invoice_path(conn, :show, tracking_invoice))
      end
    end
  end

  defp create_tracking_invoice(_) do
    tracking_invoice = fixture(:tracking_invoice)
    %{tracking_invoice: tracking_invoice}
  end
end
