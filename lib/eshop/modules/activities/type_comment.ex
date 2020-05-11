defmodule Eshop.Activities.TypeComment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "type_comments" do
    field :comment, :string
    field :type, :integer
    field :type_id, :integer
    belongs_to :user, Eshop.Users.User

    timestamps()
  end

  @doc false
  def changeset(type_comment, attrs) do
    type_comment
    |> cast(attrs, [:type, :type_id, :comment])
    |> validate_required([:type, :type_id, :comment])
    |> validate_length(:comment, min: 4, max: 500)
  end
end
