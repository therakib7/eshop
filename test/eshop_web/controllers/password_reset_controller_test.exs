defmodule EshopWeb.PasswordResetControllerTest do
  use EshopWeb.ConnCase

  alias Eshop.Users
  alias Eshop.Users.PasswordReset

  @create_attrs %{
    created_at: "2010-04-17T14:00:00Z",
    token: "some token"
  }
  @update_attrs %{
    created_at: "2011-05-18T15:01:01Z",
    token: "some updated token"
  }
  @invalid_attrs %{created_at: nil, token: nil}

  def fixture(:password_reset) do
    {:ok, password_reset} = Users.create_password_reset(@create_attrs)
    password_reset
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all password_resets", %{conn: conn} do
      conn = get(conn, Routes.password_reset_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create password_reset" do
    test "renders password_reset when data is valid", %{conn: conn} do
      conn = post(conn, Routes.password_reset_path(conn, :create), password_reset: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.password_reset_path(conn, :show, id))

      assert %{
               "id" => id,
               "created_at" => "2010-04-17T14:00:00Z",
               "token" => "some token"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.password_reset_path(conn, :create), password_reset: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update password_reset" do
    setup [:create_password_reset]

    test "renders password_reset when data is valid", %{conn: conn, password_reset: %PasswordReset{id: id} = password_reset} do
      conn = put(conn, Routes.password_reset_path(conn, :update, password_reset), password_reset: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.password_reset_path(conn, :show, id))

      assert %{
               "id" => id,
               "created_at" => "2011-05-18T15:01:01Z",
               "token" => "some updated token"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, password_reset: password_reset} do
      conn = put(conn, Routes.password_reset_path(conn, :update, password_reset), password_reset: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete password_reset" do
    setup [:create_password_reset]

    test "deletes chosen password_reset", %{conn: conn, password_reset: password_reset} do
      conn = delete(conn, Routes.password_reset_path(conn, :delete, password_reset))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.password_reset_path(conn, :show, password_reset))
      end
    end
  end

  defp create_password_reset(_) do
    password_reset = fixture(:password_reset)
    %{password_reset: password_reset}
  end
end
