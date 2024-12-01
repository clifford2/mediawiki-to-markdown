MediaWiki to Markdown
=====================

Convert MediaWiki pages to GitHub flavored Markdown (or other formats supported by Pandoc). The conversion uses an XML export from MediaWiki and converts each wiki page to an individual markdown file. Directory structures will be preserved. The generated export can also include frontmatter for Github pages.

You may also be interested in a forked version of the original codebase, available at <https://github.com/outofcontrol/mediawiki-to-gfm>.

## Credit

This is a fork of Philip Ashlock's code at <https://github.com/philipashlock/mediawiki-to-markdown>.
Thanks for sharing Philip!

Differences from Philip's code (as of 2024-12-01):

- Replaced `each()` for PHP 8 support
- Made `mkdir()` recursive
- Added error handling for `pandoc` failure, and save the bad input data for debugging
- Added `Dockerfile`

## Requirements

* PHP
* Pandoc


## Export MediaWiki Pages

You'll export all your pages as a single XML file following these steps: http://en.wikipedia.org/wiki/Help:Export


## Installation

You can run this code in a container (Podman / Docker), or install it locally and run from there.

### Install Pandoc

<https://pandoc.org/installing.html>


### Get Composer

```sh
curl -sS https://getcomposer.org/installer | php
```


### Install Composer Packages

```sh
php composer.phar install
```

## Run

To run a local install of the code, use:

```sh
php convert.php --filename=<filename>.xml [extra-args]
```

To use the container image, try:

```sh
[podman|docker] run --rm -v $PWD:/data mediawiki-to-markdown --filename=<filename>.xml [extra-args]
```

For the examples below, let's assume a Linux shell, and create an alias, with one of these commands:

- `alias mwconvert='php convert.php'`
- `alias mwconvert='podman run --rm -v $PWD:/data mediawiki-to-markdown'`
- `alias mwconvert='docker run --rm -v $PWD:/data mediawiki-to-markdown'`

## Arguments

### `--filename`

The only required parameter is `filename` for the name of the xml file you exported from MediaWiki, eg: 

```sh
mwconvert --filename=mediawiki.xml
```

### `--output`

You can also use `output` to specify an output folder since each wiki page in the XML file will generate it's own separate markdown file.

```sh
mwconvert --filename=mediawiki.xml --output=export
```


### `--indexes`

You can set `indexes` as `true` if you want pages with the same name as a directory to be renamed as index.md and placed into their directory

```sh
mwconvert --filename=mediawiki.xml --output=export --indexes=true
```

### `--frontmatter`

You can specify whether you want frontmatter included. This is automatically set to `true` when the output format is `gfm`

```sh
mwconvert --filename=mediawiki.xml --output=export --format=markdown_phpextra --frontmatter=true
```

### `--format`

You can specify different output formats with `format`. The default is `gfm` (GitHub Flavored Markdown).

```sh
mwconvert --filename=mediawiki.xml --output=export --format=markdown_phpextra
```

Supported pandoc formats are: 

- `asciidoc`
- `beamer`
- `context`
- `docbook`
- `docx`
- `dokuwiki`
- `dzslides`
- `epub`
- `epub3`
- `fb2`
- `haddock`
- `html`
- `html5`
- `icml`
- `json`
- `latex`
- `man`
- `markdown`
- `gfm` / `markdown_github`
- `markdown_mmd`
- `markdown_phpextra`
- `markdown_strict`
- `mediawiki`
- `native`
- `odt`
- `opendocument`
- `opml`
- `org`
- `plain`
- `revealjs`
- `rst`
- `rtf`
- `s5`
- `slideous`
- `slidy`
- `texinfo`
- `textile`
