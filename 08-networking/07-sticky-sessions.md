# Networking

[_Back to overview_](README.md)

## Sticky Sessions

Sticky Sessions can be used to ensure that requests from one client are always routed to the same endpoint (pod).
This is usefully, for online-shop scenarios or online-wizards where you want to store a session on the server for one individual client.

You typically implement this by setting cookies to influence the load-balancers behaviour.

An example implementation can be found here:

https://github.com/DenisBiondic/RealTimeMicroservices/blob/master/BackendForFrontend/deployment.yaml
