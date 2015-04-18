# Wote

Simple Ruby on Rails app that was used to collect votes for 200 random websites given in [db/seeds/websites_picked_200.csv](db/seeds/websites_picked_200.csv) file.

It provides Facebook login, and after user is authenticated, it receives random websites (one by one) which can be either upvoted or downvoted. It's basically Tinder, but with website screenshots.

## Clone project

```bash
$ git clone git@bitbucket.org:peric/wote.git ~/dev/wote
```

## Install/Setup

```bash
$ bundle
$ rake db:create
$ rake db:migrate
$ rake db:seed
```

## Run

```bash
$ rails s
```
