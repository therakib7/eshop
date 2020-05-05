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
    |> cast(attrs, [:type, :type_id, :file_name, :resized_size, :orginal_size])
    |> validate_required([:type, :type_id, :file_name, :resized_size, :orginal_size])
  end
end
