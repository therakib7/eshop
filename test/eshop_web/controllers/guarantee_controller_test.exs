defmodule EshopWeb.GuaranteeControllerTest do
  use EshopWeb.ConnCase

  alias Eshop.Conditions
  alias Eshop.Conditions.Guarantee

  @create_attrs %{
    content: "some content",
    duration: 42,
    gurantee_type: 42,
    native_content: "some native_content"
  }
  @update_attrs %{
    content: "some updated content",
    duration: 43,
    gurantee_type: 43,
    native_content: "some updated native_content"
  }
  @invalid_attrs %{content: nil, duration: nil, gurantee_type: nil, native_content: nil}

  def fixture(:guarantee) do
    {:ok, guarantee} = Conditions.create_guarantee(@create_attrs)
    guarantee
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all guarantees", %{conn: conn} do
      conn = get(conn, Routes.guarantee_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create guarantee" do
    test "renders guarantee when data is valid", %{conn: conn} do
      conn = post(conn, Routes.guarantee_path(conn, :create), guarantee: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.guarantee_path(conn, :show, id))

      assert %{
               "id" => id,
               "content" => "some content",
               "duration" => 42,
               "gurantee_type" => 42,
               "native_content" => "some native_content"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.guarantee_path(conn, :create), guarantee: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update guarantee" do
    setup [:create_guarantee]

    test "renders guarantee when data is valid", %{
      conn: conn,
      guarantee: %Guarantee{id: id} = guarantee
    } do
      conn = put(conn, Routes.guarantee_path(conn, :update, guarantee), guarantee: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.guarantee_path(conn, :show, id))

      assert %{
               "id" => id,
               "content" => "some updated content",
               "duration" => 43,
               "gurantee_type" => 43,
               "native_content" => "some updated native_content"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, guarantee: guarantee} do
      conn = put(conn, Routes.guarantee_path(conn, :update, guarantee), guarantee: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete guarantee" do
    setup [:create_guarantee]

    test "deletes chosen guarantee", %{conn: conn, guarantee: guarantee} do
      conn = delete(conn, Routes.guarantee_path(conn, :delete, guarantee))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.guarantee_path(conn, :show, guarantee))
      end
    end
  end

  defp create_guarantee(_) do
    guarantee = fixture(:guarantee)
    %{guarantee: guarantee}
  end
end
