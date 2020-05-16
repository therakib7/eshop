alias Eshop.Repo
alias Eshop.Users.Permission

model_lists = ["User", "Role", "Company"]
per_lists = ["create", "view", "update", "delete", "admin"]

Enum.each(model_lists, fn(m) -> 
    Enum.each(per_lists, fn(p) -> 
        %Permission{
            name: m <> " " <> p,
            slug: String.downcase(m) <> "_" <> p, 
        } |> Repo.insert! 
    end) 
end)


