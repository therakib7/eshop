defmodule EshopWeb.RoleControllerTest do
  use EshopWeb.ConnCase

  alias Eshop.Users
  alias Eshop.Users.Role

  @create_attrs %{
    desc: "some desc",
    is_company: true,
    name: "some name",
    native_name: "some native_name"
  }
  @update_attrs %{
    desc: "some updated desc",
    is_company: false,
    name: "some updated name",
    native_name: "some updated native_name"
  }
  @invalid_attrs %{desc: nil, is_company: nil, name: nil, native_name: nil}

  def fixture(:role) do
    {:ok, role} = Users.create_role(@create_attrs)
    role
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all roles", %{conn: conn} do
      conn = get(conn, Routes.role_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create role" do
    test "renders role when data is valid", %{conn: conn} do
      conn = post(conn, Routes.role_path(conn, :create), role: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.role_path(conn, :show, id))

      assert %{
               "id" => id,
               "desc" => "some desc",
               "is_company" => true,
               "name" => "some name",
               "native_name" => "some native_name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.role_path(conn, :create), role: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update role" do
    setup [:create_role]

    test "renders role when data is valid", %{conn: conn, role: %Role{id: id} = role} do
      conn = put(conn, Routes.role_path(conn, :update, role), role: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.role_path(conn, :show, id))

      assert %{
               "id" => id,
               "desc" => "some updated desc",
               "is_company" => false,
               "name" => "some updated name",
               "native_name" => "some updated native_name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, role: role} do
      conn = put(conn, Routes.role_path(conn, :update, role), role: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete role" do
    setup [:create_role]

    test "deletes chosen role", %{conn: conn, role: role} do
      conn = delete(conn, Routes.role_path(conn, :delete, role))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.role_path(conn, :show, role))
      end
    end
  end

  defp create_role(_) do
    role = fixture(:role)
    %{role: role}
  end
end
