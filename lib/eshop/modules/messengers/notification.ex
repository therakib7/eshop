defmodule Eshop.Messengers.Notification do
  use Ecto.Schema
  import Ecto.Changeset

  schema "notifications" do
    belongs_to :notification_msg, Eshop.Messengers.NotificationMsg
    field :read, :boolean, default: false
    field :type, :integer
    field :type_id, :integer

    timestamps()
  end

  @doc false
  def changeset(notification, attrs) do
    notification
    |> cast(attrs, [:type, :type_id, :notification_msg_id, :read])
    |> validate_required([:type, :type_id, :notification_msg_id, :read])
  end
end
