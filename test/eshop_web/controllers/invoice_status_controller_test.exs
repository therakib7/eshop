defmodule EshopWeb.InvoiceStatusControllerTest do
  use EshopWeb.ConnCase

  alias Eshop.Components
  alias Eshop.Components.InvoiceStatus

  @create_attrs %{
    type: 42,
    type_id: 42
  }
  @update_attrs %{
    type: 43,
    type_id: 43
  }
  @invalid_attrs %{type: nil, type_id: nil}

  def fixture(:invoice_status) do
    {:ok, invoice_status} = Components.create_invoice_status(@create_attrs)
    invoice_status
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all invoice_statuses", %{conn: conn} do
      conn = get(conn, Routes.invoice_status_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create invoice_status" do
    test "renders invoice_status when data is valid", %{conn: conn} do
      conn = post(conn, Routes.invoice_status_path(conn, :create), invoice_status: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.invoice_status_path(conn, :show, id))

      assert %{
               "id" => id,
               "type" => 42,
               "type_id" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.invoice_status_path(conn, :create), invoice_status: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update invoice_status" do
    setup [:create_invoice_status]

    test "renders invoice_status when data is valid", %{conn: conn, invoice_status: %InvoiceStatus{id: id} = invoice_status} do
      conn = put(conn, Routes.invoice_status_path(conn, :update, invoice_status), invoice_status: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.invoice_status_path(conn, :show, id))

      assert %{
               "id" => id,
               "type" => 43,
               "type_id" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, invoice_status: invoice_status} do
      conn = put(conn, Routes.invoice_status_path(conn, :update, invoice_status), invoice_status: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete invoice_status" do
    setup [:create_invoice_status]

    test "deletes chosen invoice_status", %{conn: conn, invoice_status: invoice_status} do
      conn = delete(conn, Routes.invoice_status_path(conn, :delete, invoice_status))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.invoice_status_path(conn, :show, invoice_status))
      end
    end
  end

  defp create_invoice_status(_) do
    invoice_status = fixture(:invoice_status)
    %{invoice_status: invoice_status}
  end
end
