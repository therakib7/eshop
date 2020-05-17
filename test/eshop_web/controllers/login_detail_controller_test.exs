defmodule EshopWeb.LoginDetailControllerTest do
  use EshopWeb.ConnCase

  alias Eshop.Users
  alias Eshop.Users.LoginDetail

  @create_attrs %{
    ip_address: "some ip_address",
    ip_location: "some ip_location",
    is_active: true,
    last_activity: "2010-04-17T14:00:00Z",
    login_at: "2010-04-17T14:00:00Z",
    user_agent: "some user_agent"
  }
  @update_attrs %{
    ip_address: "some updated ip_address",
    ip_location: "some updated ip_location",
    is_active: false,
    last_activity: "2011-05-18T15:01:01Z",
    login_at: "2011-05-18T15:01:01Z",
    user_agent: "some updated user_agent"
  }
  @invalid_attrs %{
    ip_address: nil,
    ip_location: nil,
    is_active: nil,
    last_activity: nil,
    login_at: nil,
    user_agent: nil
  }

  def fixture(:login_detail) do
    {:ok, login_detail} = Users.create_login_detail(@create_attrs)
    login_detail
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all login_details", %{conn: conn} do
      conn = get(conn, Routes.login_detail_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create login_detail" do
    test "renders login_detail when data is valid", %{conn: conn} do
      conn = post(conn, Routes.login_detail_path(conn, :create), login_detail: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.login_detail_path(conn, :show, id))

      assert %{
               "id" => id,
               "ip_address" => "some ip_address",
               "ip_location" => "some ip_location",
               "is_active" => true,
               "last_activity" => "2010-04-17T14:00:00Z",
               "login_at" => "2010-04-17T14:00:00Z",
               "user_agent" => "some user_agent"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.login_detail_path(conn, :create), login_detail: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update login_detail" do
    setup [:create_login_detail]

    test "renders login_detail when data is valid", %{
      conn: conn,
      login_detail: %LoginDetail{id: id} = login_detail
    } do
      conn =
        put(conn, Routes.login_detail_path(conn, :update, login_detail),
          login_detail: @update_attrs
        )

      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.login_detail_path(conn, :show, id))

      assert %{
               "id" => id,
               "ip_address" => "some updated ip_address",
               "ip_location" => "some updated ip_location",
               "is_active" => false,
               "last_activity" => "2011-05-18T15:01:01Z",
               "login_at" => "2011-05-18T15:01:01Z",
               "user_agent" => "some updated user_agent"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, login_detail: login_detail} do
      conn =
        put(conn, Routes.login_detail_path(conn, :update, login_detail),
          login_detail: @invalid_attrs
        )

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete login_detail" do
    setup [:create_login_detail]

    test "deletes chosen login_detail", %{conn: conn, login_detail: login_detail} do
      conn = delete(conn, Routes.login_detail_path(conn, :delete, login_detail))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.login_detail_path(conn, :show, login_detail))
      end
    end
  end

  defp create_login_detail(_) do
    login_detail = fixture(:login_detail)
    %{login_detail: login_detail}
  end
end
