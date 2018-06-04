# Zombie

Bring your variables back from the dead!

Zombie allows you to persist your variables from one iex session to the next.
You need to call `Zombie.bury` before you close an iex session and then call
`Zombie.resurrect` in the next iex session to load the saved variables into
a module called `Zombie.Vars`. Including the following lines in your `.iex.exs`
will automatically resurrect your variables and make them accessible on a module
called `Z`

## Sample usage
First iex session

```elixir
user = %{name: "Mujju"}
require Zombie
Zombie.bury
# close iex session
```

Second iex session
```
require Zombie
Zombie.resurrect

Zombie.Vars.user
# =>  %{name: "Mujju"}
```

## Installation

Install by adding `zombie` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:zombie, "~> 0.1.0"}
  ]
end
```
