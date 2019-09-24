# Additional Tools

[_Back to overview_](README.md)

## Kubectl Plugins

kubectl can be extended by adding a custom executable named `kubectl-xyz` into the `$PATH`. kubectl will then delegate all call to `kubectl xyz` to the `kubectl-xyz` executable.

More information can be found here:

- [Bash Example](https://kubernetes.io/docs/tasks/extend-kubectl/kubectl-plugins/)
- [Golang Example](https://github.com/kubernetes/sample-cli-plugin)
