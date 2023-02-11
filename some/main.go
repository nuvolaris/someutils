package some

import (
	"fmt"

	"github.com/nuvolaris/someutils"
)

func IsBuiltin(name string) bool {
	switch name {
	case "basename", "cat", "cp", "dirname",
		"grep", "gunzip", "gzip", "head",
		"ls", "mv", "pwd", "rm", "sleep",
		"tail", "tar", "tee", "touch", "tr",
		"unzip", "wc", "which", "zip":
		return true
	}
	return false
}

func Run(name string, args []string) (int, error) {
	if !IsBuiltin(name) {
		return 1, fmt.Errorf("command %s not found", name)
	}
	full := append([]string{name}, args...)
	err, code := someutils.Call(name, full)
	return code, err
}
