defmodule EshopWeb.AttachmentControllerTest do
  use EshopWeb.ConnCase

  alias Eshop.Attachments
  alias Eshop.Attachments.Attachment

  @create_attrs %{
    file_name: "some file_name",
    name: "some name",
    orginal_size: "some orginal_size",
    resized_size: "some resized_size",
    type: 42,
    type_id: 42
  }
  @update_attrs %{
    file_name: "some updated file_name",
    name: "some updated name",
    orginal_size: "some updated orginal_size",
    resized_size: "some updated resized_size",
    type: 43,
    type_id: 43
  }
  @invalid_attrs %{file_name: nil, name: nil, orginal_size: nil, resized_size: nil, type: nil, type_id: nil}

  def fixture(:attachment) do
    {:ok, attachment} = Attachments.create_attachment(@create_attrs)
    attachment
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all attachments", %{conn: conn} do
      conn = get(conn, Routes.attachment_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create attachment" do
    test "renders attachment when data is valid", %{conn: conn} do
      conn = post(conn, Routes.attachment_path(conn, :create), attachment: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.attachment_path(conn, :show, id))

      assert %{
               "id" => id,
               "file_name" => "some file_name",
               "name" => "some name",
               "orginal_size" => "some orginal_size",
               "resized_size" => "some resized_size",
               "type" => 42,
               "type_id" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.attachment_path(conn, :create), attachment: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update attachment" do
    setup [:create_attachment]

    test "renders attachment when data is valid", %{conn: conn, attachment: %Attachment{id: id} = attachment} do
      conn = put(conn, Routes.attachment_path(conn, :update, attachment), attachment: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.attachment_path(conn, :show, id))

      assert %{
               "id" => id,
               "file_name" => "some updated file_name",
               "name" => "some updated name",
               "orginal_size" => "some updated orginal_size",
               "resized_size" => "some updated resized_size",
               "type" => 43,
               "type_id" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, attachment: attachment} do
      conn = put(conn, Routes.attachment_path(conn, :update, attachment), attachment: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete attachment" do
    setup [:create_attachment]

    test "deletes chosen attachment", %{conn: conn, attachment: attachment} do
      conn = delete(conn, Routes.attachment_path(conn, :delete, attachment))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.attachment_path(conn, :show, attachment))
      end
    end
  end

  defp create_attachment(_) do
    attachment = fixture(:attachment)
    %{attachment: attachment}
  end
end
