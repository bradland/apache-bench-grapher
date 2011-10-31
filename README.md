# Apache Bench Grapher #


### Usage ###

Put your Apache Bench output files in `data/` (must end in .tsv), then run `grapher.rb`. Graphs will be written to `graphs/`.

This utility expects Apache Bench files in the 'gnuplot' format. You can output this style of file by using the `-g` flag with `ab`.

Example `ab` command:

    ab -n 400 -c 10 -g apache-1.plot  "http://myawesomewebsite.com"

### Dependencies ###

All the heavy lifting here is done by gnuplot. I recommend installing with Homebrew. Tested with Ruby 1.9.2-p290. No gem dependencies.

----

© 2011 Brad Landers

You may use or redistribute this script however you like. You do not have to keep the copyright intact.