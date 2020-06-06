defmodule Eshop.Attachments.Gallery do
  use Ecto.Schema
  import Ecto.Changeset

  schema "galleries" do
    field :type, :integer
    field :type_id, :integer
    belongs_to :attachment, Eshop.Attachments.Attachment

    timestamps()
  end

  @doc false
  def changeset(gallery, attrs) do
    gallery
    |> cast(attrs, [:type, :type_id, :attachment_id])
    |> validate_required([:type, :type_id, :attachment_id])
  end
end
