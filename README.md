# Object-Oriented Design Class

## Setup

Clone this repository:

```bash
$ git glone https://github.com/torqueforge/careerbuilder-2014-march.git
```

Change directories so that you are in the project:

```bash
$ cd careerbuilder-2014-march
```

Install the dependencies:

```bash
$ gem install bundler # if you don't have it
$ bundle install
```

## Keeping track in Git

To see what git currently thinks is going on, say:

```bash
$ git status
```

To see which branches you have:

```bash
$ git branch
```

## Exercises

As the class progresses we will add exercises and solutions to
the master branch.

Each exercise is in its own subdirectory, and has its own README.

## Working on the exercises

Start on master.

```bash
$ git checkout master
```

If you want to save your work, create a branch from master. You can do this at
any time, either when you are starting new work, or right before you want to
commit.

```bash
$ git checkout -b my-new-branch
```

When you've gotten your test suite to pass.

You have to tell git which changes you want to commit. To tell git to save
everything:

```bash
$ git add .
```

Then commit the changes:

```bash
$ git commit -m "Explain your change here"
```

When you start working on a new section, switch back to master.

```bash
$ git checkout master
```

Then pull the latest changes from GitHub:

```bash
$ git pull
```

Then create a new branch.

Wash. Rinse. Repeat.

### Throw it all away?

You can throw all your code away like this:

First, make sure that git knows all about the files you have:

```bash
$ git add .
```

Then throw the changes away:

```bash
$ git reset --hard
```

### Did your master diverge?

Go ahead and create a new branch with all your changes:

```bash
$ git checkout -b my-backup-branch
```

Then go back to master:

```bash
$ git checkout master
```

Make sure you have the most recent changes from GitHub:

```bash
$ git fetch origin
```

Then tell git to create a new copy of master, throwing away the old one:

```bash
$ git reset --hard origin/master
```

## Resources

### Refactoring/OOP

* [Growing Object-Oriented Software, Guided by Tests](http://www.amazon.com/Growing-Object-Oriented-Software-Guided-Tests/dp/0321503627/) - Steve Freeman, Nat Pryce
* [Refactoring - From Good to Great](http://www.confreaks.com/videos/1233-aloharuby2012-refactoring-from-good-to-great) by [Ben Orenstein](https://twitter.com/r00k) (@r00k)
* [Source Making](http://sourcemaking.com/) - A website about code smells and the refactorings to address them

### Git

* [GitHug](https://github.com/Gazler/githug) - practical exercises to teach git
* [Git Immersion](http://gitimmersion.com/) - a guided tour with practice exercises
* [Try GitHub](http://try.github.io/) - interactive tutorial
* [Think Like a Git](http://think-like-a-git.net/) - explains the philosophy that will make it easier to think about git

### Ruby

* [Ruby Koans](http://rubykoans.com/) - test-driven guided tour of Ruby,
  particularly good for people who already program in other languages.

For all of the following, read the README where there is one. If something is
confusing, submit a GitHub issue in the relevant repository. The instructions
can probably be improved.

* [Fundamental Ruby](https://github.com/JumpstartLab/ruby-exercises) - exercises that use unit tests and error messages to teach the core and standard libraries
* [Enumerable Exercises](https://github.com/JumpstartLab/enums-exercises) - exercises for practicing using the (very rich!) enumerable methods in Ruby.
* [Unicorn, revisited](http://tutorials.jumpstartlab.com/topics/testing/intro-to-tdd.html) - intro to Ruby using TDD


## Surveys

* [End of Day 2 Survey](https://docs.google.com/forms/d/16an6GK-lzmVFgJkyizwHi6HyOgVWIan5KyBIUiZBpYo/viewform)
* [End of Day 3 Survey](https://docs.google.com/forms/d/1JUYCk9vIY-5damoZUS6GvrHeGuCa7Q_GcK_hnMp43tk/viewform)
