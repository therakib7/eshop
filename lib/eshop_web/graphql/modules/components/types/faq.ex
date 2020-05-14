defmodule EshopWeb.Schema.Types.Faq do
  use Absinthe.Schema.Notation

  @desc "A faq"
  object :faq do
    field :id, :integer
    field :content, :string
    field :native_content, :string
    field :native_question, :string
    field :question, :string
    field :item_id, :integer
    field :user_id, :integer
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end

  @desc "A faq update"
  input_object :faq_params do 
    field :content, :string
    field :native_content, :string
    field :native_question, :string
    field :question, :string
    field :item_id, :integer
    field :user_id, :integer
  end
end