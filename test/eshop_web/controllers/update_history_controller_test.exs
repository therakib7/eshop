defmodule EshopWeb.UpdateHistoryControllerTest do
  use EshopWeb.ConnCase

  alias Eshop.Users
  alias Eshop.Users.UpdateHistory

  @create_attrs %{
    created_at: "2010-04-17T14:00:00Z",
    key: "some key",
    new_value: "some new_value",
    old_value: "some old_value",
    type: 42,
    type_id: 42
  }
  @update_attrs %{
    created_at: "2011-05-18T15:01:01Z",
    key: "some updated key",
    new_value: "some updated new_value",
    old_value: "some updated old_value",
    type: 43,
    type_id: 43
  }
  @invalid_attrs %{created_at: nil, key: nil, new_value: nil, old_value: nil, type: nil, type_id: nil}

  def fixture(:update_history) do
    {:ok, update_history} = Users.create_update_history(@create_attrs)
    update_history
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all update_histories", %{conn: conn} do
      conn = get(conn, Routes.update_history_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create update_history" do
    test "renders update_history when data is valid", %{conn: conn} do
      conn = post(conn, Routes.update_history_path(conn, :create), update_history: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.update_history_path(conn, :show, id))

      assert %{
               "id" => id,
               "created_at" => "2010-04-17T14:00:00Z",
               "key" => "some key",
               "new_value" => "some new_value",
               "old_value" => "some old_value",
               "type" => 42,
               "type_id" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.update_history_path(conn, :create), update_history: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update update_history" do
    setup [:create_update_history]

    test "renders update_history when data is valid", %{conn: conn, update_history: %UpdateHistory{id: id} = update_history} do
      conn = put(conn, Routes.update_history_path(conn, :update, update_history), update_history: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.update_history_path(conn, :show, id))

      assert %{
               "id" => id,
               "created_at" => "2011-05-18T15:01:01Z",
               "key" => "some updated key",
               "new_value" => "some updated new_value",
               "old_value" => "some updated old_value",
               "type" => 43,
               "type_id" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, update_history: update_history} do
      conn = put(conn, Routes.update_history_path(conn, :update, update_history), update_history: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete update_history" do
    setup [:create_update_history]

    test "deletes chosen update_history", %{conn: conn, update_history: update_history} do
      conn = delete(conn, Routes.update_history_path(conn, :delete, update_history))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.update_history_path(conn, :show, update_history))
      end
    end
  end

  defp create_update_history(_) do
    update_history = fixture(:update_history)
    %{update_history: update_history}
  end
end
