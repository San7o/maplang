# maplang

Maplang is a configuration language for *Nix systems. It provides a framework for
managing your system in a centralized fashion while being easily extensible for
any need. Its design goals are:

- **for a better developer experience**: keep all your important files and configurations
  in one central place. Define the current state of your system from a single source.

- **works anywhere**: the language transpiles to a shell script, making it portable
  and easy to extend the grammar and add new functionalities.

- **backup and reproduce**: you can define the state of the machine and reproduce it to
  any system, do version control and backup the most important files.

- **KISS**: simplicity is the key, we want to design a simple and intuitive framework
   that takes less than 5 minutes to be explained.

## Current state

This language is currently in early developement. As soon as it reaches a stable state,
It will be used in the [mapkg](https://github.com/San7o/mapkg.git) packet manager.


## Example syntax

```
# define a package
package
{
	name "neofetch",
	version "1.2.3",
	description "Check your system stats",
    dependencies [ "tar" "cmake" ],
	output "/usr",
	configs [ "/etc/neofetch" ],
	download
	{
	    wget ...
	},
	install
	{
	   ...
	},
	clean
	{
	   ...
	},
	remove
	{
	   rm ...
	},
}

# install packages
packages
[
    neofetch-1.2.3,
]

# set config files, the old ones will be backupped
config
[
	"boot/grub/grub.cfg" -> "/boot/grub/grub.cfg",
]
```


## Developement

To build this prooject you will need `bison` for parsing,
`lex` for lexing and `make` to build the project.


## License

This project uses the [MIT](./LICENSE) license.
