# Setup on OSX

To get RapidFTR running on your OSX Machine for development, you'll need to install the following:

### CouchDB
* Preferred method is to install the Native Mac App directly from "Apache CouchDB Website":http://couchdb.apache.org/

If you encounter the following error when installing couchdb through Homebrew:

```
Error: couchdb dependency icu4c was built with the following
C++ standard library: libc++ (from clang)

This is incompatible with the standard library being used
to build couchdb: libstdc++ (from llvm)

Please reinstall icu4c using a compatible compiler.
hint: Check https://github.com/Homebrew/homebrew/wiki/C++-Standard-Libraries
```

Try installing for Macports.

### [Optional] Newer libxml2
* Nokogiri, a dependency of webrat and cucumber, will complain about the version that comes with OSX.
* If you use Macports, run: `port install libxml2`
* If you use homebrew, run: `brew install libxml2`

### ImageMagick
* Macports: `port install imagemagick`
* Homebrew: `brew install imagemagick`

### XCode and Command Line Tools
* Install XCode
* From XCode -> Preferences, install Command Line Tools

### Git
* Git should be bundled with the command line tools
* If not, [See GitHub's advice](http://help.github.com/mac-git-installation/)

### Ruby 1.9.3 via RVM
* Follow [RVM install instructions](http://rvm.io/rvm/install/) to install RVM
* You need Apple GCC to compile Ruby:
** Homebrew: `brew install apple-gcc42`
* Install Ruby 1.9.3 by running the following command. The last `--patch railsexpress` will speed up Ruby a lot, but it is optional. You can safely omit the railsexpress patch if its not working in your machine.
```
CC=/usr/local/bin/gcc-4.2 rvm install 1.9.3-p392 --with-gcc=gcc-4.2 --patch railsexpress
(OR)
CC=/usr/local/bin/gcc-4.2 rvm install 1.9.3-p392 --with-gcc=gcc-4.2
```
* Clone the RapidFTR codebase:
```
git clone git://github.com/rapidftr/RapidFTR.git
(or clone your fork)
```
* Run: `rvm --create use 1.9.3-p392@rapidftr`
* Run: `bundle install`
* Follow [Initial Run](initial-run.md)
