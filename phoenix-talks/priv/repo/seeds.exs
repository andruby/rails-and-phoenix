# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Talks.Repo.insert!(%Talks.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Talks.Repo
alias Talks.Talk

Repo.insert! %Talk{presenter: "Marin Jankovski", title: "How we package and distribute GitLab"}
Repo.insert! %Talk{presenter: "Anthony Meirlaen", title: "How we love messages queues @engagor"}
Repo.insert! %Talk{presenter: "Andrew Fecheyr", title: "Introduction to Elixir"}
Repo.insert! %Talk{presenter: "Bert Goethals", title: "RuleTables and RuleTrees"}

