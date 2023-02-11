package main

import (
	"fmt"
	"os"

	"github.com/nuvolaris/someutils/some"
)

func main() {
	if len(os.Args) == 1 {
		fmt.Printf("no command\n")
		os.Exit(1)
	}
	name := os.Args[1]
	args := []string{}
	if len(os.Args) > 2 {
		args = os.Args[2:]
	}
	if some.IsBuiltin(name) {
		code, err := some.Run(name, args)
		if err != nil {
			fmt.Printf("%s\n", err)
		}
		os.Exit(code)
	} else {
		fmt.Printf("unknown %s\n", name)
		os.Exit(1)
	}
}
