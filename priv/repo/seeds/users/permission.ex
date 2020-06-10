alias Eshop.Repo
alias Eshop.Users.Permission

model_lists = ["Messenger", "Order", "Order Payment", "Shipment", "Tracking", "Product", "Service", "Company", "Shop", "Warehouse", "Activity", "Component", "User", "Setting", "Geo"] 
per_lists = ["Create", "View", "Update", "Delete", "Admin", "Super"] 

Enum.each(model_lists, fn(m) -> 
    Enum.each(per_lists, fn(p) -> 
        %Permission{
            name: m <> " " <> p, 
            slug: String.replace(String.downcase(m), " ", "_", global: true ) <> "_" <> String.replace(String.downcase(p), " ", "_", global: true ), 
        } |> Repo.insert! 
    end) 
end) 

