defmodule EshopWeb.TermConditionControllerTest do
  use EshopWeb.ConnCase

  alias Eshop.Conditions
  alias Eshop.Conditions.TermCondition

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

  def fixture(:term_condition) do
    {:ok, term_condition} = Conditions.create_term_condition(@create_attrs)
    term_condition
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all term_conditions", %{conn: conn} do
      conn = get(conn, Routes.term_condition_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create term_condition" do
    test "renders term_condition when data is valid", %{conn: conn} do
      conn = post(conn, Routes.term_condition_path(conn, :create), term_condition: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.term_condition_path(conn, :show, id))

      assert %{
               "id" => id,
               "content" => "some content",
               "native_content" => "some native_content",
               "type" => 42,
               "type_id" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.term_condition_path(conn, :create), term_condition: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update term_condition" do
    setup [:create_term_condition]

    test "renders term_condition when data is valid", %{
      conn: conn,
      term_condition: %TermCondition{id: id} = term_condition
    } do
      conn =
        put(conn, Routes.term_condition_path(conn, :update, term_condition),
          term_condition: @update_attrs
        )

      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.term_condition_path(conn, :show, id))

      assert %{
               "id" => id,
               "content" => "some updated content",
               "native_content" => "some updated native_content",
               "type" => 43,
               "type_id" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, term_condition: term_condition} do
      conn =
        put(conn, Routes.term_condition_path(conn, :update, term_condition),
          term_condition: @invalid_attrs
        )

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete term_condition" do
    setup [:create_term_condition]

    test "deletes chosen term_condition", %{conn: conn, term_condition: term_condition} do
      conn = delete(conn, Routes.term_condition_path(conn, :delete, term_condition))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.term_condition_path(conn, :show, term_condition))
      end
    end
  end

  defp create_term_condition(_) do
    term_condition = fixture(:term_condition)
    %{term_condition: term_condition}
  end
end
