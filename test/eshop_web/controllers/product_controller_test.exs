defmodule EshopWeb.ProductControllerTest do
  use EshopWeb.ConnCase

  alias Eshop.Objects
  alias Eshop.Objects.Product

  @create_attrs %{
    barcode: "some barcode",
    exp_date: ~N[2010-04-17 14:00:00],
    mfg_date: ~N[2010-04-17 14:00:00],
    sku: "some sku"
  }
  @update_attrs %{
    barcode: "some updated barcode",
    exp_date: ~N[2011-05-18 15:01:01],
    mfg_date: ~N[2011-05-18 15:01:01],
    sku: "some updated sku"
  }
  @invalid_attrs %{barcode: nil, exp_date: nil, mfg_date: nil, sku: nil}

  def fixture(:product) do
    {:ok, product} = Objects.create_product(@create_attrs)
    product
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all products", %{conn: conn} do
      conn = get(conn, Routes.product_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create product" do
    test "renders product when data is valid", %{conn: conn} do
      conn = post(conn, Routes.product_path(conn, :create), product: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.product_path(conn, :show, id))

      assert %{
               "id" => id,
               "barcode" => "some barcode",
               "exp_date" => "2010-04-17T14:00:00",
               "mfg_date" => "2010-04-17T14:00:00",
               "sku" => "some sku"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.product_path(conn, :create), product: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update product" do
    setup [:create_product]

    test "renders product when data is valid", %{conn: conn, product: %Product{id: id} = product} do
      conn = put(conn, Routes.product_path(conn, :update, product), product: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.product_path(conn, :show, id))

      assert %{
               "id" => id,
               "barcode" => "some updated barcode",
               "exp_date" => "2011-05-18T15:01:01",
               "mfg_date" => "2011-05-18T15:01:01",
               "sku" => "some updated sku"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, product: product} do
      conn = put(conn, Routes.product_path(conn, :update, product), product: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete product" do
    setup [:create_product]

    test "deletes chosen product", %{conn: conn, product: product} do
      conn = delete(conn, Routes.product_path(conn, :delete, product))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.product_path(conn, :show, product))
      end
    end
  end

  defp create_product(_) do
    product = fixture(:product)
    %{product: product}
  end
end
