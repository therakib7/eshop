defmodule Eshop.Components.Faq do
  use Ecto.Schema
  import Ecto.Changeset

  schema "faqs" do
    field :content, :string
    field :native_content, :string
    field :native_question, :string
    field :question, :string
    belongs_to :item, Eshop.Objects.Item
    belongs_to :user, Eshop.Users.User

    timestamps()
  end

  @doc false
  def changeset(faq, attrs) do
    faq
    |> cast(attrs, [:question, :native_question, :content, :native_content])
    |> validate_required([:question, :native_question, :content, :native_content])
    |> validate_length(:content, min: 2, max: 1000)
    |> validate_length(:native_content, min: 2, max: 1000)
    |> validate_length(:question, min: 2, max: 500)
    |> validate_length(:native_question, min: 2, max: 500)
  end
end
