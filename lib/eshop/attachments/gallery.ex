defmodule Eshop.Attachments.Gallery do
  use Ecto.Schema
  import Ecto.Changeset

  schema "galleries" do
    field :type, :integer
    field :type_id, :integer
    field :attachment_id, :id

    timestamps()
  end

  @doc false
  def changeset(gallery, attrs) do
    gallery
    |> cast(attrs, [:type, :type_id])
    |> validate_required([:type, :type_id])
  end
end
