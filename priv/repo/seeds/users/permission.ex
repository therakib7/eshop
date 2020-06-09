alias Eshop.Repo
alias Eshop.Users.Permission
# model_lists = ["User", "Product"]
model_lists = ["Product"]
per_lists = ["create", "view", "update", "delete", "com_admin", "super_admin"]

Enum.each(model_lists, fn(m) -> 
    Enum.each(per_lists, fn(p) -> 
        %Permission{
            name: m <> " " <> p,
            slug: String.downcase(m) <> "_" <> p, 
        } |> Repo.insert! 
    end) 
end) 
