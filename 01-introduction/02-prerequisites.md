# Introduction

[_Back to overview_](README.md)

## Prerequisites

### Know-how

- Docker
- Kubernetes (basics, deployments, pods, namespaces, services)
- Stateless workloads (12 factor apps)
- Azure basics (azure portal, azure CLI)

### Tools to be installed

- The most current stable Docker version is installed (Currently 18.09.2)

### Prepare if you are behind a corporate proxy

- Install local proxy tools
  - https://github.com/genotrance/px (recommended)
  - https://www.telerik.com/fiddler
  - https://sourceforge.net/projects/cntlm/ (deprecated)

* Create a `corporate_certs` folder in the repositorys root-directory and copy the certificates there. If you want to use it behind a corporate proxy, it might be necessary to use the certificates of it.
