# gci.sh

gci = git commit with diff

[![asciicast](https://asciinema.org/a/104691.png)](https://asciinema.org/a/104691)

## How to work

`gci` will get the diff of the changes has been staged in your repository,
and save in a temporay file.  Then `gci` try to open the temporay file
with your editor. After you save the file again,
`gci` run `git commit`, and use the first line of the file as your commit message.

Please note that, you can change editor by environment variable `EDITOR`: `$ export EDITOR=vim`

## Quick Start

### Installation

#### Install with git

```
$ git clone https://github.com/shonenada/gci.sh /path/to/gci.sh
$ cd /path/to/gci.sh && make install
```

#### Install with curl

```
$ curl https://raw.githubusercontent.com/shonenada/gci.sh/master/gci.sh > /usr/local/bin/gci
$ chmod +x /usr/local/bin/gci
```

### Make commit with gci

##### 1. make changes in your repo

```
$ echo "Hello gci" >> README.md
```

##### 2. `add` them

```
$ git add README.md
```

##### 3. it's time to gci

```
$ gci
```

##### 4. enter your commit message

Enter commit message according to the diff show below and then save and quit.

If you need to make more changes and don't want to commit,
just keep the first line blank. `gci` will know you.
