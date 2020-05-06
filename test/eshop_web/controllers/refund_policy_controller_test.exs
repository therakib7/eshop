defmodule EshopWeb.RefundPolicyControllerTest do
  use EshopWeb.ConnCase

  alias Eshop.Conditions
  alias Eshop.Conditions.RefundPolicy

  @create_attrs %{
    content: "some content",
    native_content: "some native_content",
    type: 42,
    type_id: 42
  }
  @update_attrs %{
    content: "some updated content",
    native_content: "some updated native_content",
    type: 43,
    type_id: 43
  }
  @invalid_attrs %{content: nil, native_content: nil, type: nil, type_id: nil}

  def fixture(:refund_policy) do
    {:ok, refund_policy} = Conditions.create_refund_policy(@create_attrs)
    refund_policy
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all refund_policies", %{conn: conn} do
      conn = get(conn, Routes.refund_policy_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create refund_policy" do
    test "renders refund_policy when data is valid", %{conn: conn} do
      conn = post(conn, Routes.refund_policy_path(conn, :create), refund_policy: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.refund_policy_path(conn, :show, id))

      assert %{
               "id" => id,
               "content" => "some content",
               "native_content" => "some native_content",
               "type" => 42,
               "type_id" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.refund_policy_path(conn, :create), refund_policy: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update refund_policy" do
    setup [:create_refund_policy]

    test "renders refund_policy when data is valid", %{conn: conn, refund_policy: %RefundPolicy{id: id} = refund_policy} do
      conn = put(conn, Routes.refund_policy_path(conn, :update, refund_policy), refund_policy: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.refund_policy_path(conn, :show, id))

      assert %{
               "id" => id,
               "content" => "some updated content",
               "native_content" => "some updated native_content",
               "type" => 43,
               "type_id" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, refund_policy: refund_policy} do
      conn = put(conn, Routes.refund_policy_path(conn, :update, refund_policy), refund_policy: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete refund_policy" do
    setup [:create_refund_policy]

    test "deletes chosen refund_policy", %{conn: conn, refund_policy: refund_policy} do
      conn = delete(conn, Routes.refund_policy_path(conn, :delete, refund_policy))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.refund_policy_path(conn, :show, refund_policy))
      end
    end
  end

  defp create_refund_policy(_) do
    refund_policy = fixture(:refund_policy)
    %{refund_policy: refund_policy}
  end
end
