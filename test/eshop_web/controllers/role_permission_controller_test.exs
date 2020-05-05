defmodule EshopWeb.RolePermissionControllerTest do
  use EshopWeb.ConnCase

  alias Eshop.Users
  alias Eshop.Users.RolePermission

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  def fixture(:role_permission) do
    {:ok, role_permission} = Users.create_role_permission(@create_attrs)
    role_permission
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all role_permissions", %{conn: conn} do
      conn = get(conn, Routes.role_permission_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create role_permission" do
    test "renders role_permission when data is valid", %{conn: conn} do
      conn = post(conn, Routes.role_permission_path(conn, :create), role_permission: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.role_permission_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.role_permission_path(conn, :create), role_permission: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update role_permission" do
    setup [:create_role_permission]

    test "renders role_permission when data is valid", %{conn: conn, role_permission: %RolePermission{id: id} = role_permission} do
      conn = put(conn, Routes.role_permission_path(conn, :update, role_permission), role_permission: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.role_permission_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, role_permission: role_permission} do
      conn = put(conn, Routes.role_permission_path(conn, :update, role_permission), role_permission: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete role_permission" do
    setup [:create_role_permission]

    test "deletes chosen role_permission", %{conn: conn, role_permission: role_permission} do
      conn = delete(conn, Routes.role_permission_path(conn, :delete, role_permission))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.role_permission_path(conn, :show, role_permission))
      end
    end
  end

  defp create_role_permission(_) do
    role_permission = fixture(:role_permission)
    %{role_permission: role_permission}
  end
end
