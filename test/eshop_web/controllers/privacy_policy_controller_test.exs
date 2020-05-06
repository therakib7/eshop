defmodule EshopWeb.PrivacyPolicyControllerTest do
  use EshopWeb.ConnCase

  alias Eshop.Conditions
  alias Eshop.Conditions.PrivacyPolicy

  @create_attrs %{
    content: "some content",
    native_content: "some native_content"
  }
  @update_attrs %{
    content: "some updated content",
    native_content: "some updated native_content"
  }
  @invalid_attrs %{content: nil, native_content: nil}

  def fixture(:privacy_policy) do
    {:ok, privacy_policy} = Conditions.create_privacy_policy(@create_attrs)
    privacy_policy
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all privacy_policies", %{conn: conn} do
      conn = get(conn, Routes.privacy_policy_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create privacy_policy" do
    test "renders privacy_policy when data is valid", %{conn: conn} do
      conn = post(conn, Routes.privacy_policy_path(conn, :create), privacy_policy: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.privacy_policy_path(conn, :show, id))

      assert %{
               "id" => id,
               "content" => "some content",
               "native_content" => "some native_content"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.privacy_policy_path(conn, :create), privacy_policy: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update privacy_policy" do
    setup [:create_privacy_policy]

    test "renders privacy_policy when data is valid", %{conn: conn, privacy_policy: %PrivacyPolicy{id: id} = privacy_policy} do
      conn = put(conn, Routes.privacy_policy_path(conn, :update, privacy_policy), privacy_policy: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.privacy_policy_path(conn, :show, id))

      assert %{
               "id" => id,
               "content" => "some updated content",
               "native_content" => "some updated native_content"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, privacy_policy: privacy_policy} do
      conn = put(conn, Routes.privacy_policy_path(conn, :update, privacy_policy), privacy_policy: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete privacy_policy" do
    setup [:create_privacy_policy]

    test "deletes chosen privacy_policy", %{conn: conn, privacy_policy: privacy_policy} do
      conn = delete(conn, Routes.privacy_policy_path(conn, :delete, privacy_policy))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.privacy_policy_path(conn, :show, privacy_policy))
      end
    end
  end

  defp create_privacy_policy(_) do
    privacy_policy = fixture(:privacy_policy)
    %{privacy_policy: privacy_policy}
  end
end
