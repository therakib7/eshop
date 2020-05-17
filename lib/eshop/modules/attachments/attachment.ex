defmodule Eshop.Attachments.Attachment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "attachments" do
    field :file_name, :string
    field :orginal_size, :string
    field :resized_size, :string
    field :type, :integer
    field :type_id, :integer

    timestamps()
  end

  @doc false
  def changeset(attachment, attrs) do
    attachment
    |> cast(attrs, [:type, :type_id, :file_name])
    |> validate_required([:type, :type_id, :file_name])
    |> validate_length(:file_name, min: 1, max: 200)
  end
end
