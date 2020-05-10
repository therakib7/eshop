defmodule Eshop.Messengers do
  @moduledoc """
  The Messengers context.
  """

  import Ecto.Query, warn: false
  alias Eshop.Repo

  alias Eshop.Messengers.ChatRoom

  @doc """
  Returns the list of chat_rooms.

  ## Examples

      iex> list_chat_rooms()
      [%ChatRoom{}, ...]

  """
  def list_chat_rooms do
    Repo.all(ChatRoom)
  end

  @doc """
  Gets a single chat_room.

  Raises `Ecto.NoResultsError` if the Chat room does not exist.

  ## Examples

      iex> get_chat_room!(123)
      %ChatRoom{}

      iex> get_chat_room!(456)
      ** (Ecto.NoResultsError)

  """
  def get_chat_room!(id), do: Repo.get!(ChatRoom, id)

  @doc """
  Creates a chat_room.

  ## Examples

      iex> create_chat_room(%{field: value})
      {:ok, %ChatRoom{}}

      iex> create_chat_room(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_chat_room(attrs \\ %{}) do
    %ChatRoom{}
    |> ChatRoom.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a chat_room.

  ## Examples

      iex> update_chat_room(chat_room, %{field: new_value})
      {:ok, %ChatRoom{}}

      iex> update_chat_room(chat_room, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_chat_room(%ChatRoom{} = chat_room, attrs) do
    chat_room
    |> ChatRoom.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a chat_room.

  ## Examples

      iex> delete_chat_room(chat_room)
      {:ok, %ChatRoom{}}

      iex> delete_chat_room(chat_room)
      {:error, %Ecto.Changeset{}}

  """
  def delete_chat_room(%ChatRoom{} = chat_room) do
    Repo.delete(chat_room)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking chat_room changes.

  ## Examples

      iex> change_chat_room(chat_room)
      %Ecto.Changeset{data: %ChatRoom{}}

  """
  def change_chat_room(%ChatRoom{} = chat_room, attrs \\ %{}) do
    ChatRoom.changeset(chat_room, attrs)
  end

  alias Eshop.Messengers.ChatMsg

  @doc """
  Returns the list of chat_msgs.

  ## Examples

      iex> list_chat_msgs()
      [%ChatMsg{}, ...]

  """
  def list_chat_msgs do
    Repo.all(ChatMsg)
  end

  @doc """
  Gets a single chat_msg.

  Raises `Ecto.NoResultsError` if the Chat msg does not exist.

  ## Examples

      iex> get_chat_msg!(123)
      %ChatMsg{}

      iex> get_chat_msg!(456)
      ** (Ecto.NoResultsError)

  """
  def get_chat_msg!(id), do: Repo.get!(ChatMsg, id)

  @doc """
  Creates a chat_msg.

  ## Examples

      iex> create_chat_msg(%{field: value})
      {:ok, %ChatMsg{}}

      iex> create_chat_msg(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_chat_msg(attrs \\ %{}) do
    %ChatMsg{}
    |> ChatMsg.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a chat_msg.

  ## Examples

      iex> update_chat_msg(chat_msg, %{field: new_value})
      {:ok, %ChatMsg{}}

      iex> update_chat_msg(chat_msg, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_chat_msg(%ChatMsg{} = chat_msg, attrs) do
    chat_msg
    |> ChatMsg.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a chat_msg.

  ## Examples

      iex> delete_chat_msg(chat_msg)
      {:ok, %ChatMsg{}}

      iex> delete_chat_msg(chat_msg)
      {:error, %Ecto.Changeset{}}

  """
  def delete_chat_msg(%ChatMsg{} = chat_msg) do
    Repo.delete(chat_msg)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking chat_msg changes.

  ## Examples

      iex> change_chat_msg(chat_msg)
      %Ecto.Changeset{data: %ChatMsg{}}

  """
  def change_chat_msg(%ChatMsg{} = chat_msg, attrs \\ %{}) do
    ChatMsg.changeset(chat_msg, attrs)
  end

  alias Eshop.Messengers.NotificationMsg

  @doc """
  Returns the list of notification_msgs.

  ## Examples

      iex> list_notification_msgs()
      [%NotificationMsg{}, ...]

  """
  def list_notification_msgs do
    Repo.all(NotificationMsg)
  end

  @doc """
  Gets a single notification_msg.

  Raises `Ecto.NoResultsError` if the Notification msg does not exist.

  ## Examples

      iex> get_notification_msg!(123)
      %NotificationMsg{}

      iex> get_notification_msg!(456)
      ** (Ecto.NoResultsError)

  """
  def get_notification_msg!(id), do: Repo.get!(NotificationMsg, id)

  @doc """
  Creates a notification_msg.

  ## Examples

      iex> create_notification_msg(%{field: value})
      {:ok, %NotificationMsg{}}

      iex> create_notification_msg(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_notification_msg(attrs \\ %{}) do
    %NotificationMsg{}
    |> NotificationMsg.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a notification_msg.

  ## Examples

      iex> update_notification_msg(notification_msg, %{field: new_value})
      {:ok, %NotificationMsg{}}

      iex> update_notification_msg(notification_msg, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_notification_msg(%NotificationMsg{} = notification_msg, attrs) do
    notification_msg
    |> NotificationMsg.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a notification_msg.

  ## Examples

      iex> delete_notification_msg(notification_msg)
      {:ok, %NotificationMsg{}}

      iex> delete_notification_msg(notification_msg)
      {:error, %Ecto.Changeset{}}

  """
  def delete_notification_msg(%NotificationMsg{} = notification_msg) do
    Repo.delete(notification_msg)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking notification_msg changes.

  ## Examples

      iex> change_notification_msg(notification_msg)
      %Ecto.Changeset{data: %NotificationMsg{}}

  """
  def change_notification_msg(%NotificationMsg{} = notification_msg, attrs \\ %{}) do
    NotificationMsg.changeset(notification_msg, attrs)
  end

  alias Eshop.Messengers.Notification

  @doc """
  Returns the list of notifications.

  ## Examples

      iex> list_notifications()
      [%Notification{}, ...]

  """
  def list_notifications do
    Repo.all(Notification)
  end

  @doc """
  Gets a single notification.

  Raises `Ecto.NoResultsError` if the Notification does not exist.

  ## Examples

      iex> get_notification!(123)
      %Notification{}

      iex> get_notification!(456)
      ** (Ecto.NoResultsError)

  """
  def get_notification!(id), do: Repo.get!(Notification, id)

  @doc """
  Creates a notification.

  ## Examples

      iex> create_notification(%{field: value})
      {:ok, %Notification{}}

      iex> create_notification(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_notification(attrs \\ %{}) do
    %Notification{}
    |> Notification.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a notification.

  ## Examples

      iex> update_notification(notification, %{field: new_value})
      {:ok, %Notification{}}

      iex> update_notification(notification, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_notification(%Notification{} = notification, attrs) do
    notification
    |> Notification.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a notification.

  ## Examples

      iex> delete_notification(notification)
      {:ok, %Notification{}}

      iex> delete_notification(notification)
      {:error, %Ecto.Changeset{}}

  """
  def delete_notification(%Notification{} = notification) do
    Repo.delete(notification)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking notification changes.

  ## Examples

      iex> change_notification(notification)
      %Ecto.Changeset{data: %Notification{}}

  """
  def change_notification(%Notification{} = notification, attrs \\ %{}) do
    Notification.changeset(notification, attrs)
  end
end
