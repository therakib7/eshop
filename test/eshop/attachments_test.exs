defmodule Eshop.AttachmentsTest do
  use Eshop.DataCase

  alias Eshop.Attachments

  describe "attachments" do
    alias Eshop.Attachments.Attachment

    @valid_attrs %{
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
    @invalid_attrs %{
      file_name: nil,
      name: nil,
      orginal_size: nil,
      resized_size: nil,
      type: nil,
      type_id: nil
    }

    def attachment_fixture(attrs \\ %{}) do
      {:ok, attachment} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Attachments.create_attachment()

      attachment
    end

    test "list_attachments/0 returns all attachments" do
      attachment = attachment_fixture()
      assert Attachments.list_attachments() == [attachment]
    end

    test "get_attachment!/1 returns the attachment with given id" do
      attachment = attachment_fixture()
      assert Attachments.get_attachment!(attachment.id) == attachment
    end

    test "create_attachment/1 with valid data creates a attachment" do
      assert {:ok, %Attachment{} = attachment} = Attachments.create_attachment(@valid_attrs)
      assert attachment.file_name == "some file_name"
      assert attachment.name == "some name"
      assert attachment.orginal_size == "some orginal_size"
      assert attachment.resized_size == "some resized_size"
      assert attachment.type == 42
      assert attachment.type_id == 42
    end

    test "create_attachment/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Attachments.create_attachment(@invalid_attrs)
    end

    test "update_attachment/2 with valid data updates the attachment" do
      attachment = attachment_fixture()

      assert {:ok, %Attachment{} = attachment} =
               Attachments.update_attachment(attachment, @update_attrs)

      assert attachment.file_name == "some updated file_name"
      assert attachment.name == "some updated name"
      assert attachment.orginal_size == "some updated orginal_size"
      assert attachment.resized_size == "some updated resized_size"
      assert attachment.type == 43
      assert attachment.type_id == 43
    end

    test "update_attachment/2 with invalid data returns error changeset" do
      attachment = attachment_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Attachments.update_attachment(attachment, @invalid_attrs)

      assert attachment == Attachments.get_attachment!(attachment.id)
    end

    test "delete_attachment/1 deletes the attachment" do
      attachment = attachment_fixture()
      assert {:ok, %Attachment{}} = Attachments.delete_attachment(attachment)
      assert_raise Ecto.NoResultsError, fn -> Attachments.get_attachment!(attachment.id) end
    end

    test "change_attachment/1 returns a attachment changeset" do
      attachment = attachment_fixture()
      assert %Ecto.Changeset{} = Attachments.change_attachment(attachment)
    end
  end

  describe "galleries" do
    alias Eshop.Attachments.Gallery

    @valid_attrs %{type: 42, type_id: 42}
    @update_attrs %{type: 43, type_id: 43}
    @invalid_attrs %{type: nil, type_id: nil}

    def gallery_fixture(attrs \\ %{}) do
      {:ok, gallery} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Attachments.create_gallery()

      gallery
    end

    test "list_galleries/0 returns all galleries" do
      gallery = gallery_fixture()
      assert Attachments.list_galleries() == [gallery]
    end

    test "get_gallery!/1 returns the gallery with given id" do
      gallery = gallery_fixture()
      assert Attachments.get_gallery!(gallery.id) == gallery
    end

    test "create_gallery/1 with valid data creates a gallery" do
      assert {:ok, %Gallery{} = gallery} = Attachments.create_gallery(@valid_attrs)
      assert gallery.type == 42
      assert gallery.type_id == 42
    end

    test "create_gallery/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Attachments.create_gallery(@invalid_attrs)
    end

    test "update_gallery/2 with valid data updates the gallery" do
      gallery = gallery_fixture()
      assert {:ok, %Gallery{} = gallery} = Attachments.update_gallery(gallery, @update_attrs)
      assert gallery.type == 43
      assert gallery.type_id == 43
    end

    test "update_gallery/2 with invalid data returns error changeset" do
      gallery = gallery_fixture()
      assert {:error, %Ecto.Changeset{}} = Attachments.update_gallery(gallery, @invalid_attrs)
      assert gallery == Attachments.get_gallery!(gallery.id)
    end

    test "delete_gallery/1 deletes the gallery" do
      gallery = gallery_fixture()
      assert {:ok, %Gallery{}} = Attachments.delete_gallery(gallery)
      assert_raise Ecto.NoResultsError, fn -> Attachments.get_gallery!(gallery.id) end
    end

    test "change_gallery/1 returns a gallery changeset" do
      gallery = gallery_fixture()
      assert %Ecto.Changeset{} = Attachments.change_gallery(gallery)
    end
  end
end
