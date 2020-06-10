alias Eshop.Repo
alias Eshop.Users.Role

%Role{
  name: "Super Admin",
  native_name: "প্রশাসক",

  slug: "super_admin",
  desc: "Who can manage everything super", 
  type: 1 
} |> Repo.insert!


%Role{
  name: "Company Admin",
  native_name: "প্রশাসক",
  slug: "com_admin",
  desc: "Who can manage everything company", 
  type: 2 
} |> Repo.insert!

%Role{
  name: "Shop Admin",
  native_name: "প্রশাসক",
  slug: "shop_admin",
  desc: "Who can manage everything company", 
  type: 3
} |> Repo.insert!