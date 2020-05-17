defmodule EshopWeb.UserProfileControllerTest do
  use EshopWeb.ConnCase

  alias Eshop.Users
  alias Eshop.Users.UserProfile

  @create_attrs %{
    date_of_birth: "2010-04-17T14:00:00Z",
    gender: 42,
    lat: 120.5,
    long: 120.5,
    merital_status: 42
  }
  @update_attrs %{
    date_of_birth: "2011-05-18T15:01:01Z",
    gender: 43,
    lat: 456.7,
    long: 456.7,
    merital_status: 43
  }
  @invalid_attrs %{date_of_birth: nil, gender: nil, lat: nil, long: nil, merital_status: nil}

  def fixture(:user_profile) do
    {:ok, user_profile} = Users.create_user_profile(@create_attrs)
    user_profile
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all user_profiles", %{conn: conn} do
      conn = get(conn, Routes.user_profile_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create user_profile" do
    test "renders user_profile when data is valid", %{conn: conn} do
      conn = post(conn, Routes.user_profile_path(conn, :create), user_profile: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.user_profile_path(conn, :show, id))

      assert %{
               "id" => id,
               "date_of_birth" => "2010-04-17T14:00:00Z",
               "gender" => 42,
               "lat" => 120.5,
               "long" => 120.5,
               "merital_status" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.user_profile_path(conn, :create), user_profile: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update user_profile" do
    setup [:create_user_profile]

    test "renders user_profile when data is valid", %{
      conn: conn,
      user_profile: %UserProfile{id: id} = user_profile
    } do
      conn =
        put(conn, Routes.user_profile_path(conn, :update, user_profile),
          user_profile: @update_attrs
        )

      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.user_profile_path(conn, :show, id))

      assert %{
               "id" => id,
               "date_of_birth" => "2011-05-18T15:01:01Z",
               "gender" => 43,
               "lat" => 456.7,
               "long" => 456.7,
               "merital_status" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, user_profile: user_profile} do
      conn =
        put(conn, Routes.user_profile_path(conn, :update, user_profile),
          user_profile: @invalid_attrs
        )

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete user_profile" do
    setup [:create_user_profile]

    test "deletes chosen user_profile", %{conn: conn, user_profile: user_profile} do
      conn = delete(conn, Routes.user_profile_path(conn, :delete, user_profile))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.user_profile_path(conn, :show, user_profile))
      end
    end
  end

  defp create_user_profile(_) do
    user_profile = fixture(:user_profile)
    %{user_profile: user_profile}
  end
end
