# Base Image - debian-tarql

debian-tarql is a base image that has openjdk java, bash, python 3, the AWS CLI and TARQL on board.

It is based on the image [debian-openjdk-python3-awscli](../debian-openjdk-python3-awscli/README.md).


### TARQL Info

See [http://tarql.github.io/](http://tarql.github.io/) for the full documentation.

`tarql [options] query.sparql [table.csv [...]]`

#### Main arguments

- `query.sparql`

  File containing a SPARQL query to be applied to an input file

- `table.csv`

  CSV/TSV file to be processed; can be omitted if specified in FROM clause

#### Input options

- `--stdin`

  Read input from STDIN instead of file

- `-d` or `--delimiter`

  Delimiting character of the input file

- `-t` or `--tabs`

  Specifies that the input is tab-separated (TSV)

- `--quotechar`

  Quote character used in the input file, or "none"

- `-p` or `--escapechar`

  Character used to escape quotes in the input file, or "none"

- `-e` or `--encoding`

  Override input file encoding (e.g., utf-8 or latin-1)

- `-H` or `--no-header-row`

  Input file has no header row; use variable names ?a, ?b, ...

- `--header-row`

  Input file's first row is a header with variable names (default)

- `--base`

  Base IRI for resolving relative IRIs

#### Output options

- `--test`

  Show CONSTRUCT template and first rows only (for query debugging)

- `--write-base`

  Write @base if output is Turtle

- `--ntriples`

  Write N-Triples instead of Turtle

- `--dedup`

  Window size in which to remove duplicate triples

#### General

- `-v` or `--verbose`

  Verbose

- `-q` or `--quiet`

  Run with minimal output

- `--debug`

  Output information for debugging

- `--help`

- `--version`

  Version information

