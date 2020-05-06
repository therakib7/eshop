defmodule EshopWeb.FaqControllerTest do
  use EshopWeb.ConnCase

  alias Eshop.Components
  alias Eshop.Components.Faq

  @create_attrs %{
    content: "some content",
    native_content: "some native_content",
    native_question: "some native_question",
    question: "some question"
  }
  @update_attrs %{
    content: "some updated content",
    native_content: "some updated native_content",
    native_question: "some updated native_question",
    question: "some updated question"
  }
  @invalid_attrs %{content: nil, native_content: nil, native_question: nil, question: nil}

  def fixture(:faq) do
    {:ok, faq} = Components.create_faq(@create_attrs)
    faq
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all faqs", %{conn: conn} do
      conn = get(conn, Routes.faq_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create faq" do
    test "renders faq when data is valid", %{conn: conn} do
      conn = post(conn, Routes.faq_path(conn, :create), faq: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.faq_path(conn, :show, id))

      assert %{
               "id" => id,
               "content" => "some content",
               "native_content" => "some native_content",
               "native_question" => "some native_question",
               "question" => "some question"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.faq_path(conn, :create), faq: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update faq" do
    setup [:create_faq]

    test "renders faq when data is valid", %{conn: conn, faq: %Faq{id: id} = faq} do
      conn = put(conn, Routes.faq_path(conn, :update, faq), faq: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.faq_path(conn, :show, id))

      assert %{
               "id" => id,
               "content" => "some updated content",
               "native_content" => "some updated native_content",
               "native_question" => "some updated native_question",
               "question" => "some updated question"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, faq: faq} do
      conn = put(conn, Routes.faq_path(conn, :update, faq), faq: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete faq" do
    setup [:create_faq]

    test "deletes chosen faq", %{conn: conn, faq: faq} do
      conn = delete(conn, Routes.faq_path(conn, :delete, faq))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.faq_path(conn, :show, faq))
      end
    end
  end

  defp create_faq(_) do
    faq = fixture(:faq)
    %{faq: faq}
  end
end
