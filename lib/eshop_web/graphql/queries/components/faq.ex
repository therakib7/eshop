defmodule EshopWeb.Schema.Queries.Faq do 
  use Absinthe.Schema.Notation

  object :faq_queries do
    @desc "Get all faqs"
    field :faqs, list_of(:faq) do
      resolve &EshopWeb.Schema.Resolvers.Faq.list_faqs/3
    end
  end 
end
