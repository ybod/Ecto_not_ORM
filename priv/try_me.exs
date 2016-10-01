alias Blog.Repo
alias Blog.{Comment, User, Post}
import Ecto.Query, only: [from: 2]

# Fetching single record

user_query = Ecto.Query.first(User)
user = Repo.one(user_query)
IO.inspect(user)

another_user_query =
  from u in User,
  order_by: [asc: u.id],
  limit: 1
#IO.inspect(user_query)
#IO.inspect(another_user_query)


# Changesets
valid_changeset = Post.changeset(%Post{}, %{title: "Correct", body: "Post", user_id: user.id})
{:ok, _} = Repo.insert(valid_changeset)
#IO.inspect(valid_changeset)


invalid_changeset = Post.changeset(%Post{}, %{title: "Incorrect", body: 123})
{:error, err_changeset} = Repo.insert(invalid_changeset)
false = invalid_changeset.valid?
#IO.inspect err_changeset


# Fetching all records
all_users = Repo.all(User)
#IO.inspect(all_users)

# Fetch a single record based on ID
singe_user = Repo.get(User, user.id)
#IO.inspect(singe_user)

# Fetch a single record based on a specific attribute
alex = Repo.get_by(User, name: "Alex")
#IO.inspect(alex)

# Complex queries
low_rep =
  from u in User,
  where: u.reputation < 30,
  preload: [:posts],
  select: u

alex_with_posts = Repo.all(low_rep)
#IO.inspect alex_with_posts

# Composing Ecto queries
alex_post_q =
  from p in Post,
  where: p.user_id == ^alex.id

pinned_post_q =
  from ap in alex_post_q,
  where: ap.pinned == true

pinned_post = Repo.all(pinned_post_q)
#IO.inspect(pinned_post)

# Updating records
alex_changeset = Ecto.Changeset.change(alex, reputation: 144)
{:ok, new_alex} = Repo.update(alex_changeset)
#IO.inspect(new_alex)

# Deleting records
molly = Repo.get_by(User, name: "Molly")
{:ok, _deleted_rec} = Repo.delete(molly)
#IO.inspect Repo.get_by(User, name: "Molly")
