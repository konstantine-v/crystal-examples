[![Language](https://img.shields.io/badge/language-crystal-776791.svg)](https://github.com/crystal-lang/crystal)

# Info

This is just a repo for me to practice Crystal Lang. I've really liked working
with it on some personal projects and plan to keep using it and help create
tools and libraries with it.

If you dont want to clone the repo, you can easily play around with my `src/`
directory by copy and pasting in https://play.crystal-lang.cr/#/org. Please note
though that some of the projects may require shards, check to see if they
require anything before running.

## Installation/Development

Run `shards install -v` and make sure the deps install correctly.

Make changes to modules/classes in the `src/testing` directory.

## Usage

Run the crystal files by using `crystal run src/<your-file>.cr`

You can also compile the file you want by using `crystal build src/<your-file>
--release`. This will create a binary in the parent directory so you can run it
just like any other binary.
