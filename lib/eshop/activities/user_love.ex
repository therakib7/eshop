defmodule Eshop.Activities.UserLove do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user_loves" do
    field :type, :integer
    field :type_id, :integer
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(user_love, attrs) do
    user_love
    |> cast(attrs, [:type, :type_id])
    |> validate_required([:type, :type_id])
  end
end
