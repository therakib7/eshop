defmodule EshopWeb.GalleryControllerTest do
  use EshopWeb.ConnCase

  alias Eshop.Attachments
  alias Eshop.Attachments.Gallery

  @create_attrs %{
    type: 42,
    type_id: 42
  }
  @update_attrs %{
    type: 43,
    type_id: 43
  }
  @invalid_attrs %{type: nil, type_id: nil}

  def fixture(:gallery) do
    {:ok, gallery} = Attachments.create_gallery(@create_attrs)
    gallery
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all galleries", %{conn: conn} do
      conn = get(conn, Routes.gallery_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create gallery" do
    test "renders gallery when data is valid", %{conn: conn} do
      conn = post(conn, Routes.gallery_path(conn, :create), gallery: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.gallery_path(conn, :show, id))

      assert %{
               "id" => id,
               "type" => 42,
               "type_id" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.gallery_path(conn, :create), gallery: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update gallery" do
    setup [:create_gallery]

    test "renders gallery when data is valid", %{conn: conn, gallery: %Gallery{id: id} = gallery} do
      conn = put(conn, Routes.gallery_path(conn, :update, gallery), gallery: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.gallery_path(conn, :show, id))

      assert %{
               "id" => id,
               "type" => 43,
               "type_id" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, gallery: gallery} do
      conn = put(conn, Routes.gallery_path(conn, :update, gallery), gallery: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete gallery" do
    setup [:create_gallery]

    test "deletes chosen gallery", %{conn: conn, gallery: gallery} do
      conn = delete(conn, Routes.gallery_path(conn, :delete, gallery))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.gallery_path(conn, :show, gallery))
      end
    end
  end

  defp create_gallery(_) do
    gallery = fixture(:gallery)
    %{gallery: gallery}
  end
end
