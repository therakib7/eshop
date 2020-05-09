defmodule EshopWeb.UserControllerTest do
  use EshopWeb.ConnCase

  alias Eshop.Users
  alias Eshop.Users.User

  @create_attrs %{
    email: "some email",
    first_name: "some first_name",
    is_active: true,
    surname: "some surname",
    mobile: "some mobile",
    password_hash: "some password_hash",
    pin: 42,
    verified_email: "2010-04-17T14:00:00Z",
    verified_phone: "2010-04-17T14:00:00Z",
    verified_user: "2010-04-17T14:00:00Z"
  }
  @update_attrs %{
    email: "some updated email",
    first_name: "some updated first_name",
    is_active: false,
    surname: "some updated surname",
    mobile: "some updated mobile",
    password_hash: "some updated password_hash",
    pin: 43,
    verified_email: "2011-05-18T15:01:01Z",
    verified_phone: "2011-05-18T15:01:01Z",
    verified_user: "2011-05-18T15:01:01Z"
  }
  @invalid_attrs %{email: nil, first_name: nil, is_active: nil, surname: nil, mobile: nil, password_hash: nil, pin: nil, verified_email: nil, verified_phone: nil, verified_user: nil}

  def fixture(:user) do
    {:ok, user} = Users.create_user(@create_attrs)
    user
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all users", %{conn: conn} do
      conn = get(conn, Routes.user_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create user" do
    test "renders user when data is valid", %{conn: conn} do
      conn = post(conn, Routes.user_path(conn, :create), user: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.user_path(conn, :show, id))

      assert %{
               "id" => id,
               "email" => "some email",
               "first_name" => "some first_name",
               "is_active" => true,
               "surname" => "some surname",
               "mobile" => "some mobile",
               "password_hash" => "some password_hash",
               "pin" => 42,
               "verified_email" => "2010-04-17T14:00:00Z",
               "verified_phone" => "2010-04-17T14:00:00Z",
               "verified_user" => "2010-04-17T14:00:00Z"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.user_path(conn, :create), user: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update user" do
    setup [:create_user]

    test "renders user when data is valid", %{conn: conn, user: %User{id: id} = user} do
      conn = put(conn, Routes.user_path(conn, :update, user), user: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.user_path(conn, :show, id))

      assert %{
               "id" => id,
               "email" => "some updated email",
               "first_name" => "some updated first_name",
               "is_active" => false,
               "surname" => "some updated surname",
               "mobile" => "some updated mobile",
               "password_hash" => "some updated password_hash",
               "pin" => 43,
               "verified_email" => "2011-05-18T15:01:01Z",
               "verified_phone" => "2011-05-18T15:01:01Z",
               "verified_user" => "2011-05-18T15:01:01Z"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, user: user} do
      conn = put(conn, Routes.user_path(conn, :update, user), user: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete user" do
    setup [:create_user]

    test "deletes chosen user", %{conn: conn, user: user} do
      conn = delete(conn, Routes.user_path(conn, :delete, user))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.user_path(conn, :show, user))
      end
    end
  end

  defp create_user(_) do
    user = fixture(:user)
    %{user: user}
  end
end
