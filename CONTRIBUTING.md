## Development environment

Get the latest development version. Fork and clone the repo:

```cli
$ git clone git@github.com:<your-username>/helm-charts.git
```
Install [Helm](https://helm.sh/docs/intro/install/) and [Skaffold](https://skaffold.dev/docs/install/).

Install a local Kubernetes cluster:
- [Docker Desktop](https://docs.docker.com/desktop/kubernetes/) - recommended
- [Kind](https://kind.sigs.k8s.io/docs/user/configuration/) - it needs additional configuration 
   to expose ingress 👇
- K3d - not supported yet


### Kind cluster
Kind does not expose ports by default. To enable this, you need to create the cluster with
the following command:

```cli
$ kind create cluster --config kind-config.yaml
```

That's it. You should be ready to make changes, run tests, and make commits! 🎉

## Running skaffold
Run skaffold in the root of the repo:

```cli
$ skaffold dev
```
Wait for the deployment to finish. You can check the status of the deployment in console.
When it is ready, open the browser and go to http://localhost. You should see the Studio page.

> [!NOTE]
> Skaffold contains a configuration to install `ingress-nginx` for kind and
> docker-desktop. The profile will be used automatically when you run skaffold with the `dev` profile
> and the name of the current `kubeContext` matches `kind-*` or `docker-desktop`.

### Skaffold profile - `local`

If you want to run skaffold with `local` profile, you need to create `values-local-dev.yaml` file in
`charts/studio/values-local-dev.yaml`. The values should contain the overrides for the values of the
chart. 

To use the profile, run skaffold with following command:

```cli
$ skaffold dev -p local
```
