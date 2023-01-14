## Studio Helm Chart

## Install Studio

We'll install Studio and related components in a dedicated `studio` namespace. 
Let's create it now:
```bash
$ kubectl create namespace studio
```

> Note: If you want to install Studio in any other namespace, modify the
> `--namespace` flag in the commands below accordingly

Configure Credentials to pull images from our secure registry:

```bash
$ kubectl create secret docker-registry iterativeai \
    --namespace studio \
    --docker-server=docker.iterative.ai \
    --docker-username=<username> \
    --docker-password=<password>
```

Deploy Studio using the Helm chart:

```bash
$ helm repo add iterative https://helm.iterative.ai
$ helm install studio iterative/studio \
    --namespace studio \
    --set-json='imagePullSecrets=[{"name": "iterativeai"}]'
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

### Example
As a simple example, this simple `values.yaml` corresponds to the above `--set-json` 
flag in the installation command:
```yaml
imagePullSecrets:
  name: iterativeai
```
