defmodule EshopWeb.Schema.Types.Faq do
  use Absinthe.Schema.Notation
  
  object :faq do
    field :id, :integer
    field :content, :string
    field :native_content, :string
    field :native_question, :string
    field :question, :string
    field :item, :id
    field :user_id, :id
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end 
end
