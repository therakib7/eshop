defmodule EshopWeb.UserPermissionControllerTest do
  use EshopWeb.ConnCase

  alias Eshop.Users
  alias Eshop.Users.UserPermission

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:user_permission) do
    {:ok, user_permission} = Users.create_user_permission(@create_attrs)
    user_permission
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all user_permissions", %{conn: conn} do
      conn = get(conn, Routes.user_permission_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create user_permission" do
    test "renders user_permission when data is valid", %{conn: conn} do
      conn =
        post(conn, Routes.user_permission_path(conn, :create), user_permission: @create_attrs)

      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.user_permission_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn =
        post(conn, Routes.user_permission_path(conn, :create), user_permission: @invalid_attrs)

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update user_permission" do
    setup [:create_user_permission]

    test "renders user_permission when data is valid", %{
      conn: conn,
      user_permission: %UserPermission{id: id} = user_permission
    } do
      conn =
        put(conn, Routes.user_permission_path(conn, :update, user_permission),
          user_permission: @update_attrs
        )

      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.user_permission_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, user_permission: user_permission} do
      conn =
        put(conn, Routes.user_permission_path(conn, :update, user_permission),
          user_permission: @invalid_attrs
        )

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete user_permission" do
    setup [:create_user_permission]

    test "deletes chosen user_permission", %{conn: conn, user_permission: user_permission} do
      conn = delete(conn, Routes.user_permission_path(conn, :delete, user_permission))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.user_permission_path(conn, :show, user_permission))
      end
    end
  end

  defp create_user_permission(_) do
    user_permission = fixture(:user_permission)
    %{user_permission: user_permission}
  end
end
