defmodule Eshop.Messengers.NotificationMsg do
  use Ecto.Schema
  import Ecto.Changeset

  schema "notification_msgs" do
    field :for, :integer
    field :msg, :string

    timestamps()
  end

  @doc false
  def changeset(notification_msg, attrs) do
    notification_msg
    |> cast(attrs, [:msg, :for])
    |> validate_required([:msg, :for])
    |> validate_length(:msg, min: 1, max: 5000)

  end
end
