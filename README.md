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


### Create a docker registry secret

Configure Credentials to pull images from our secured registry:

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
First, we'll need to generate a TLS/SSL certificate,
and then, load it into a kubernetes secret in the namespace studio
will be installed in.
To create an SSL cert, you will need to know the domain (FQDN) that Studio
will be accessible from (e.g. `studio.iterative.ai` for the official SaaS
installation). 

As an example, we'll assume your Studio installation will be available
via: `https://my-studio.private.com`. We'll also use a self-signed
certificate for the sake of simplicity. Of course, for a production
installation we recommend using a certificate signed by a trusted CA.

Let's create a self-signed SSL cert using `openssl` (you may need to install it):
```bash
openssl req \
-x509 -newkey rsa:4096 -sha256 -nodes \
-keyout tls.key -out tls.crt \
-subj "/CN=my-studio.private.com" -days 365
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

Add the iterative helm repo:
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
studioUi:
  ingress:
    className: nginx
    enabled: true
    hosts:
      - host: "my-studio.private.com"
        paths:
          - path: /
            pathType: ImplementationSpecific
    tls:
      - secretName: studio-ingress-tls
        hosts:
          - "my-studio.private.com"
studioBackend:
  ingress:
    className: nginx
    enabled: true
    hosts:
      - host: "my-studio.private.com"
        paths:
          - path: /api
            pathType: ImplementationSpecific
    tls:
      - secretName: studio-ingress-tls
        hosts:
          - "my-studio.private.com"
```

## Update Studio

Studio's `values.yaml` file points to the `latest` image tag, instructing HELM to always pull down the latest image from the registry. 

**Optional Step** 

If the requirement is to install/update Studio to a specific version, update the `override.yaml` file with the following:

```yaml
imagePullSecrets:
  - name: iterativeai

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

## Chart Configuration

To further configure the chart values, you might want to create a `values.yaml` 
file with all the desired configuration, and use `-f values.yaml` in the installation command
to feed the values override to the chart installation.

### Available parameters

| Name | Description | Value | Required |
|------|-------------|-------|----------|
| `global.bitbucket.apiUrl` | Bitbucket API URL | `""` | False |
| `global.bitbucket.clientId` | Bitbucket Client ID | `""` | False |
| `global.bitbucket.secretKey` | Bitbucket Secret Key | `""` | False |
| `global.bitbucket.url` | Bitbucket URL | `""` | False |
| `global.bitbucket.webhookUrl` | Bitbucket Webhook URL | `""` | False |
| `global.blobvault.accessKeyId` | Blobvault (Minio) Access Key ID | `""` | True |
| `global.blobvault.bucket` | Blobvault (Minio) Bucket Name | `""` | False |
| `global.blobvault.endpointUrl` | Blobvault (Minio) Endpoint URL | `""` | False |
| `global.blobvault.endpointUrlFe` | Blobvault (Minio) Endpoint URL | `""` | False |
| `global.blobvault.secretAccessId` | Blobvault (Minio) Secret Access ID | `""` | True |
| `global.celery.brokerUrl` | Redis Endpoint | `""` | False |
| `global.celery.resultBackend` | Redis Endpoint | `""` | False |
| `global.customCaCert` | Custom CA certificate in PEM format | `""` | False |
| `global.github.appId` | Github Application ID | `""` | False |
| `global.github.appSecret` | Github Application Secret | `""` | False |
| `global.github.clientId` | Github Client ID | `""` | False |
| `global.github.privateKey` | Github Private Key | `""` | False |
| `global.github.url` | Github URL | `""` | False |
| `global.github.webhookSecret` | Github Webhook Secret | `""` | False |
| `global.github.webhookUrl` | Github Webhook URL | `""` | False |
| `global.gitlab.clientId` | Gitlab Client ID | `""` | False |
| `global.gitlab.secretKey` | Gitlab Secret Key | `""` | False |
| `global.gitlab.url` | Gitlab URL | `""` | False |
| `global.gitlab.webhookSecret` | Gitlab WebHook Secret | `""` | False |
| `global.gitlab.webhookUrl` | Gitlab Webhook URL | `""` | False |
| `global.maxTeams` | Maximum Teams  | `""` | True |
| `global.maxViews` | Maximum Views  | `""` | True |
| `global.postgres.databasePassword` | PostgreSQL Database Password | `""` | True |
| `global.postgres.databaseUrl` | PostgreSQL Database URL | `""` | True |
| `global.postgres.databaseUser` | PostgreSQL Database Username | `""` | True |
| `global.secretKey` | Secret Key | `""` | False |
| `postgresql.enabled` | Install in-cluster PostgreSQL  | `true` | False |
| `postgresql.global.postgresql.auth.database` | Name for a custom database to create | `true` | True |
| `postgresql.global.postgresql.auth.postgresPassword` | Password for the "postgres" admin user | `true` | True |
| `redis.enabled` | Install in-cluster Redis  | `true` | False |

See [values file](charts/studio/values.yaml) with all available configuration flags.
