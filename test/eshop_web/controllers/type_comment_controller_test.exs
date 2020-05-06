defmodule EshopWeb.TypeCommentControllerTest do
  use EshopWeb.ConnCase

  alias Eshop.Activities
  alias Eshop.Activities.TypeComment

  @create_attrs %{
    comment: "some comment",
    type: 42,
    type_id: 42
  }
  @update_attrs %{
    comment: "some updated comment",
    type: 43,
    type_id: 43
  }
  @invalid_attrs %{comment: nil, type: nil, type_id: nil}

  def fixture(:type_comment) do
    {:ok, type_comment} = Activities.create_type_comment(@create_attrs)
    type_comment
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all type_comments", %{conn: conn} do
      conn = get(conn, Routes.type_comment_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create type_comment" do
    test "renders type_comment when data is valid", %{conn: conn} do
      conn = post(conn, Routes.type_comment_path(conn, :create), type_comment: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.type_comment_path(conn, :show, id))

      assert %{
               "id" => id,
               "comment" => "some comment",
               "type" => 42,
               "type_id" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.type_comment_path(conn, :create), type_comment: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update type_comment" do
    setup [:create_type_comment]

    test "renders type_comment when data is valid", %{conn: conn, type_comment: %TypeComment{id: id} = type_comment} do
      conn = put(conn, Routes.type_comment_path(conn, :update, type_comment), type_comment: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.type_comment_path(conn, :show, id))

      assert %{
               "id" => id,
               "comment" => "some updated comment",
               "type" => 43,
               "type_id" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, type_comment: type_comment} do
      conn = put(conn, Routes.type_comment_path(conn, :update, type_comment), type_comment: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete type_comment" do
    setup [:create_type_comment]

    test "deletes chosen type_comment", %{conn: conn, type_comment: type_comment} do
      conn = delete(conn, Routes.type_comment_path(conn, :delete, type_comment))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.type_comment_path(conn, :show, type_comment))
      end
    end
  end

  defp create_type_comment(_) do
    type_comment = fixture(:type_comment)
    %{type_comment: type_comment}
  end
end
