defmodule EshopWeb.UserLoveControllerTest do
  use EshopWeb.ConnCase

  alias Eshop.Activities
  alias Eshop.Activities.UserLove

  @create_attrs %{
    type: 42,
    type_id: 42
  }
  @update_attrs %{
    type: 43,
    type_id: 43
  }
  @invalid_attrs %{type: nil, type_id: nil}

  def fixture(:user_love) do
    {:ok, user_love} = Activities.create_user_love(@create_attrs)
    user_love
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all user_loves", %{conn: conn} do
      conn = get(conn, Routes.user_love_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create user_love" do
    test "renders user_love when data is valid", %{conn: conn} do
      conn = post(conn, Routes.user_love_path(conn, :create), user_love: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.user_love_path(conn, :show, id))

      assert %{
               "id" => id,
               "type" => 42,
               "type_id" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.user_love_path(conn, :create), user_love: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update user_love" do
    setup [:create_user_love]

    test "renders user_love when data is valid", %{
      conn: conn,
      user_love: %UserLove{id: id} = user_love
    } do
      conn = put(conn, Routes.user_love_path(conn, :update, user_love), user_love: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.user_love_path(conn, :show, id))

      assert %{
               "id" => id,
               "type" => 43,
               "type_id" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, user_love: user_love} do
      conn = put(conn, Routes.user_love_path(conn, :update, user_love), user_love: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete user_love" do
    setup [:create_user_love]

    test "deletes chosen user_love", %{conn: conn, user_love: user_love} do
      conn = delete(conn, Routes.user_love_path(conn, :delete, user_love))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.user_love_path(conn, :show, user_love))
      end
    end
  end

  defp create_user_love(_) do
    user_love = fixture(:user_love)
    %{user_love: user_love}
  end
end
