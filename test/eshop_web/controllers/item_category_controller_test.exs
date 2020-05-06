defmodule EshopWeb.ItemCategoryControllerTest do
  use EshopWeb.ConnCase

  alias Eshop.Components
  alias Eshop.Components.ItemCategory

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  def fixture(:item_category) do
    {:ok, item_category} = Components.create_item_category(@create_attrs)
    item_category
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all item_categories", %{conn: conn} do
      conn = get(conn, Routes.item_category_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create item_category" do
    test "renders item_category when data is valid", %{conn: conn} do
      conn = post(conn, Routes.item_category_path(conn, :create), item_category: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.item_category_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.item_category_path(conn, :create), item_category: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update item_category" do
    setup [:create_item_category]

    test "renders item_category when data is valid", %{conn: conn, item_category: %ItemCategory{id: id} = item_category} do
      conn = put(conn, Routes.item_category_path(conn, :update, item_category), item_category: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.item_category_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, item_category: item_category} do
      conn = put(conn, Routes.item_category_path(conn, :update, item_category), item_category: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete item_category" do
    setup [:create_item_category]

    test "deletes chosen item_category", %{conn: conn, item_category: item_category} do
      conn = delete(conn, Routes.item_category_path(conn, :delete, item_category))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.item_category_path(conn, :show, item_category))
      end
    end
  end

  defp create_item_category(_) do
    item_category = fixture(:item_category)
    %{item_category: item_category}
  end
end
