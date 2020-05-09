defmodule Eshop.Activities.Rating do
  use Ecto.Schema
  import Ecto.Changeset

  schema "ratings" do
    field :comment, :string
    field :star, :integer
    field :type, :integer
    field :type_id, :integer
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(rating, attrs) do
    rating
    |> cast(attrs, [:type, :type_id, :comment, :star])
    |> validate_required([:type, :type_id, :comment, :star])
    |> validate_length(:comment, min: 4, max: 500)
    |> validate_inclusion(:star, 1..5)
  end
end
