defmodule Eshop.AttachmentsTest do
  use Eshop.DataCase

  alias Eshop.Attachments

  describe "attachments" do
    alias Eshop.Attachments.Attachment

    @valid_attrs %{file_name: "some file_name", name: "some name", orginal_size: "some orginal_size", resized_size: "some resized_size", type: 42, type_id: 42}
    @update_attrs %{file_name: "some updated file_name", name: "some updated name", orginal_size: "some updated orginal_size", resized_size: "some updated resized_size", type: 43, type_id: 43}
    @invalid_attrs %{file_name: nil, name: nil, orginal_size: nil, resized_size: nil, type: nil, type_id: nil}

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
      assert {:ok, %Attachment{} = attachment} = Attachments.update_attachment(attachment, @update_attrs)
      assert attachment.file_name == "some updated file_name"
      assert attachment.name == "some updated name"
      assert attachment.orginal_size == "some updated orginal_size"
      assert attachment.resized_size == "some updated resized_size"
      assert attachment.type == 43
      assert attachment.type_id == 43
    end

    test "update_attachment/2 with invalid data returns error changeset" do
      attachment = attachment_fixture()
      assert {:error, %Ecto.Changeset{}} = Attachments.update_attachment(attachment, @invalid_attrs)
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
end
