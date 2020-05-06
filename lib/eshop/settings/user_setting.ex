defmodule Eshop.Settings.UserSetting do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user_settings" do
    field :key, :string
    field :value, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(user_setting, attrs) do
    user_setting
    |> cast(attrs, [:key, :value])
    |> validate_required([:key, :value])
  end
end
