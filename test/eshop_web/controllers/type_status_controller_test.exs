defmodule EshopWeb.TypeStatusControllerTest do
  use EshopWeb.ConnCase

  alias Eshop.Components
  alias Eshop.Components.TypeStatus

  @create_attrs %{
    is_active: true,
    name: "some name",
    native_name: "some native_name",
    order: 42,
    type: 42
  }
  @update_attrs %{
    is_active: false,
    name: "some updated name",
    native_name: "some updated native_name",
    order: 43,
    type: 43
  }
  @invalid_attrs %{is_active: nil, name: nil, native_name: nil, order: nil, type: nil}

  def fixture(:type_status) do
    {:ok, type_status} = Components.create_type_status(@create_attrs)
    type_status
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all type_statuses", %{conn: conn} do
      conn = get(conn, Routes.type_status_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create type_status" do
    test "renders type_status when data is valid", %{conn: conn} do
      conn = post(conn, Routes.type_status_path(conn, :create), type_status: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.type_status_path(conn, :show, id))

      assert %{
               "id" => id,
               "is_active" => true,
               "name" => "some name",
               "native_name" => "some native_name",
               "order" => 42,
               "type" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.type_status_path(conn, :create), type_status: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update type_status" do
    setup [:create_type_status]

    test "renders type_status when data is valid", %{
      conn: conn,
      type_status: %TypeStatus{id: id} = type_status
    } do
      conn =
        put(conn, Routes.type_status_path(conn, :update, type_status), type_status: @update_attrs)

      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.type_status_path(conn, :show, id))

      assert %{
               "id" => id,
               "is_active" => false,
               "name" => "some updated name",
               "native_name" => "some updated native_name",
               "order" => 43,
               "type" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, type_status: type_status} do
      conn =
        put(conn, Routes.type_status_path(conn, :update, type_status), type_status: @invalid_attrs)

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete type_status" do
    setup [:create_type_status]

    test "deletes chosen type_status", %{conn: conn, type_status: type_status} do
      conn = delete(conn, Routes.type_status_path(conn, :delete, type_status))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.type_status_path(conn, :show, type_status))
      end
    end
  end

  defp create_type_status(_) do
    type_status = fixture(:type_status)
    %{type_status: type_status}
  end
end
