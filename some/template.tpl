package some

import (
	"fmt"
	"github.com/laher/someutils"
	"github.com/laher/uggo"
)

func init() {
	someutils.RegisterSome(func() someutils.SomeUtil { return New{{.NameUCF}}() })
}

// Some{{.NameUCF}} represents and performs a `{{.Name}}` invocation
type Some{{.NameUCF}} struct {
	// TODO: add members here
}

// Name() returns the name of the util
func ({{.Name}} *Some{{.NameUCF}}) Name() string {
	return "{{.Name}}"
}

// TODO: add validation here

// ParseFlags parses flags from a commandline []string
func ({{.Name}} *Some{{.NameUCF}}) ParseFlags(call []string, errWriter io.Writer) error {
	flagSet := uggo.NewFlagSetDefault("{{.Name}}", "[options] [args...]", someutils.VERSION)
	flagSet.SetOutput(errWriter)

	// TODO add flags here
	
	err := flagSet.Parse(call[1:])
	if err != nil {
		fmt.Fprintf(errWriter, "Flag error:  %v\n\n", err.Error())
		flagSet.Usage()
		return err
	}

	if flagSet.ProcessHelpOrVersion() {
		return nil
	}
	
	// TODO: validate and process flagSet.Args()
	return nil
}

// Exec actually performs the {{.Name}}
func ({{.Name}} *Some{{.NameUCF}}) Exec(pipes someutils.Pipes) error {
	//TODO do something here!
}

// Factory for *Some{{.NameUCF}}
func New{{.NameUCF}}() *Some{{.NameUCF}} {
	return new(Some{{.NameUCF}})
}

// Fluent factory for *Some{{.NameUCF}}
func {{.NameUCF}}(args ...string) *Some{{.NameUCF}} {
	{{.Name}} := New{{.NameUCF}}()
	{{.Name}}.Xxx = args
	return {{.Name}}
}

// CLI invocation for *Some{{.NameUCF}}
func {{.NameUCF}}Cli(call []string) error {
	{{.Name}} := New{{.NameUCF}}()
	pipes := someutils.StdPipes()
	err := {{.Name}}.ParseFlags(call, pipes.Err())
	if err != nil {
		return err
	}
	return {{.Name}}.Exec(pipes)
}
