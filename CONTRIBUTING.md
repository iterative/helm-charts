## Development environment

Get the latest development version. Fork and clone the repo:

```cli
$ git clone git@github.com:<your-username>/helm-charts.git
```
Install [Helm](https://helm.sh/docs/intro/install/) and [Skaffold](https://skaffold.dev/docs/install/).

Install your local Kubernetes cluster:
- [Docker Desktop](https://docs.docker.com/desktop/kubernetes/) - recommended
- [Kind](https://kind.sigs.k8s.io/docs/user/configuration/) - it needs additional configuration 
   to expose ingress 👇
- K3d - not supported yet


### Kind cluster
Kind cluster does not expose ports by default. To enable ingress, you need to create cluster with
following command:

```cli
$ kind create cluster --config kind-config.yaml
```

That's it. You should be ready to make changes, run tests, and make commits! If
you experience any problems, don't hesitate to ping us in our [chat](/chat).

## Running skaffold
Run skaffold in the root of the repo:

```cli
$ skaffold dev
```
Wait for the deployment to finish. You can check the status of the deployment in console.
When it is ready, open the browser and go to http://localhost. You should see the Studio page.

### Skaffold profile - `local`

If you want to run skaffold with `local` profile, you need to create `local-values.yaml` file in
`charts/studio/local-values.yaml`. The values should contain the overrides for the values of the
chart. 

To use the profile, run skaffold with following command:

```cli
$ skaffold dev -p local
```

Skaffold configuration contains also configuration to install `ingress-nginx` for kind cluster or 
docker-desktop. Both profiles will be used automatically when you run skaffold with `dev` profile, 
and the current `kubeContext` name will match `kind-*` or `docker-desktop`.
