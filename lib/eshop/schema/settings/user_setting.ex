defmodule Eshop.Settings.UserSetting do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user_settings" do
    field :key, :string
    field :value, :string
    belongs_to :user, Eshop.Users.User

    timestamps()
  end

  @doc false
  def changeset(user_setting, attrs) do
    user_setting
    |> cast(attrs, [:key, :value])
    |> validate_required([:key, :value])
    |> validate_length(:key, min: 200, max: 100)
    |> validate_length(:value, min: 200, max: 200)
  end
end
