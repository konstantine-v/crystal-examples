# Info

This is just a repo for me to practice Crystal Lang. I've been practicing a bit of Ruby and decided to take a look into crystal and see performance as well as compatibility for a future project.

I also want to see how possible it is to take exsisting code (and subsequently projects) in Ruby and make it work in Crystal while being a cross-platform binary for MacOS and Linux. This would help me with some of my work in regards to some projects I'm currently on.

## Installation/Development

Run `shards install -v` and make sure the deps install correctly.

Make changes to modules/classes in the `src/testing` directory.

## Usage

Run the crystal files by using `crystal src/testing/<your-file>.cr`, read crystal docs in regards to compiling files as binaries and running them.

## Notes/Todos

- Having some trouble getting the fractal to render using the flags `-w=400 -h=320 --color=multi mandelbrot --scale=2 --def=200` on the binary. Going to read more documentation regarding syntax to see what errors I may have made.
- Working on making a simple, viable onyx server to use with exsisting projects