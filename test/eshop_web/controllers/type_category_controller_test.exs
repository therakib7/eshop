defmodule EshopWeb.TypeCategoryControllerTest do
  use EshopWeb.ConnCase

  alias Eshop.Components
  alias Eshop.Components.TypeCategory

  @create_attrs %{
    type: 42,
    type_id: 42
  }
  @update_attrs %{
    type: 43,
    type_id: 43
  }
  @invalid_attrs %{type: nil, type_id: nil}

  def fixture(:type_category) do
    {:ok, type_category} = Components.create_type_category(@create_attrs)
    type_category
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all type_categories", %{conn: conn} do
      conn = get(conn, Routes.type_category_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create type_category" do
    test "renders type_category when data is valid", %{conn: conn} do
      conn = post(conn, Routes.type_category_path(conn, :create), type_category: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.type_category_path(conn, :show, id))

      assert %{
               "id" => id,
               "type" => 42,
               "type_id" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.type_category_path(conn, :create), type_category: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update type_category" do
    setup [:create_type_category]

    test "renders type_category when data is valid", %{conn: conn, type_category: %TypeCategory{id: id} = type_category} do
      conn = put(conn, Routes.type_category_path(conn, :update, type_category), type_category: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.type_category_path(conn, :show, id))

      assert %{
               "id" => id,
               "type" => 43,
               "type_id" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, type_category: type_category} do
      conn = put(conn, Routes.type_category_path(conn, :update, type_category), type_category: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete type_category" do
    setup [:create_type_category]

    test "deletes chosen type_category", %{conn: conn, type_category: type_category} do
      conn = delete(conn, Routes.type_category_path(conn, :delete, type_category))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.type_category_path(conn, :show, type_category))
      end
    end
  end

  defp create_type_category(_) do
    type_category = fixture(:type_category)
    %{type_category: type_category}
  end
end
