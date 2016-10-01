alias Blog.Repo
alias Blog.{Comment, User, Post}

alex = Repo.insert! %User{
    name: "Alex",
    reputation: 13
}

bender = Repo.insert! %User{
  name: "Bender",
  reputation: 42
}

molly = Repo.insert! %User{
  name: "Molly",
  reputation: 100
}

alex_post = Repo.insert! Ecto.build_assoc(alex, :posts, title: "Hello", body: "World", pinned: true)

{:ok, _} = Repo.insert %Comment{body: "First!", user_id: alex.id, post_id: alex_post.id}
