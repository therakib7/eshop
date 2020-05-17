defmodule EshopWeb.TypeUserRoleControllerTest do
  use EshopWeb.ConnCase

  alias Eshop.Companies
  alias Eshop.Companies.TypeUserRole

  @create_attrs %{
    type: 42,
    type_id: 42
  }
  @update_attrs %{
    type: 43,
    type_id: 43
  }
  @invalid_attrs %{type: nil, type_id: nil}

  def fixture(:type_user_role) do
    {:ok, type_user_role} = Companies.create_type_user_role(@create_attrs)
    type_user_role
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all type_user_roles", %{conn: conn} do
      conn = get(conn, Routes.type_user_role_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create type_user_role" do
    test "renders type_user_role when data is valid", %{conn: conn} do
      conn = post(conn, Routes.type_user_role_path(conn, :create), type_user_role: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.type_user_role_path(conn, :show, id))

      assert %{
               "id" => id,
               "type" => 42,
               "type_id" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.type_user_role_path(conn, :create), type_user_role: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update type_user_role" do
    setup [:create_type_user_role]

    test "renders type_user_role when data is valid", %{
      conn: conn,
      type_user_role: %TypeUserRole{id: id} = type_user_role
    } do
      conn =
        put(conn, Routes.type_user_role_path(conn, :update, type_user_role),
          type_user_role: @update_attrs
        )

      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.type_user_role_path(conn, :show, id))

      assert %{
               "id" => id,
               "type" => 43,
               "type_id" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, type_user_role: type_user_role} do
      conn =
        put(conn, Routes.type_user_role_path(conn, :update, type_user_role),
          type_user_role: @invalid_attrs
        )

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete type_user_role" do
    setup [:create_type_user_role]

    test "deletes chosen type_user_role", %{conn: conn, type_user_role: type_user_role} do
      conn = delete(conn, Routes.type_user_role_path(conn, :delete, type_user_role))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.type_user_role_path(conn, :show, type_user_role))
      end
    end
  end

  defp create_type_user_role(_) do
    type_user_role = fixture(:type_user_role)
    %{type_user_role: type_user_role}
  end
end
