[![Language](https://img.shields.io/badge/language-crystal-776791.svg)](https://github.com/crystal-lang/crystal)

# Info

This is just a repo for me to practice Crystal Lang. I've been practicing a bit of Ruby and decided to take a look into crystal and see performance as well as compatibility for a future project.

I also want to see how possible it is to take exsisting code (and subsequently projects) in Ruby and make it work in Crystal while being a cross-platform binary for MacOS and Linux. This would help me with some of my work in regards to some projects I'm currently on.

If you dont want to clone the repo, you can easily play around with my `src/` directory by copy and pasting in https://play.crystal-lang.org/#/cr

## Installation/Development

Run `shards install -v` and make sure the deps install correctly.

Make changes to modules/classes in the `src/testing` directory.

## Usage

Run the crystal files by using `crystal src/testing/<your-file>.cr`, read crystal docs in regards to compiling files as binaries and running them.

## Notes/Todos

- Included quote generator using SQLite3 db. After I finish the initial design, I'll break out into it's own repo and alllw for others to be able to use it realistically, even if it is just a quote generator.
- Working on making a simple, viable onyx server to use with existing projects
- Moved Fractal and BMI-CLI to their own main repos