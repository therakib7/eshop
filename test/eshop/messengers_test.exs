defmodule Eshop.MessengersTest do
  use Eshop.DataCase

  alias Eshop.Messengers

  describe "chat_rooms" do
    alias Eshop.Messengers.ChatRoom

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def chat_room_fixture(attrs \\ %{}) do
      {:ok, chat_room} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Messengers.create_chat_room()

      chat_room
    end

    test "list_chat_rooms/0 returns all chat_rooms" do
      chat_room = chat_room_fixture()
      assert Messengers.list_chat_rooms() == [chat_room]
    end

    test "get_chat_room!/1 returns the chat_room with given id" do
      chat_room = chat_room_fixture()
      assert Messengers.get_chat_room!(chat_room.id) == chat_room
    end

    test "create_chat_room/1 with valid data creates a chat_room" do
      assert {:ok, %ChatRoom{} = chat_room} = Messengers.create_chat_room(@valid_attrs)
    end

    test "create_chat_room/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Messengers.create_chat_room(@invalid_attrs)
    end

    test "update_chat_room/2 with valid data updates the chat_room" do
      chat_room = chat_room_fixture()
      assert {:ok, %ChatRoom{} = chat_room} = Messengers.update_chat_room(chat_room, @update_attrs)
    end

    test "update_chat_room/2 with invalid data returns error changeset" do
      chat_room = chat_room_fixture()
      assert {:error, %Ecto.Changeset{}} = Messengers.update_chat_room(chat_room, @invalid_attrs)
      assert chat_room == Messengers.get_chat_room!(chat_room.id)
    end

    test "delete_chat_room/1 deletes the chat_room" do
      chat_room = chat_room_fixture()
      assert {:ok, %ChatRoom{}} = Messengers.delete_chat_room(chat_room)
      assert_raise Ecto.NoResultsError, fn -> Messengers.get_chat_room!(chat_room.id) end
    end

    test "change_chat_room/1 returns a chat_room changeset" do
      chat_room = chat_room_fixture()
      assert %Ecto.Changeset{} = Messengers.change_chat_room(chat_room)
    end
  end

  describe "chat_msgs" do
    alias Eshop.Messengers.ChatMsg

    @valid_attrs %{deleted_at: "2010-04-17T14:00:00Z", msg: "some msg", msg_type: 42, read: true}
    @update_attrs %{deleted_at: "2011-05-18T15:01:01Z", msg: "some updated msg", msg_type: 43, read: false}
    @invalid_attrs %{deleted_at: nil, msg: nil, msg_type: nil, read: nil}

    def chat_msg_fixture(attrs \\ %{}) do
      {:ok, chat_msg} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Messengers.create_chat_msg()

      chat_msg
    end

    test "list_chat_msgs/0 returns all chat_msgs" do
      chat_msg = chat_msg_fixture()
      assert Messengers.list_chat_msgs() == [chat_msg]
    end

    test "get_chat_msg!/1 returns the chat_msg with given id" do
      chat_msg = chat_msg_fixture()
      assert Messengers.get_chat_msg!(chat_msg.id) == chat_msg
    end

    test "create_chat_msg/1 with valid data creates a chat_msg" do
      assert {:ok, %ChatMsg{} = chat_msg} = Messengers.create_chat_msg(@valid_attrs)
      assert chat_msg.deleted_at == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert chat_msg.msg == "some msg"
      assert chat_msg.msg_type == 42
      assert chat_msg.read == true
    end

    test "create_chat_msg/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Messengers.create_chat_msg(@invalid_attrs)
    end

    test "update_chat_msg/2 with valid data updates the chat_msg" do
      chat_msg = chat_msg_fixture()
      assert {:ok, %ChatMsg{} = chat_msg} = Messengers.update_chat_msg(chat_msg, @update_attrs)
      assert chat_msg.deleted_at == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert chat_msg.msg == "some updated msg"
      assert chat_msg.msg_type == 43
      assert chat_msg.read == false
    end

    test "update_chat_msg/2 with invalid data returns error changeset" do
      chat_msg = chat_msg_fixture()
      assert {:error, %Ecto.Changeset{}} = Messengers.update_chat_msg(chat_msg, @invalid_attrs)
      assert chat_msg == Messengers.get_chat_msg!(chat_msg.id)
    end

    test "delete_chat_msg/1 deletes the chat_msg" do
      chat_msg = chat_msg_fixture()
      assert {:ok, %ChatMsg{}} = Messengers.delete_chat_msg(chat_msg)
      assert_raise Ecto.NoResultsError, fn -> Messengers.get_chat_msg!(chat_msg.id) end
    end

    test "change_chat_msg/1 returns a chat_msg changeset" do
      chat_msg = chat_msg_fixture()
      assert %Ecto.Changeset{} = Messengers.change_chat_msg(chat_msg)
    end
  end

  describe "notification_msgs" do
    alias Eshop.Messengers.NotificationMsg

    @valid_attrs %{for: 42, msg: "some msg"}
    @update_attrs %{for: 43, msg: "some updated msg"}
    @invalid_attrs %{for: nil, msg: nil}

    def notification_msg_fixture(attrs \\ %{}) do
      {:ok, notification_msg} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Messengers.create_notification_msg()

      notification_msg
    end

    test "list_notification_msgs/0 returns all notification_msgs" do
      notification_msg = notification_msg_fixture()
      assert Messengers.list_notification_msgs() == [notification_msg]
    end

    test "get_notification_msg!/1 returns the notification_msg with given id" do
      notification_msg = notification_msg_fixture()
      assert Messengers.get_notification_msg!(notification_msg.id) == notification_msg
    end

    test "create_notification_msg/1 with valid data creates a notification_msg" do
      assert {:ok, %NotificationMsg{} = notification_msg} = Messengers.create_notification_msg(@valid_attrs)
      assert notification_msg.for == 42
      assert notification_msg.msg == "some msg"
    end

    test "create_notification_msg/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Messengers.create_notification_msg(@invalid_attrs)
    end

    test "update_notification_msg/2 with valid data updates the notification_msg" do
      notification_msg = notification_msg_fixture()
      assert {:ok, %NotificationMsg{} = notification_msg} = Messengers.update_notification_msg(notification_msg, @update_attrs)
      assert notification_msg.for == 43
      assert notification_msg.msg == "some updated msg"
    end

    test "update_notification_msg/2 with invalid data returns error changeset" do
      notification_msg = notification_msg_fixture()
      assert {:error, %Ecto.Changeset{}} = Messengers.update_notification_msg(notification_msg, @invalid_attrs)
      assert notification_msg == Messengers.get_notification_msg!(notification_msg.id)
    end

    test "delete_notification_msg/1 deletes the notification_msg" do
      notification_msg = notification_msg_fixture()
      assert {:ok, %NotificationMsg{}} = Messengers.delete_notification_msg(notification_msg)
      assert_raise Ecto.NoResultsError, fn -> Messengers.get_notification_msg!(notification_msg.id) end
    end

    test "change_notification_msg/1 returns a notification_msg changeset" do
      notification_msg = notification_msg_fixture()
      assert %Ecto.Changeset{} = Messengers.change_notification_msg(notification_msg)
    end
  end

  describe "notifications" do
    alias Eshop.Messengers.Notification

    @valid_attrs %{notification_msg_id: 42, read: true, type: 42, type_id: 42}
    @update_attrs %{notification_msg_id: 43, read: false, type: 43, type_id: 43}
    @invalid_attrs %{notification_msg_id: nil, read: nil, type: nil, type_id: nil}

    def notification_fixture(attrs \\ %{}) do
      {:ok, notification} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Messengers.create_notification()

      notification
    end

    test "list_notifications/0 returns all notifications" do
      notification = notification_fixture()
      assert Messengers.list_notifications() == [notification]
    end

    test "get_notification!/1 returns the notification with given id" do
      notification = notification_fixture()
      assert Messengers.get_notification!(notification.id) == notification
    end

    test "create_notification/1 with valid data creates a notification" do
      assert {:ok, %Notification{} = notification} = Messengers.create_notification(@valid_attrs)
      assert notification.notification_msg_id == 42
      assert notification.read == true
      assert notification.type == 42
      assert notification.type_id == 42
    end

    test "create_notification/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Messengers.create_notification(@invalid_attrs)
    end

    test "update_notification/2 with valid data updates the notification" do
      notification = notification_fixture()
      assert {:ok, %Notification{} = notification} = Messengers.update_notification(notification, @update_attrs)
      assert notification.notification_msg_id == 43
      assert notification.read == false
      assert notification.type == 43
      assert notification.type_id == 43
    end

    test "update_notification/2 with invalid data returns error changeset" do
      notification = notification_fixture()
      assert {:error, %Ecto.Changeset{}} = Messengers.update_notification(notification, @invalid_attrs)
      assert notification == Messengers.get_notification!(notification.id)
    end

    test "delete_notification/1 deletes the notification" do
      notification = notification_fixture()
      assert {:ok, %Notification{}} = Messengers.delete_notification(notification)
      assert_raise Ecto.NoResultsError, fn -> Messengers.get_notification!(notification.id) end
    end

    test "change_notification/1 returns a notification changeset" do
      notification = notification_fixture()
      assert %Ecto.Changeset{} = Messengers.change_notification(notification)
    end
  end
end
