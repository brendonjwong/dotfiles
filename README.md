# dotfiles

Your dotfiles are how you personalize your system. These are mine.

## Topical

Everything's built around topic areas. If you're adding a new area to your
forked dotfiles — say, "Java" — you can simply add a `java` directory and put
files in there. Anything with an extension of `.zsh` will get automatically
included into your shell. Anything with an extension of `.symlink` will get
symlinked without extension into `$HOME` when you run `script/bootstrap`.

## Components

There's a few special files in the hierarchy.

- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made
  available everywhere.
- **Brewfile**: This is a list of applications for 
  [Homebrew Cask](https://caskroom.github.io) to install: things like Chrome
  and Java and Clojure and stuff.
- **topic/\*.zsh**: Any files ending in `.zsh` get loaded into your
  environment.
- **topic/path.zsh**: Any file named `path.zsh` is loaded first and is
  expected to setup `$PATH` or similar.
- **topic/completion.zsh**: Any file named `completion.zsh` is loaded
  last and is expected to setup autocomplete.
- **topic/install.sh**: Any file named `install.sh` is executed when you run
  `script/install`. To avoid being loaded automatically, its extension is
  `.sh`, not `.zsh`.
- **topic/\*.symlink**: Any file ending in `*.symlink` gets symlinked into
  your `$HOME`. This is so you can keep all of those versioned in your dotfiles
  but still keep those autoloaded files in your home directory. These get
  symlinked in when you run `script/bootstrap`.

## Install

Run this:

```sh
# Download the dotfiles repo
curl -LOk https://github.com/brendonjwong/dotfiles/archive/master.zip
unzip master.zip
mv dotfiles-master dotfiles
cd dotfiles

# Run the installation
script/bootstrap

# Connect the local directory to remote repo (now that git is installed)
git init
git remote add origin git@github.com:brendonjwong/dotfiles.git
git clean -fd
git pull origin master
git branch --set-upstream-to=origin/master master
```

This will symlink the appropriate files in `dotfiles` to your home directory.

`dot` is a simple script that installs some dependencies, sets sane macOS
defaults, and so on. Tweak this script, and occasionally run `dot` from
time to time to keep your environment fresh and up-to-date. You can find
this script in `bin/`.

## Credit

I forked [Zach Holman](https://github.com/holman/dotfiles)'s dotfiles. Thank you for providing the basis for my own customization/configuration.

test
