## Studio Helm Chart

## Installation

## Pre-installation steps


### Create namespace

We'll install Studio and related components in a dedicated `studio` namespace. 
Let's create it now:
```bash
$ kubectl create namespace studio
```

> Note: If you want to install Studio in any other namespace, modify the
> `--namespace` flag in the commands below accordingly


### Create a Docker registry secret

Configure Credentials for pulling images from our private registry:

```bash
$ kubectl create secret docker-registry iterativeai \
    --namespace studio \
    --docker-server=docker.iterative.ai \
    --docker-username=<username> \
    --docker-password=<password>
```

### Prepare a TLS secret

It is desired to enable Studio access via the `https` protocol
(as opposed to `http`). This requires setting up
a TLS secret for access (whether self-signed or "real").
First, we'll need to obtain a TLS/SSL certificate
and then, load it into a kubernetes secret in the namespace studio
will be installed in.
To create an SSL cert, you will need to know the domain (FQDN) that Studio
will be accessible from (e.g. `studio.iterative.ai` for the official SaaS
installation). 

> **Note**: We will now go over generating TLS cert with the `openssl` command.
> If you already have a TLS certificate available, skip ahead to loading the
> crt/key files into the kubernetes secret

As an example, we'll assume your Studio installation will be available
via: `https://my-studio.private.com`. We'll also use a self-signed
certificate for the sake of simplicity. Of course, for a production
installation we recommend using a certificate signed by a trusted CA.

Let's create a self-signed SSL cert using `openssl` (you may need to install it):
```bash
openssl req \
  -x509 -newkey rsa:4096 -sha256 -nodes \
  -keyout tls.key -out tls.crt \
  -subj "/CN=my-studio.private.com" \
  -addext "subjectAltName = DNS:my-studio.private.com" \
  -days 365
```

This will create the files `tls.crt` & `tls.key` in your current dir.

Now, let's create a TLS secret containing the contents from this cert:

```bash
kubectl create secret tls studio-ingress-tls \
  --namespace studio \
  --cert=tls.crt \
  --key=tls.key
```

We will refer to this secret in the below installation instructions.

### Install Studio

Now, we are ready to deploy Studio using the Helm chart.

Add the iterative Helm repository:
```bash
$ helm repo add iterative https://helm.iterative.ai
```

### Minimal Installation:

To install studio with all default values (for sanity, testing), 
Run the following command:
```bash
$ helm install studio iterative/studio \
    --namespace studio \
    --set-json='imagePullSecrets=[{"name": "iterativeai"}]'
```

### Functional Installation:

Realistically, for a functional Studio app instance, you'll
need to configure multiple values. In this example we'll prepare a
more realistic and functional installation.

Assumptions:
- We have an ingress controller (nginx) installed on the cluster.
- Studio will be available from the domain: `my-studio.private.com`
  (we've registered this domain and made sure to redirect to our cluster).
- We refer to the TLS secret `studio-ingress-tls` we've created in [a previous step](#prepare-tls-secret).

Create a file named `studio-values.yaml`, with the following contents:

```yaml
imagePullSecrets:
  - name: iterativeai

global:
  host: "my-studio.private.com"
  secretKey: "768d4238-1257-4500-89ce-7ac6aea5c5c9"
  ingress:
    enabled: true
    className: nginx
    tlsEnabled: true
    tlsSecretName: studio-ingress-tls
  scmProviders:
    github:
      enabled: true
      appId: "<app-id>"
      appName: "iterative-studio-selfhosted"
      clientId: "<gh-client-id>"
      appSecret: "<gh-app-secret>"
      webhookUrl: "https://my-studio.private.com/webhook/github"
      privateKey: |-
        -----BEGIN RSA PRIVATE KEY-----
        ...
        -----END RSA PRIVATE KEY-----
```

## Update Studio Version

Studio's `studio-values.yaml` file points to the `latest` image tag, instructing Helm to always pull
down the latest image from the registry. 

**Optional: Pinning Studio Version** 

If you wish to install/update Studio at a specific version, update the `studio-values.yaml` file with the following:

```yaml
studioUi:
  image:
    tag: "<version>"

studioBackend:
  image:
    tag: "<version>"
```

To update the existing Studio deployment, run the following commands

```bash
$ helm dependency update
$ helm upgrade --install --atomic studio studio/ --namespace studio -f override.yaml
```

## Uninstall Studio

Execute the following command to uninstall Studio from your environment:

```bash
$ helm uninstall studio --namespace studio
```

### Available Configuration

See [values file](charts/studio/values.yaml) with all available configuration flags.
