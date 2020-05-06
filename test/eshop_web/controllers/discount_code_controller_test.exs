defmodule EshopWeb.DiscountCodeControllerTest do
  use EshopWeb.ConnCase

  alias Eshop.Components
  alias Eshop.Components.DiscountCode

  @create_attrs %{
    amount: 42,
    code: "some code",
    created_at: "2010-04-17T14:00:00Z",
    is_active: true,
    used_at: "2010-04-17T14:00:00Z",
    validity: 42
  }
  @update_attrs %{
    amount: 43,
    code: "some updated code",
    created_at: "2011-05-18T15:01:01Z",
    is_active: false,
    used_at: "2011-05-18T15:01:01Z",
    validity: 43
  }
  @invalid_attrs %{amount: nil, code: nil, created_at: nil, is_active: nil, used_at: nil, validity: nil}

  def fixture(:discount_code) do
    {:ok, discount_code} = Components.create_discount_code(@create_attrs)
    discount_code
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all discount_codes", %{conn: conn} do
      conn = get(conn, Routes.discount_code_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create discount_code" do
    test "renders discount_code when data is valid", %{conn: conn} do
      conn = post(conn, Routes.discount_code_path(conn, :create), discount_code: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.discount_code_path(conn, :show, id))

      assert %{
               "id" => id,
               "amount" => 42,
               "code" => "some code",
               "created_at" => "2010-04-17T14:00:00Z",
               "is_active" => true,
               "used_at" => "2010-04-17T14:00:00Z",
               "validity" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.discount_code_path(conn, :create), discount_code: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update discount_code" do
    setup [:create_discount_code]

    test "renders discount_code when data is valid", %{conn: conn, discount_code: %DiscountCode{id: id} = discount_code} do
      conn = put(conn, Routes.discount_code_path(conn, :update, discount_code), discount_code: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.discount_code_path(conn, :show, id))

      assert %{
               "id" => id,
               "amount" => 43,
               "code" => "some updated code",
               "created_at" => "2011-05-18T15:01:01Z",
               "is_active" => false,
               "used_at" => "2011-05-18T15:01:01Z",
               "validity" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, discount_code: discount_code} do
      conn = put(conn, Routes.discount_code_path(conn, :update, discount_code), discount_code: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete discount_code" do
    setup [:create_discount_code]

    test "deletes chosen discount_code", %{conn: conn, discount_code: discount_code} do
      conn = delete(conn, Routes.discount_code_path(conn, :delete, discount_code))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.discount_code_path(conn, :show, discount_code))
      end
    end
  end

  defp create_discount_code(_) do
    discount_code = fixture(:discount_code)
    %{discount_code: discount_code}
  end
end
