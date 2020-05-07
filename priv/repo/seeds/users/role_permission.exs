alias Eshop.Repo
alias Eshop.Users.Role

%Role{
  name: "Administrator",
  native_name: "প্রশাসক",
  slug: "administrator",
  desc: "Who can manage everything", 
  is_company: false 
} |> Repo.insert!
