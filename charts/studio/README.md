# studio

![Version: 0.18.116](https://img.shields.io/badge/Version-0.18.116-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v2.212.0](https://img.shields.io/badge/AppVersion-v2.212.0-informational?style=flat-square)

A Helm chart for Kubernetes

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| iterative | <support@iterative.ai> |  |

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | clickhouse | 9.2.2 |
| https://charts.bitnami.com/bitnami | postgresql | 16.7.2 |
| https://charts.bitnami.com/bitnami | redis | 21.0.2 |
| https://helm.vector.dev | vector-agent(vector) | 0.45.0 |
| https://helm.vector.dev | vector-aggregator(vector) | 0.45.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| clickhouse.auth.password | string | `"clickhouse"` | ClickHouse password |
| clickhouse.enabled | bool | `false` | ClickHouse enabled |
| clickhouse.fullnameOverride | string | `"studio-clickhouse"` | ClickHouse name override |
| clickhouse.image | object | `{"repository":"bitnamilegacy/clickhouse"}` | ClickHouse image configuration |
| clickhouse.replicaCount | int | `1` |  |
| clickhouse.shards | int | `1` |  |
| global.basePath | string | `""` | Studio: Base path (prefix) |
| global.blobvault.accessKeyId | string | `""` | Blobvault S3 access key ID |
| global.blobvault.bucket | string | `""` | Blobvault S3 bucket name |
| global.blobvault.endpointUrl | string | `""` | Blobvault S3 endpoint URL |
| global.blobvault.persistentVolume | object | `{"accessModes":["ReadWriteOnce"],"size":"30Gi","storageClassName":""}` | Blobvault local backing store settings. Not used when `global.blobvault.bucket` is set. |
| global.blobvault.persistentVolume.accessModes | list | ReadWriteOnce | Blobvault local backing store access mode. |
| global.blobvault.persistentVolume.size | string | `"30Gi"` | Blobvault local backing store size. |
| global.blobvault.persistentVolume.storageClassName | string | default storage class in the cluster. | Blobvault local backing store storage class. |
| global.blobvault.regionName | string | `""` | Blobvault S3 region |
| global.blobvault.secretAccessKeyId | string | `""` | Blobvault S3 secret access key ID |
| global.celery.brokerUrl | string | `""` | Celery broker URL |
| global.celery.resultBackend | string | `""` | Celery result URL |
| global.customCaCert | DEPRECATED | `""` | Studio: Custom CA certificate in PEM format Deprecated in favor of `customCaCerts` customCaCert: |-   -----BEGIN CERTIFICATE-----   ....   -----END CERTIFICATE-----  |
| global.customCaCerts | list | `[]` | Studio: Custom CA certificate in PEM format customCaCerts: - |-     -----BEGIN CERTIFICATE-----     ....     -----END CERTIFICATE-----  |
| global.datachain | object | `{}` | Studio: Settings related to DataChain |
| global.envFromSecret | string | `""` | Studio: The name of an existing Secret that contains sensitive environment variables passed to all Studio pods. |
| global.envVars | object | `{}` | Studio: Additional environment variables for all pods |
| global.host | string | `"studio.example.com"` | Studio: Hostname for accessing Studio (no http(s) scheme) |
| global.ingress.annotations | object | `{}` | Additional Ingress annotations |
| global.ingress.className | string | `""` | Ingress class to use |
| global.ingress.enabled | bool | `true` |  |
| global.ingress.hostnameEnabled | bool | `true` | Configure ingress resource to match hostnames to the service |
| global.ingress.tlsEnabled | bool | `false` | Expose studio under HTTPS protocol |
| global.ingress.tlsSecretName | string | `"chart-example-tls"` | TLS secret name to use for HTTPS on Ingress For ALB Ingress Controller leave empty. |
| global.maxTeams | string | `"10"` | Studio: Maximum number of teams |
| global.maxViews | string | `"100"` | Studio: Maximum number of views |
| global.postgres.databaseName | string | `"iterativeai"` | Postgres database name |
| global.postgres.databasePassword | DEPRECATED | `""` | Postgres database password |
| global.postgres.databaseUrl | DEPRECATED | `""` | Postgres database URL |
| global.postgres.databaseUser | DEPRECATED | `""` | Postgres database user |
| global.postgres.host | string | `"studio-postgresql"` | Postgres hostname |
| global.postgres.password | string | `"postgres"` | Postgres password |
| global.postgres.port | string | `"5432"` | Postgres port |
| global.postgres.user | string | `"postgres"` | Postgres user |
| global.scmProviders.bitbucket | object | `{"apiUrl":"","clientId":"","enabled":false,"secretKey":"","url":""}` | BitBucket App integration with Studio. |
| global.scmProviders.bitbucket.apiUrl | string | `""` | Bitbucket Server API URL Set this if you're using the selfhosted version |
| global.scmProviders.bitbucket.clientId | string | `""` | Bitbucket OAuth App Client ID |
| global.scmProviders.bitbucket.enabled | bool | `false` | Bitbucket enabled |
| global.scmProviders.bitbucket.secretKey | string | `""` | Bitbucket OAuth App Secret Key |
| global.scmProviders.bitbucket.url | string | `""` | Bitbucket Server URL Set this if you're using the selfhosted version |
| global.scmProviders.github | object | `{"apiUrl":"","appId":"","appName":"","clientId":"","clientSecret":"","enabled":false,"privateKey":"","url":""}` | GitHub App integration with Studio. |
| global.scmProviders.github.apiUrl | string | `""` | GitHub Enterprise API URL Set this if you're using the selfhosted version |
| global.scmProviders.github.appId | string | `""` | GitHub OAuth App ID |
| global.scmProviders.github.appName | string | `""` | GitHub OAuth App Name |
| global.scmProviders.github.clientId | string | `""` | GitHub OAuth App Client ID |
| global.scmProviders.github.clientSecret | string | `""` | GitHub OAuth App Secret |
| global.scmProviders.github.enabled | bool | `false` | GitHub enabled |
| global.scmProviders.github.privateKey | string | `""` | GitHub OAuth App Private Key |
| global.scmProviders.github.url | string | `""` | GitHub Enterprise URL Set this if you're using the selfhosted version |
| global.scmProviders.gitlab | object | `{"clientId":"","enabled":false,"secretKey":"","url":"","webhookSecret":""}` | GitLab App integration with Studio. |
| global.scmProviders.gitlab.clientId | string | `""` | GitLab OAuth App Client ID |
| global.scmProviders.gitlab.enabled | bool | `false` | GitLab enabled |
| global.scmProviders.gitlab.secretKey | string | `""` | GitLab OAuth App Secret Key |
| global.scmProviders.gitlab.url | string | `""` | GitLab Enterprise Edition URL Set this if you're using the selfhosted version |
| global.scmProviders.gitlab.webhookSecret | string | `""` | GitLab Webhook Secret |
| global.scmProviders.tlsEnabled | bool | `false` | Enable HTTPS protocol for incoming webhooks (this works only if `global.scmProviders.webhookHost` is set; otherwise is ignored). |
| global.scmProviders.webhookHost | string | `$global.host` value. | Custom hostname for incoming webhook (if Studio runs on a private network and you use SaaS versions of GitHub, GitLab, or Bitbucket) |
| global.secretKey | string | `""` | Studio: Django SECRET_KEY to encrypt, DB, sign reaquests, etc We recommend you set and manage this externally as other secrets (e.g. DB password, user name, REDIS password, etc). If left empty, a random key will be generated. If it's not saved and lost it might be hard to recover the DB. |
| global.security | object | `{"allowInsecureImages":true}` | Security settings for Bitnami Legacy images |
| global.security.allowInsecureImages | bool | `true` | Allow insecure images from bitnamilegacy repository |
| imagePullSecrets | list | `[]` | Secret containing Docker registry credentials |
| pgBouncer | object | `{"affinity":{},"autoscaling":{"enabled":false,"maxReplicas":5,"minReplicas":1,"targetCPUUtilizationPercentage":80},"enabled":false,"envFromSecret":"","envVars":{},"image":{"pullPolicy":"IfNotPresent","repository":"bitnamilegacy/pgbouncer","tag":"1.24.1"},"nodeSelector":{},"podAnnotations":{},"podSecurityContext":{},"replicaCount":1,"resources":{"limits":{"memory":"1024Mi"},"requests":{"cpu":"500m","memory":"512Mi"}},"securityContext":{},"service":{"port":6432,"type":"ClusterIP"},"serviceAccountName":"","tolerations":[]}` | PgBouncer settings group |
| pgBouncer.affinity | object | `{}` | PgBouncer pod affinity configuration |
| pgBouncer.autoscaling | object | `{"enabled":false,"maxReplicas":5,"minReplicas":1,"targetCPUUtilizationPercentage":80}` | PgBouncer autoscaling configuration |
| pgBouncer.autoscaling.enabled | bool | `false` | PgBouncer autoscaling enabled flag |
| pgBouncer.autoscaling.maxReplicas | int | `5` | PgBouncer autoscaling max replicas |
| pgBouncer.autoscaling.minReplicas | int | `1` | PgBouncer autoscaling min replicas |
| pgBouncer.autoscaling.targetCPUUtilizationPercentage | int | `80` | PgBouncer autoscaling target CPU utilization percentage |
| pgBouncer.envFromSecret | string | `""` | The name of an existing Secret that contains sensitive environment variables. |
| pgBouncer.envVars | object | `{}` | Additional environment variables for PgBouncer pods |
| pgBouncer.image | object | `{"pullPolicy":"IfNotPresent","repository":"bitnamilegacy/pgbouncer","tag":"1.24.1"}` | PgBouncer image settings |
| pgBouncer.image.pullPolicy | string | `"IfNotPresent"` | PgBouncer image pull policy |
| pgBouncer.image.repository | string | `"bitnamilegacy/pgbouncer"` | PgBouncer image repository |
| pgBouncer.image.tag | string | `"1.24.1"` | PgBouncer image tag |
| pgBouncer.nodeSelector | object | `{}` | PgBouncer pod node selector configuration |
| pgBouncer.podAnnotations | object | `{}` | Additional PgBouncer pod annotations |
| pgBouncer.podSecurityContext | object | `{}` | PgBouncer pod security context configuration |
| pgBouncer.resources | object | `{"limits":{"memory":"1024Mi"},"requests":{"cpu":"500m","memory":"512Mi"}}` | PgBouncer resources configuration |
| pgBouncer.resources.limits | object | `{"memory":"1024Mi"}` | PgBouncer limits configuration |
| pgBouncer.resources.requests | object | `{"cpu":"500m","memory":"512Mi"}` | PgBouncer requests configuration |
| pgBouncer.securityContext | object | `{}` | PgBouncer pod security context configuration |
| pgBouncer.serviceAccountName | string | `""` | PgBouncer service account name |
| pgBouncer.tolerations | list | `[]` | PgBouncer pod tolerations configuration |
| postgresql.enabled | bool | `true` | Postgres enabled |
| postgresql.fullnameOverride | string | `"studio-postgresql"` | Postgres name override |
| postgresql.global.postgresql.auth.database | string | `"iterativeai"` | Postgres database |
| postgresql.global.postgresql.auth.postgresPassword | string | `"postgres"` | Postgres password |
| postgresql.image | object | `{"repository":"bitnamilegacy/postgresql","tag":"14.5.0-debian-11-r35"}` | Postgres image configuration |
| redis.auth | object | `{"enabled":false}` | Redis authentication settings |
| redis.auth.enabled | bool | `false` | Redis authentication disabled |
| redis.commonConfiguration | string | `"timeout 20"` | Redis common configuration to be added into the ConfigMap |
| redis.enabled | bool | `true` | Redis enabled |
| redis.fullnameOverride | string | `"studio-redis"` | Redis name override |
| redis.image | object | `{"repository":"bitnamilegacy/redis"}` | Redis image configuration |
| redis.master | object | `{"persistence":{"enabled":false},"resources":{"limits":{"cpu":"1000m","memory":"2Gi"},"requests":{"cpu":"200m","memory":"512Mi"}}}` | Redis master configuration |
| redis.master.persistence | object | `{"enabled":false}` | Redis master persistence configuration |
| redis.master.persistence.enabled | bool | `false` | Redis master persistence is disabled |
| redis.replica | object | `{"persistence":{"enabled":false},"replicaCount":0}` | Redis replica configuration |
| redis.replica.persistence | object | `{"enabled":false}` | Redis replica persistence configuration |
| redis.replica.persistence.enabled | bool | `false` | Redis replica persistence is disabled |
| redis.replica.replicaCount | int | `0` | Redis replica count. 0 for standalone deployment of 1 master and 0 replicas |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `false` |  |
| serviceAccount.name | string | `""` |  |
| studioBackend | object | `{"affinity":{},"autoscaling":{"enabled":false,"maxReplicas":5,"minReplicas":1,"targetCPUUtilizationPercentage":80},"datachainApi":{"autoscaling":{"enabled":false,"maxReplicas":5,"minReplicas":1,"targetCPUUtilizationPercentage":80},"enabled":false,"replicaCount":1,"resources":{"limits":{"cpu":"500m","memory":"512Mi"},"requests":{"cpu":"100m","memory":"256Mi"}}},"envFromSecret":"","envVars":{},"image":{"pullPolicy":"IfNotPresent","repository":"docker.iterative.ai/studio-backend"},"nodeSelector":{},"podAnnotations":{},"podSecurityContext":{},"replicaCount":1,"resources":{"limits":{"memory":"2Gi"},"requests":{"cpu":"500m","memory":"1Gi"}},"securityContext":{},"service":{"port":8000,"type":"ClusterIP"},"strategy":{"rollingUpdate":{"maxSurge":1,"maxUnavailable":0}},"tolerations":[]}` | Studio Backend settings group |
| studioBackend.datachainApi.replicaCount | int | `1` | Number of replicas of Datachain API backend pods |
| studioBackend.envFromSecret | string | `""` | The name of an existing Secret that contains sensitive environment variables passed to backend pods. |
| studioBackend.envVars | object | `{}` | Additional environment variables for backend pods |
| studioBackend.replicaCount | int | `1` | Number of replicas of backend pods |
| studioBeat | object | `{"affinity":{},"autoscaling":{"enabled":false,"maxReplicas":5,"minReplicas":1,"targetCPUUtilizationPercentage":80},"envFromSecret":"","envVars":{},"nodeSelector":{},"podAnnotations":{},"podSecurityContext":{},"replicaCount":1,"resources":{"limits":{"memory":"2Gi"},"requests":{"cpu":"100m","memory":"128Mi"}},"securityContext":{},"strategy":{"rollingUpdate":{"maxSurge":1,"maxUnavailable":0}},"tolerations":[]}` | Studio Beat settings group |
| studioBeat.envFromSecret | string | `""` | The name of an existing Secret that contains sensitive environment variables passed to beat pods. |
| studioBeat.envVars | object | `{}` | Additional environment variables for beat pods |
| studioBlobvault | object | `{"image":{"repository":"nginx","tag":"1.28.0-alpine"},"podSecurityContext":{},"securityContext":{},"service":{"port":80}}` | Studio: Additional service to expose the blobvault files generated by the worker It is enabled automatically if the worker is scaled to 1 replica and no bucket is configured |
| studioBlobvault.image | object | `{"repository":"nginx","tag":"1.28.0-alpine"}` | Image to use for the blobvault service |
| studioBlobvault.image.repository | string | `"nginx"` | Image repository |
| studioBlobvault.image.tag | string | `"1.28.0-alpine"` | Image tag |
| studioDatachainWorker | object | `{"affinity":{},"autoscaling":{"annotations":{},"behavior":{},"enabled":false,"maxReplicas":5,"minReplicas":1,"targetCPUUtilizationPercentage":80,"template":[]},"envFromSecret":"","envVars":{},"image":{"pullPolicy":"IfNotPresent","repository":"docker.iterative.ai/studio-datachain-worker"},"logLevel":"info","nodeSelector":{},"podAnnotations":{},"podSecurityContext":{},"replicaCount":1,"resources":{"limits":{"ephemeral-storage":"20Gi","memory":"16Gi"},"requests":{"cpu":"1000m","ephemeral-storage":"10Gi","memory":"3Gi"}},"securityContext":{},"serviceAccount":{"annotations":{},"create":true,"name":""},"strategy":{"rollingUpdate":{"maxSurge":"25%","maxUnavailable":0}},"terminationGracePeriodSeconds":180,"tolerations":[]}` | Studio DataChain Worker settings group |
| studioDatachainWorker.affinity | object | `{}` | DataChain worker pod affinity configuration |
| studioDatachainWorker.autoscaling | object | `{"annotations":{},"behavior":{},"enabled":false,"maxReplicas":5,"minReplicas":1,"targetCPUUtilizationPercentage":80,"template":[]}` | DataChain worker autoscaling configuration |
| studioDatachainWorker.autoscaling.annotations | object | `{}` | Worker autoscaling annotation |
| studioDatachainWorker.autoscaling.behavior | object | `{}` | DataChain worker autoscaling behavior |
| studioDatachainWorker.autoscaling.enabled | bool | `false` | DataChain worker autoscaling enabled flag |
| studioDatachainWorker.autoscaling.maxReplicas | int | `5` | DataChain worker autoscaling max replicas |
| studioDatachainWorker.autoscaling.minReplicas | int | `1` | DataChain worker autoscaling min replicas |
| studioDatachainWorker.autoscaling.targetCPUUtilizationPercentage | int | `80` | DataChain worker autoscaling target CPU utilization percentage |
| studioDatachainWorker.autoscaling.template | list | `[]` | DataChain worker Custom or additional autoscaling metrics Custom or additional autoscaling metrics ref: https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/#support-for-custom-metrics |
| studioDatachainWorker.envFromSecret | string | `""` | The name of an existing Secret that contains sensitive environment variables passed to DataChain worker pods. |
| studioDatachainWorker.envVars | object | `{}` | Additional environment variables for DataChain worker pods |
| studioDatachainWorker.image | object | `{"pullPolicy":"IfNotPresent","repository":"docker.iterative.ai/studio-datachain-worker"}` | DataChain worker image settings |
| studioDatachainWorker.image.pullPolicy | string | `"IfNotPresent"` | DataChain worker image pull policy |
| studioDatachainWorker.image.repository | string | `"docker.iterative.ai/studio-datachain-worker"` | DataChain worker image repository |
| studioDatachainWorker.logLevel | string | `"info"` | DataChain worker log level |
| studioDatachainWorker.nodeSelector | object | `{}` | DataChain worker pod node selector configuration |
| studioDatachainWorker.podAnnotations | object | `{}` | Additional DataChain worker pod annotations |
| studioDatachainWorker.podSecurityContext | object | `{}` | DataChain worker pod security context configuration |
| studioDatachainWorker.resources | object | `{"limits":{"ephemeral-storage":"20Gi","memory":"16Gi"},"requests":{"cpu":"1000m","ephemeral-storage":"10Gi","memory":"3Gi"}}` | DataChain worker resources configuration |
| studioDatachainWorker.resources.limits | object | `{"ephemeral-storage":"20Gi","memory":"16Gi"}` | DataChain worker limits configuration |
| studioDatachainWorker.resources.requests | object | `{"cpu":"1000m","ephemeral-storage":"10Gi","memory":"3Gi"}` | DataChain worker requests configuration |
| studioDatachainWorker.securityContext | object | `{}` | DataChain worker pod security context configuration |
| studioDatachainWorker.strategy | object | `{"rollingUpdate":{"maxSurge":"25%","maxUnavailable":0}}` | DataChain worker deployment strategy |
| studioDatachainWorker.terminationGracePeriodSeconds | int | `180` | DataChain worker termination grace period |
| studioDatachainWorker.tolerations | list | `[]` | DataChain worker pod tolerations configuration |
| studioDatachainWorkerJobTemplate | object | `{"activeDeadlineSeconds":86400,"affinity":{},"backoffLimit":0,"envVars":{},"ephemeralStorage":{"persistentVolumeClaim":{"claimName":"datachain-worker","storageClass":""},"size":"20Gi","type":"ephemeral"},"idleTimeout":1800,"image":{"pullPolicy":"IfNotPresent","repository":"docker.iterative.ai/studio-datachain-worker"},"jobQuota":10,"localStorage":{"persistentVolumeClaim":{"claimName":"datachain-worker-local","storageClass":""},"size":"50Gi","type":"ephemeral"},"logLevel":"info","nodeSelector":{},"podAnnotations":{},"podLabels":{},"podSecurityContext":{},"resources":{"limits":{"ephemeral-storage":"20Gi"},"requests":{"cpu":"1000m","ephemeral-storage":"10Gi","memory":"3Gi"}},"runtimeClassName":null,"securityContext":{},"serviceAccount":{"annotations":{},"create":false,"name":""},"tolerations":[],"ttlSecondsAfterFinished":30}` | Studio DataChain Worker Job template settings group |
| studioDatachainWorkerJobTemplate.activeDeadlineSeconds | int | `86400` | DataChain worker Job active deadline (seconds) |
| studioDatachainWorkerJobTemplate.affinity | object | `{}` | DataChain worker Job pod affinity configuration |
| studioDatachainWorkerJobTemplate.backoffLimit | int | `0` | DataChain worker Job backoff limit |
| studioDatachainWorkerJobTemplate.envVars | object | `{}` | Additional environment variables for DataChain worker Job pods |
| studioDatachainWorkerJobTemplate.ephemeralStorage | object | `{"persistentVolumeClaim":{"claimName":"datachain-worker","storageClass":""},"size":"20Gi","type":"ephemeral"}` | Ephemeral storage configuration |
| studioDatachainWorkerJobTemplate.ephemeralStorage.persistentVolumeClaim | object | `{"claimName":"datachain-worker","storageClass":""}` | Persistent Volume Claim configuration for ephemeral storage (if type is set `pvc`) |
| studioDatachainWorkerJobTemplate.ephemeralStorage.persistentVolumeClaim.claimName | string | `"datachain-worker"` | Persistent Volume Claim name, to mount externally managed PVC (`ephemeralStorage.type` has to be set to `pvc`) |
| studioDatachainWorkerJobTemplate.ephemeralStorage.persistentVolumeClaim.storageClass | string | `""` | Persistent Volume Claim `storageClass` name, by default it will use the default `storageClass`(not used when `pvc` is set as type) |
| studioDatachainWorkerJobTemplate.ephemeralStorage.size | string | `"20Gi"` | Ephemeral Storage size |
| studioDatachainWorkerJobTemplate.ephemeralStorage.type | string | `"ephemeral"` | Ephemeral Storage type. Possible values: `emptyDir`,  `ephemeral`, `pvc`, `pvcRWX` |
| studioDatachainWorkerJobTemplate.idleTimeout | int | `1800` | DataChain worker idle timeout |
| studioDatachainWorkerJobTemplate.image | object | `{"pullPolicy":"IfNotPresent","repository":"docker.iterative.ai/studio-datachain-worker"}` | DataChain worker Job image settings |
| studioDatachainWorkerJobTemplate.image.pullPolicy | string | `"IfNotPresent"` | DataChain worker Job image pull policy |
| studioDatachainWorkerJobTemplate.image.repository | string | `"docker.iterative.ai/studio-datachain-worker"` | DataChain worker Job image repository |
| studioDatachainWorkerJobTemplate.jobQuota | int | `10` | DataChain worker Job quota |
| studioDatachainWorkerJobTemplate.localStorage | object | `{"persistentVolumeClaim":{"claimName":"datachain-worker-local","storageClass":""},"size":"50Gi","type":"ephemeral"}` | Local storage configuration (used for storing DataChain virtual environments) |
| studioDatachainWorkerJobTemplate.localStorage.persistentVolumeClaim | object | `{"claimName":"datachain-worker-local","storageClass":""}` | Persistent Volume Claim configuration for local storage |
| studioDatachainWorkerJobTemplate.localStorage.persistentVolumeClaim.claimName | string | `"datachain-worker-local"` | Persistent Volume Claim name, to mount externally managed PVC (`localStorage.type` has to be set to `pvc`) |
| studioDatachainWorkerJobTemplate.localStorage.persistentVolumeClaim.storageClass | string | `""` | Persistent Volume Claim `storageClass` name, by default it will use the default `storageClass`(not used when `pvc` is set as type) |
| studioDatachainWorkerJobTemplate.localStorage.size | string | `"50Gi"` | Local Storage size |
| studioDatachainWorkerJobTemplate.localStorage.type | string | `"ephemeral"` | Local Storage type. Possible values: `emptyDir`,  `ephemeral`, `pvc` |
| studioDatachainWorkerJobTemplate.logLevel | string | `"info"` | DataChain worker Job log level |
| studioDatachainWorkerJobTemplate.nodeSelector | object | `{}` | DataChain worker Job pod node selector configuration |
| studioDatachainWorkerJobTemplate.podAnnotations | object | `{}` | Additional DataChain worker Job pod annotations |
| studioDatachainWorkerJobTemplate.podLabels | object | `{}` | Additional DataChain worker Job pod labels |
| studioDatachainWorkerJobTemplate.podSecurityContext | object | `{}` | DataChain worker Job pod security context configuration |
| studioDatachainWorkerJobTemplate.resources | object | `{"limits":{"ephemeral-storage":"20Gi"},"requests":{"cpu":"1000m","ephemeral-storage":"10Gi","memory":"3Gi"}}` | DataChain worker Job resources configuration |
| studioDatachainWorkerJobTemplate.resources.limits | object | `{"ephemeral-storage":"20Gi"}` | DataChain worker Job limits configuration |
| studioDatachainWorkerJobTemplate.resources.requests | object | `{"cpu":"1000m","ephemeral-storage":"10Gi","memory":"3Gi"}` | DataChain worker Job requests configuration |
| studioDatachainWorkerJobTemplate.runtimeClassName | string | `nil` | DataChain worker Job security context configuration |
| studioDatachainWorkerJobTemplate.securityContext | object | `{}` | DataChain worker Job security context configuration |
| studioDatachainWorkerJobTemplate.tolerations | list | `[]` | DataChain worker Job pod tolerations configuration |
| studioDatachainWorkerJobTemplate.ttlSecondsAfterFinished | int | `30` | DataChain worker Job TTL after finished (seconds) |
| studioPypiCache | object | `{"affinity":{},"enabled":false,"image":{"repository":"nginx","tag":"1.27.4-alpine"},"nodeSelector":{},"podSecurityContext":{},"securityContext":{},"service":{"port":8080},"storage":{"persistentVolumeClaim":{"claimName":"pypi-cache","storageClass":""},"size":"100Gi","type":"pvcRWO"},"tolerations":[]}` | Studio: Additional service to cache PyPI packages |
| studioPypiCache.enabled | bool | `false` | PyPI cache enabled |
| studioPypiCache.image | object | `{"repository":"nginx","tag":"1.27.4-alpine"}` | Image to use for the pypi-cache service |
| studioPypiCache.image.repository | string | `"nginx"` | Image repository |
| studioPypiCache.image.tag | string | `"1.27.4-alpine"` | Image tag |
| studioPypiCache.storage | object | `{"persistentVolumeClaim":{"claimName":"pypi-cache","storageClass":""},"size":"100Gi","type":"pvcRWO"}` | Storage configuration |
| studioPypiCache.storage.persistentVolumeClaim | object | `{"claimName":"pypi-cache","storageClass":""}` | Persistent Volume Claim configuration for storage (if type is set `pvc`) |
| studioPypiCache.storage.persistentVolumeClaim.claimName | string | `"pypi-cache"` | Persistent Volume Claim name, to mount externally managed PVC (`storage.type` has to be set to `pvc`) |
| studioPypiCache.storage.persistentVolumeClaim.storageClass | string | `""` | Persistent Volume Claim `storageClass` name, by default it will use the default `storageClass`(not used when `pvc` is set as type) |
| studioPypiCache.storage.size | string | `"100Gi"` | Storage size |
| studioPypiCache.storage.type | string | `"pvcRWO"` | Storage type; either `emptyDir`, `ephemeral`, `pvc` or `pvcRWO` |
| studioUi | object | `{"affinity":{},"autoscaling":{"enabled":false,"maxReplicas":5,"minReplicas":1,"targetCPUUtilizationPercentage":80},"envFromSecret":"","envVars":{},"image":{"pullPolicy":"IfNotPresent","repository":"docker.iterative.ai/studio-frontend"},"nodeSelector":{},"podAnnotations":{},"podSecurityContext":{},"replicaCount":1,"resources":{"limits":{"memory":"2Gi"},"requests":{"cpu":"500m","memory":"1Gi"}},"securityContext":{},"service":{"port":3000,"type":"ClusterIP"},"strategy":{"rollingUpdate":{"maxSurge":1,"maxUnavailable":0}},"tolerations":[]}` | Studio UI settings group |
| studioUi.envFromSecret | string | `""` | The name of an existing Secret that contains sensitive environment variables passed to UI pods. |
| studioUi.envVars | object | `{}` | Additional environment variables for ui pods |
| studioWorker | object | `{"affinity":{},"autoscaling":{"annotations":{},"behavior":{},"enabled":false,"maxReplicas":5,"minReplicas":1,"template":[]},"envFromSecret":"","envVars":{},"ephemeralStorage":{"persistentVolumeClaim":{"claimName":"worker","storageClass":""},"size":"1Gi","type":"ephemeral"},"image":{"pullPolicy":"IfNotPresent","repository":"docker.iterative.ai/studio-backend"},"logLevel":"info","nodeSelector":{},"podAnnotations":{},"podSecurityContext":{},"replicaCount":1,"resources":{"limits":{"memory":"1Gi"},"requests":{"cpu":"500m","memory":"512Mi"}},"securityContext":{},"serviceAccount":{"annotations":{},"create":false,"name":""},"strategy":{"rollingUpdate":{"maxSurge":1,"maxUnavailable":0}},"terminationGracePeriodSeconds":150,"tolerations":[]}` | Studio worker settings group |
| studioWorker.affinity | object | `{}` | Worker affinity |
| studioWorker.autoscaling | object | `{"annotations":{},"behavior":{},"enabled":false,"maxReplicas":5,"minReplicas":1,"template":[]}` | Worker autoscaling configuration |
| studioWorker.autoscaling.annotations | object | `{}` | Worker autoscaling annotation |
| studioWorker.autoscaling.behavior | object | `{}` | Worker autoscaling behavior |
| studioWorker.autoscaling.enabled | bool | `false` | Worker autoscaling enabled flag |
| studioWorker.autoscaling.maxReplicas | int | `5` | Worker autoscaling maximum replicas |
| studioWorker.autoscaling.minReplicas | int | `1` | Worker autoscaling minimum replicas |
| studioWorker.autoscaling.template | list | `[]` | Worker Custom or additional autoscaling metrics Custom or additional autoscaling metrics ref: https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/#support-for-custom-metrics |
| studioWorker.envFromSecret | string | `""` | The name of an existing Secret that contains sensitive environment variables passed to worker pods. |
| studioWorker.envVars | object | `{}` | Additional environment variables for worker pods |
| studioWorker.ephemeralStorage | object | `{"persistentVolumeClaim":{"claimName":"worker","storageClass":""},"size":"1Gi","type":"ephemeral"}` | Ephemeral storage configuration |
| studioWorker.ephemeralStorage.persistentVolumeClaim | object | `{"claimName":"worker","storageClass":""}` | Persistent Volume Claim configuration for ephemeral storage (if type is set `pvc`) |
| studioWorker.ephemeralStorage.persistentVolumeClaim.claimName | string | `"worker"` | Persistent Volume Claim name, to mount externally managed PVC (`ephemeralStorage.type` has to be set to `pvc`) |
| studioWorker.ephemeralStorage.persistentVolumeClaim.storageClass | string | `""` | Persistent Volume Claim `storageClass` name, by default it will use the default `storageClass`(not used when `pvc` is set as type) |
| studioWorker.ephemeralStorage.size | string | `"1Gi"` | Ephemeral Storage size |
| studioWorker.ephemeralStorage.type | string | `"ephemeral"` | Ephemeral Storage type. Possible values: `emptyDir`,  `ephemeral`, `pvc`, `pvcRWX` |
| studioWorker.image | object | `{"pullPolicy":"IfNotPresent","repository":"docker.iterative.ai/studio-backend"}` | Studio worker image settings |
| studioWorker.image.pullPolicy | string | `"IfNotPresent"` | Studio worker image pull policy |
| studioWorker.image.repository | string | `"docker.iterative.ai/studio-backend"` | Studio worker image repository |
| studioWorker.logLevel | string | `"info"` | Worker log level |
| studioWorker.nodeSelector | object | `{}` | Worker node selector |
| studioWorker.podAnnotations | object | `{}` | Additional worker pod annotations |
| studioWorker.podSecurityContext | object | `{}` | Worker pod security context |
| studioWorker.resources | object | `{"limits":{"memory":"1Gi"},"requests":{"cpu":"500m","memory":"512Mi"}}` | Worker resources configuration |
| studioWorker.resources.limits | object | `{"memory":"1Gi"}` | Worker resource limits configuration |
| studioWorker.resources.requests | object | `{"cpu":"500m","memory":"512Mi"}` | Worker resource requests configuration |
| studioWorker.securityContext | object | `{}` | Worker security context |
| studioWorker.strategy | object | `{"rollingUpdate":{"maxSurge":1,"maxUnavailable":0}}` | Worker deployment strategy |
| studioWorker.terminationGracePeriodSeconds | int | `150` | Worker termination grace period |
| studioWorker.tolerations | list | `[]` | Worker tolerations |
| vector-agent | object | `{"customConfig":{"api":{"enabled":false},"data_dir":"/data/vector","expire_metrics_secs":60,"sinks":{"vector_aggregator":{"address":"studio-vector-aggregator:6000","compression":true,"inputs":["kubernetes_logs_filtered","kubernetes_metrics_filtered","kubernetes_metrics_cadvisor_filtered"],"type":"vector"}},"sources":{"kubernetes_logs":{"ignore_older_secs":600,"type":"kubernetes_logs"},"kubernetes_metrics":{"auth":{"strategy":"bearer","token":"${KUBERNETES_SERVICE_ACCOUNT_TOKEN:?}"},"endpoints":["https://${KUBERNETES_NODE_IP}:10250/metrics"],"scrape_interval_secs":30,"tls":{"verify_certificate":false},"type":"prometheus_scrape"},"kubernetes_metrics_cadvisor":{"auth":{"strategy":"bearer","token":"${KUBERNETES_SERVICE_ACCOUNT_TOKEN:?}"},"endpoints":["https://${KUBERNETES_NODE_IP}:10250/metrics/cadvisor"],"scrape_interval_secs":30,"tls":{"verify_certificate":false},"type":"prometheus_scrape"}},"transforms":{"kubernetes_logs_filtered":{"inputs":["kubernetes_logs"],"source":". = {\n  \"message\": .message,\n  \"source_type\": .source_type,\n  \"stream\": .stream,\n  \"timestamp\": .timestamp,\n  \"kubernetes\": {\n    \"pod_name\": .kubernetes.pod_name,\n    \"namespace\": .kubernetes.pod_namespace,\n    \"container_name\": .kubernetes.container_name\n  }\n}\n","type":"remap"},"kubernetes_metrics_cadvisor_filtered":{"condition":".name == \"node_cpu_usage_seconds_total\" || .name == \"node_memory_working_set_bytes\" || .name == \"container_cpu_usage_seconds_total\" || .name == \"container_memory_working_set_bytes\" || .name == \"container_start_time_seconds\"","inputs":["kubernetes_metrics_cadvisor"],"type":"filter"},"kubernetes_metrics_filtered":{"condition":"starts_with!(.name, \"kubelet_volume_stats_\") || .name == \"kubelet_image_pull_duration_seconds\"","inputs":["kubernetes_metrics"],"type":"filter"}}},"defaultVolumeMounts":[{"mountPath":"/var/log/","name":"var-log","readOnly":true}],"defaultVolumes":[{"hostPath":{"path":"/var/log/"},"name":"var-log"}],"enabled":false,"env":[{"name":"KUBERNETES_SERVICE_ACCOUNT_TOKEN","valueFrom":{"secretKeyRef":{"key":"token","name":"studio-vector-agent-token"}}},{"name":"KUBERNETES_NODE_IP","valueFrom":{"fieldRef":{"fieldPath":"status.hostIP"}}}],"extraObjects":[{"apiVersion":"rbac.authorization.k8s.io/v1","kind":"ClusterRole","metadata":{"annotations":{"helm.sh/hook":"pre-install, pre-upgrade","helm.sh/hook-delete-policy":"hook-failed, before-hook-creation"},"name":"studio-vector-agent-extended"},"rules":[{"apiGroups":[""],"resources":["nodes/metrics","nodes/stats"],"verbs":["get"]}]},{"apiVersion":"rbac.authorization.k8s.io/v1","kind":"ClusterRoleBinding","metadata":{"annotations":{"helm.sh/hook":"pre-install, pre-upgrade","helm.sh/hook-delete-policy":"hook-failed, before-hook-creation"},"name":"studio-vector-agent-extended"},"roleRef":{"kind":"ClusterRole","name":"studio-vector-agent-extended"},"subjects":[{"kind":"ServiceAccount","name":"studio-vector-agent","namespace":"default"}]},{"apiVersion":"v1","kind":"Secret","metadata":{"annotations":{"kubernetes.io/service-account.name":"studio-vector-agent"},"name":"studio-vector-agent-token"},"type":"kubernetes.io/service-account-token"}],"fullnameOverride":"studio-vector-agent","image":{"base":"alpine"},"persistence":{"hostPath":{"enabled":false}},"role":"Agent","serviceAccount":{"create":true,"name":"studio-vector-agent"},"tolerations":[{"operator":"Exists"}]}` | Vector Agent configuration for log collection (DaemonSet) |
| vector-agent.customConfig | object | `{"api":{"enabled":false},"data_dir":"/data/vector","expire_metrics_secs":60,"sinks":{"vector_aggregator":{"address":"studio-vector-aggregator:6000","compression":true,"inputs":["kubernetes_logs_filtered","kubernetes_metrics_filtered","kubernetes_metrics_cadvisor_filtered"],"type":"vector"}},"sources":{"kubernetes_logs":{"ignore_older_secs":600,"type":"kubernetes_logs"},"kubernetes_metrics":{"auth":{"strategy":"bearer","token":"${KUBERNETES_SERVICE_ACCOUNT_TOKEN:?}"},"endpoints":["https://${KUBERNETES_NODE_IP}:10250/metrics"],"scrape_interval_secs":30,"tls":{"verify_certificate":false},"type":"prometheus_scrape"},"kubernetes_metrics_cadvisor":{"auth":{"strategy":"bearer","token":"${KUBERNETES_SERVICE_ACCOUNT_TOKEN:?}"},"endpoints":["https://${KUBERNETES_NODE_IP}:10250/metrics/cadvisor"],"scrape_interval_secs":30,"tls":{"verify_certificate":false},"type":"prometheus_scrape"}},"transforms":{"kubernetes_logs_filtered":{"inputs":["kubernetes_logs"],"source":". = {\n  \"message\": .message,\n  \"source_type\": .source_type,\n  \"stream\": .stream,\n  \"timestamp\": .timestamp,\n  \"kubernetes\": {\n    \"pod_name\": .kubernetes.pod_name,\n    \"namespace\": .kubernetes.pod_namespace,\n    \"container_name\": .kubernetes.container_name\n  }\n}\n","type":"remap"},"kubernetes_metrics_cadvisor_filtered":{"condition":".name == \"node_cpu_usage_seconds_total\" || .name == \"node_memory_working_set_bytes\" || .name == \"container_cpu_usage_seconds_total\" || .name == \"container_memory_working_set_bytes\" || .name == \"container_start_time_seconds\"","inputs":["kubernetes_metrics_cadvisor"],"type":"filter"},"kubernetes_metrics_filtered":{"condition":"starts_with!(.name, \"kubelet_volume_stats_\") || .name == \"kubelet_image_pull_duration_seconds\"","inputs":["kubernetes_metrics"],"type":"filter"}}}` | Vector Agent configuration |
| vector-agent.enabled | bool | `false` | Vector Agent enabled |
| vector-agent.fullnameOverride | string | `"studio-vector-agent"` | Vector Agent name override |
| vector-agent.image.base | string | `"alpine"` | The base to use for Vector's image. |
| vector-agent.role | string | `"Agent"` | Deploy as DaemonSet for log collection from all nodes |
| vector-agent.serviceAccount | object | `{"create":true,"name":"studio-vector-agent"}` | Vector Agent service account |
| vector-agent.tolerations | list | `[{"operator":"Exists"}]` | Vector Agent tolerations |
| vector-aggregator | object | `{"args":["ash -euc '\n  STORAGE=/data/vector\n  MAXIMUM_SIZE_PERCENT=90\n  OLDEST_MODIFICATION_DAYS=7\n\n  while sleep 60; do\n    echo \"Running garbage collection in $STORAGE\"\n\n    find \"$STORAGE\" -type f -mtime +\"$OLDEST_MODIFICATION_DAYS\" -print -delete |\n    while read file; do\n      echo \"Deleting file because is older than $OLDEST_MODIFICATION_DAYS days: $file\"\n    done\n\n    until test \"$(df \"$STORAGE\" | awk \"NR==2{print \\$5}\" | tr -d %)\" -lt \"$MAXIMUM_SIZE_PERCENT\"; do\n      oldest_file=$(find \"$STORAGE\" -type f -print0 | xargs -0 -n 128 stat -c \"%Y %n\" | sort -n | cut -d\" \" -f2- | head -n1)\n      echo \"Deleting file because is the oldest and storage is more than $MAXIMUM_SIZE_PERCENT% full: $oldest_file\"\n      rm \"$oldest_file\"\n    done\n  done\n' & GARBAGECOLLECT=$!\n\n/usr/local/bin/vector --config-dir /etc/vector/ & VECTOR=$!\n\nwait -n $VECTOR $GARBAGECOLLECT"],"command":["/bin/ash","-euc"],"customConfig":{"api":{"address":"0.0.0.0:8686","enabled":true,"playground":true},"data_dir":"/data/vector","expire_metrics_secs":60,"sinks":{"events_file":{"encoding":{"codec":"json"},"inputs":["kubernetes_events_deduped"],"path":"/data/vector/events/%Y-%m-%d.log","type":"file"},"logs_file":{"encoding":{"codec":"json"},"inputs":["vector_agent_route.logs"],"path":"/data/vector/logs/%Y-%m-%d-{{ \"{{\" }} .kubernetes.pod_name {{ \"}}\" }}.log","type":"file"},"metrics_file":{"encoding":{"codec":"json"},"inputs":["vector_agent_route.metrics"],"path":"/data/vector/metrics/%Y-%m-%d.log","type":"file"}},"sources":{"kubernetes_events":{"auth":{"strategy":"bearer","token":"${KUBERNETES_SERVICE_ACCOUNT_TOKEN:?}"},"decoding":{"codec":"json"},"endpoint":"https://kubernetes.default.svc:443/api/v1/events","headers":{"Accept":["application/json"]},"scrape_interval_secs":30,"tls":{"ca_file":"/var/run/secrets/kubernetes.io/serviceaccount/ca.crt"},"type":"http_client"},"vector_agent":{"address":"0.0.0.0:6000","type":"vector","version":"2"}},"transforms":{"kubernetes_events_deduped":{"fields":{"match":["node_name","object_name","message","timestamp"]},"inputs":["kubernetes_events_normalized"],"type":"dedupe"},"kubernetes_events_normalized":{"inputs":["kubernetes_events_unnested"],"source":". = {\n  \"run_id\": null,\n  \"node_name\": .items.reportingInstance,\n  \"object_name\": .items.involvedObject.name,\n  \"timestamp\": .items.lastTimestamp,\n  \"message\": .items.message,\n  \"raw\": .\n}\n","type":"remap"},"kubernetes_events_unnested":{"inputs":["kubernetes_events"],"source":". = unnest!(.items)\n","type":"remap"},"vector_agent_route":{"inputs":["vector_agent"],"route":{"logs":{"type":"is_log"},"metrics":{"type":"is_metric"}},"type":"route"}}},"enabled":false,"env":[{"name":"KUBERNETES_SERVICE_ACCOUNT_TOKEN","valueFrom":{"secretKeyRef":{"key":"token","name":"studio-vector-aggregator-token"}}}],"extraObjects":[{"apiVersion":"rbac.authorization.k8s.io/v1","kind":"ClusterRole","metadata":{"annotations":{"helm.sh/hook":"pre-install, pre-upgrade","helm.sh/hook-delete-policy":"hook-failed, before-hook-creation"},"name":"studio-vector-aggregator-extended"},"rules":[{"apiGroups":[""],"resources":["events"],"verbs":["get","list"]}]},{"apiVersion":"rbac.authorization.k8s.io/v1","kind":"ClusterRoleBinding","metadata":{"annotations":{"helm.sh/hook":"pre-install, pre-upgrade","helm.sh/hook-delete-policy":"hook-failed, before-hook-creation"},"name":"studio-vector-aggregator-extended"},"roleRef":{"kind":"ClusterRole","name":"studio-vector-aggregator-extended"},"subjects":[{"kind":"ServiceAccount","name":"studio-vector-aggregator","namespace":"default"}]},{"apiVersion":"v1","kind":"Secret","metadata":{"annotations":{"kubernetes.io/service-account.name":"studio-vector-aggregator"},"name":"studio-vector-aggregator-token"},"type":"kubernetes.io/service-account-token"}],"fullnameOverride":"studio-vector-aggregator","image":{"base":"alpine"},"persistence":{"accessModes":["ReadWriteOnce"],"enabled":true,"size":"128Gi","storageClass":""},"replicaCount":1,"resources":{"limits":{"memory":"512Mi"},"requests":{"cpu":"200m","memory":"256Mi"}},"role":"Aggregator","service":{"enabled":true,"ports":[{"name":"logs","port":6000,"protocol":"TCP","targetPort":6000},{"name":"api","port":8686,"protocol":"TCP","targetPort":8686}],"type":"ClusterIP"},"serviceAccount":{"create":true,"name":"studio-vector-aggregator"}}` | Vector Aggregator configuration for log aggregation and processing |
| vector-aggregator.args | list | `["ash -euc '\n  STORAGE=/data/vector\n  MAXIMUM_SIZE_PERCENT=90\n  OLDEST_MODIFICATION_DAYS=7\n\n  while sleep 60; do\n    echo \"Running garbage collection in $STORAGE\"\n\n    find \"$STORAGE\" -type f -mtime +\"$OLDEST_MODIFICATION_DAYS\" -print -delete |\n    while read file; do\n      echo \"Deleting file because is older than $OLDEST_MODIFICATION_DAYS days: $file\"\n    done\n\n    until test \"$(df \"$STORAGE\" | awk \"NR==2{print \\$5}\" | tr -d %)\" -lt \"$MAXIMUM_SIZE_PERCENT\"; do\n      oldest_file=$(find \"$STORAGE\" -type f -print0 | xargs -0 -n 128 stat -c \"%Y %n\" | sort -n | cut -d\" \" -f2- | head -n1)\n      echo \"Deleting file because is the oldest and storage is more than $MAXIMUM_SIZE_PERCENT% full: $oldest_file\"\n      rm \"$oldest_file\"\n    done\n  done\n' & GARBAGECOLLECT=$!\n\n/usr/local/bin/vector --config-dir /etc/vector/ & VECTOR=$!\n\nwait -n $VECTOR $GARBAGECOLLECT"]` | Vector arguments. |
| vector-aggregator.command | list | `["/bin/ash","-euc"]` | Vector command. |
| vector-aggregator.customConfig | object | `{"api":{"address":"0.0.0.0:8686","enabled":true,"playground":true},"data_dir":"/data/vector","expire_metrics_secs":60,"sinks":{"events_file":{"encoding":{"codec":"json"},"inputs":["kubernetes_events_deduped"],"path":"/data/vector/events/%Y-%m-%d.log","type":"file"},"logs_file":{"encoding":{"codec":"json"},"inputs":["vector_agent_route.logs"],"path":"/data/vector/logs/%Y-%m-%d-{{ \"{{\" }} .kubernetes.pod_name {{ \"}}\" }}.log","type":"file"},"metrics_file":{"encoding":{"codec":"json"},"inputs":["vector_agent_route.metrics"],"path":"/data/vector/metrics/%Y-%m-%d.log","type":"file"}},"sources":{"kubernetes_events":{"auth":{"strategy":"bearer","token":"${KUBERNETES_SERVICE_ACCOUNT_TOKEN:?}"},"decoding":{"codec":"json"},"endpoint":"https://kubernetes.default.svc:443/api/v1/events","headers":{"Accept":["application/json"]},"scrape_interval_secs":30,"tls":{"ca_file":"/var/run/secrets/kubernetes.io/serviceaccount/ca.crt"},"type":"http_client"},"vector_agent":{"address":"0.0.0.0:6000","type":"vector","version":"2"}},"transforms":{"kubernetes_events_deduped":{"fields":{"match":["node_name","object_name","message","timestamp"]},"inputs":["kubernetes_events_normalized"],"type":"dedupe"},"kubernetes_events_normalized":{"inputs":["kubernetes_events_unnested"],"source":". = {\n  \"run_id\": null,\n  \"node_name\": .items.reportingInstance,\n  \"object_name\": .items.involvedObject.name,\n  \"timestamp\": .items.lastTimestamp,\n  \"message\": .items.message,\n  \"raw\": .\n}\n","type":"remap"},"kubernetes_events_unnested":{"inputs":["kubernetes_events"],"source":". = unnest!(.items)\n","type":"remap"},"vector_agent_route":{"inputs":["vector_agent"],"route":{"logs":{"type":"is_log"},"metrics":{"type":"is_metric"}},"type":"route"}}}` | Vector Aggregator configuration |
| vector-aggregator.enabled | bool | `false` | Vector Aggregator enabled |
| vector-aggregator.fullnameOverride | string | `"studio-vector-aggregator"` | Vector Aggregator name override |
| vector-aggregator.image.base | string | `"alpine"` | The base to use for Vector's image. |
| vector-aggregator.persistence | object | `{"accessModes":["ReadWriteOnce"],"enabled":true,"size":"128Gi","storageClass":""}` | Vector Aggregator persistence configuration |
| vector-aggregator.replicaCount | int | `1` | Vector Aggregator replica count |
| vector-aggregator.resources | object | `{"limits":{"memory":"512Mi"},"requests":{"cpu":"200m","memory":"256Mi"}}` | Vector Aggregator resources |
| vector-aggregator.role | string | `"Aggregator"` | Deploy as StatefulSet for aggregation and persistence |
| vector-aggregator.service | object | `{"enabled":true,"ports":[{"name":"logs","port":6000,"protocol":"TCP","targetPort":6000},{"name":"api","port":8686,"protocol":"TCP","targetPort":8686}],"type":"ClusterIP"}` | Vector Aggregator service configuration |
| vector-aggregator.serviceAccount | object | `{"create":true,"name":"studio-vector-aggregator"}` | Vector Aggregator service account |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
