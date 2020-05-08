defmodule EshopWeb.Schema.Resolvers.Faq do

    def list_faqs(_parent, _args, _resolution) do
        {:ok, Eshop.Components.list_faqs()}
    end

    def create_faq(_parent, args, _resolution) do
        Eshop.Components.create_faq(args)
    end

end
