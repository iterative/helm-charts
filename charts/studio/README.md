# studio

![Version: 0.15.0](https://img.shields.io/badge/Version-0.15.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v2.123.2](https://img.shields.io/badge/AppVersion-v2.123.2-informational?style=flat-square)

A Helm chart for Kubernetes

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| iterative | <support@iterative.ai> |  |

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | clickhouse | 6.2.0 |
| https://charts.bitnami.com/bitnami | postgresql | 15.5.4 |
| https://charts.bitnami.com/bitnami | redis | 19.5.2 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| clickhouse.auth.password | string | `"clickhouse"` | ClickHouse password |
| clickhouse.enabled | bool | `false` | ClickHouse enabled |
| clickhouse.fullnameOverride | string | `"studio-clickhouse"` | ClickHouse name override |
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
| global.dvcx | object | `{}` | Studio: Settings related to DVCX |
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
| global.secretKey | string | `""` | Studio: Secret key for signing Webhook payloads We recommend you set this externally. If left empty, a random key will be generated. |
| imagePullSecrets | list | `[]` | Secret containing Docker registry credentials |
| pgBouncer | object | `{"affinity":{},"autoscaling":{"enabled":false,"maxReplicas":5,"minReplicas":1,"targetCPUUtilizationPercentage":80},"enabled":false,"envFromSecret":"","envVars":{},"image":{"pullPolicy":"IfNotPresent","repository":"docker.io/bitnami/pgbouncer","tag":"1.22.1"},"nodeSelector":{},"podAnnotations":{},"podSecurityContext":{},"replicaCount":1,"resources":{"limits":{"memory":"1024Mi"},"requests":{"cpu":"500m","memory":"512Mi"}},"securityContext":{},"service":{"port":6432,"type":"ClusterIP"},"serviceAccountName":"","tolerations":[]}` | PgBouncer settings group |
| pgBouncer.affinity | object | `{}` | PgBouncer pod affinity configuration |
| pgBouncer.autoscaling | object | `{"enabled":false,"maxReplicas":5,"minReplicas":1,"targetCPUUtilizationPercentage":80}` | PgBouncer autoscaling configuration |
| pgBouncer.autoscaling.enabled | bool | `false` | PgBouncer autoscaling enabled flag |
| pgBouncer.autoscaling.maxReplicas | int | `5` | PgBouncer autoscaling max replicas |
| pgBouncer.autoscaling.minReplicas | int | `1` | PgBouncer autoscaling min replicas |
| pgBouncer.autoscaling.targetCPUUtilizationPercentage | int | `80` | PgBouncer autoscaling target CPU utilization percentage |
| pgBouncer.envFromSecret | string | `""` | The name of an existing Secret that contains sensitive environment variables passed to DVCx worker pods. |
| pgBouncer.envVars | object | `{}` | Additional environment variables for PgBouncer pods |
| pgBouncer.image | object | `{"pullPolicy":"IfNotPresent","repository":"docker.io/bitnami/pgbouncer","tag":"1.22.1"}` | PgBouncer image settings |
| pgBouncer.image.pullPolicy | string | `"IfNotPresent"` | PgBouncer image pull policy |
| pgBouncer.image.repository | string | `"docker.io/bitnami/pgbouncer"` | PgBouncer image repository |
| pgBouncer.image.tag | string | `"1.22.1"` | PgBouncer image tag |
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
| redis.auth | object | `{"enabled":false}` | Redis authentication settings |
| redis.auth.enabled | bool | `false` | Redis authentication disabled |
| redis.commonConfiguration | string | `"timeout 20"` | Redis common configuration to be added into the ConfigMap |
| redis.enabled | bool | `true` | Redis enabled |
| redis.fullnameOverride | string | `"studio-redis"` | Redis name override |
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
| studioBackend | object | `{"affinity":{},"autoscaling":{"enabled":false,"maxReplicas":5,"minReplicas":1,"targetCPUUtilizationPercentage":80},"envFromSecret":"","envVars":{},"image":{"pullPolicy":"IfNotPresent","repository":"docker.iterative.ai/studio-backend"},"nodeSelector":{},"podAnnotations":{},"podSecurityContext":{},"replicaCount":1,"resources":{"limits":{"memory":"2Gi"},"requests":{"cpu":"500m","memory":"1Gi"}},"securityContext":{},"service":{"port":8000,"type":"ClusterIP"},"strategy":{"rollingUpdate":{"maxSurge":1,"maxUnavailable":0}},"tolerations":[]}` | Studio Backend settings group |
| studioBackend.envFromSecret | string | `""` | The name of an existing Secret that contains sensitive environment variables passed to backend pods. |
| studioBackend.envVars | object | `{}` | Additional environment variables for backend pods |
| studioBackend.replicaCount | int | `1` | Number of replicas of backend pods |
| studioBeat | object | `{"affinity":{},"autoscaling":{"enabled":false,"maxReplicas":5,"minReplicas":1,"targetCPUUtilizationPercentage":80},"envFromSecret":"","envVars":{},"nodeSelector":{},"podAnnotations":{},"podSecurityContext":{},"replicaCount":1,"resources":{"limits":{"memory":"256Mi"},"requests":{"cpu":"100m","memory":"128Mi"}},"securityContext":{},"strategy":{"rollingUpdate":{"maxSurge":1,"maxUnavailable":0}},"tolerations":[]}` | Studio Beat settings group |
| studioBeat.envFromSecret | string | `""` | The name of an existing Secret that contains sensitive environment variables passed to beat pods. |
| studioBeat.envVars | object | `{}` | Additional environment variables for beat pods |
| studioBlobvault | object | `{"image":{"repository":"nginx","tag":"1.27.0-alpine"},"podSecurityContext":{},"securityContext":{},"service":{"port":80}}` | Studio: Additional service to expose the blobvault files generated by the worker It is enabled automatically if the worker is scaled to 1 replica and no bucket is configured |
| studioBlobvault.image | object | `{"repository":"nginx","tag":"1.27.0-alpine"}` | Image to use for the blobvault service |
| studioBlobvault.image.repository | string | `"nginx"` | Image repository |
| studioBlobvault.image.tag | string | `"1.27.0-alpine"` | Image tag |
| studioDvcxWorker | object | `{"affinity":{},"autoscaling":{"annotations":{},"behavior":{},"enabled":false,"maxReplicas":5,"minReplicas":1,"targetCPUUtilizationPercentage":80,"template":[]},"envFromSecret":"","envVars":{},"ephemeralStorage":{"persistentVolumeClaim":{"claimName":"dvcx-worker","storageClass":""},"size":"20Gi","type":"ephemeral"},"image":{"pullPolicy":"IfNotPresent","repository":"docker.iterative.ai/studio-dvcx-worker"},"logLevel":"info","nodeSelector":{},"podAnnotations":{},"podSecurityContext":{},"replicaCount":1,"resources":{"limits":{"ephemeral-storage":"20Gi","memory":"16Gi"},"requests":{"cpu":"1000m","ephemeral-storage":"10Gi","memory":"3Gi"}},"securityContext":{},"serviceAccount":{"annotations":{},"create":false,"name":""},"strategy":{"rollingUpdate":{"maxSurge":1,"maxUnavailable":0}},"tolerations":[]}` | Studio DVCx Worker settings group |
| studioDvcxWorker.affinity | object | `{}` | DVCx worker pod affinity configuration |
| studioDvcxWorker.autoscaling | object | `{"annotations":{},"behavior":{},"enabled":false,"maxReplicas":5,"minReplicas":1,"targetCPUUtilizationPercentage":80,"template":[]}` | DVCx worker autoscaling configuration |
| studioDvcxWorker.autoscaling.annotations | object | `{}` | Worker autoscaling annotation |
| studioDvcxWorker.autoscaling.behavior | object | `{}` | DVCx worker autoscaling behavior |
| studioDvcxWorker.autoscaling.enabled | bool | `false` | DVCx worker autoscaling enabled flag |
| studioDvcxWorker.autoscaling.maxReplicas | int | `5` | DVCx worker autoscaling max replicas |
| studioDvcxWorker.autoscaling.minReplicas | int | `1` | DVCx worker autoscaling min replicas |
| studioDvcxWorker.autoscaling.targetCPUUtilizationPercentage | int | `80` | DVCx worker autoscaling target CPU utilization percentage |
| studioDvcxWorker.autoscaling.template | list | `[]` | DVCx worker Custom or additional autoscaling metrics Custom or additional autoscaling metrics ref: https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/#support-for-custom-metrics |
| studioDvcxWorker.envFromSecret | string | `""` | The name of an existing Secret that contains sensitive environment variables passed to DVCx worker pods. |
| studioDvcxWorker.envVars | object | `{}` | Additional environment variables for DVCx worker pods |
| studioDvcxWorker.ephemeralStorage | object | `{"persistentVolumeClaim":{"claimName":"dvcx-worker","storageClass":""},"size":"20Gi","type":"ephemeral"}` | Ephemeral storage configuration |
| studioDvcxWorker.ephemeralStorage.persistentVolumeClaim | object | `{"claimName":"dvcx-worker","storageClass":""}` | Persistent Volume Claim configuration for ephemeral storage (if type is set `pvc`) |
| studioDvcxWorker.ephemeralStorage.persistentVolumeClaim.claimName | string | `"dvcx-worker"` | Persistent Volume Claim name, to mount externally managed PVC (`ephemeralStorage.type` has to be set to `pvc`) |
| studioDvcxWorker.ephemeralStorage.persistentVolumeClaim.storageClass | string | `""` | Persistent Volume Claim `storageClass` name, by default it will use the default `storageClass`(not used when `pvc` is set as type) |
| studioDvcxWorker.ephemeralStorage.size | string | `"20Gi"` | Ephemeral Storage size |
| studioDvcxWorker.ephemeralStorage.type | string | `"ephemeral"` | Ephemeral Storage type. Possible values: `emptyDir`,  `ephemeral`, `pvc`, `pvcRWX` |
| studioDvcxWorker.image | object | `{"pullPolicy":"IfNotPresent","repository":"docker.iterative.ai/studio-dvcx-worker"}` | DVCx worker image settings |
| studioDvcxWorker.image.pullPolicy | string | `"IfNotPresent"` | DVCx worker image pull policy |
| studioDvcxWorker.image.repository | string | `"docker.iterative.ai/studio-dvcx-worker"` | DVCx worker image repository |
| studioDvcxWorker.logLevel | string | `"info"` | DVCx worker log level |
| studioDvcxWorker.nodeSelector | object | `{}` | DVCx worker pod node selector configuration |
| studioDvcxWorker.podAnnotations | object | `{}` | Additional DVCx worker pod annotations |
| studioDvcxWorker.podSecurityContext | object | `{}` | DVCx worker pod security context configuration |
| studioDvcxWorker.resources | object | `{"limits":{"ephemeral-storage":"20Gi","memory":"16Gi"},"requests":{"cpu":"1000m","ephemeral-storage":"10Gi","memory":"3Gi"}}` | DVCx worker resources configuration |
| studioDvcxWorker.resources.limits | object | `{"ephemeral-storage":"20Gi","memory":"16Gi"}` | DVCx worker limits configuration |
| studioDvcxWorker.resources.requests | object | `{"cpu":"1000m","ephemeral-storage":"10Gi","memory":"3Gi"}` | DVCx worker requests configuration |
| studioDvcxWorker.securityContext | object | `{}` | DVCx worker pod security context configuration |
| studioDvcxWorker.strategy | object | `{"rollingUpdate":{"maxSurge":1,"maxUnavailable":0}}` | DVCx worker deployment strategy |
| studioDvcxWorker.tolerations | list | `[]` | DVCx worker pod tolerations configuration |
| studioUi | object | `{"affinity":{},"autoscaling":{"enabled":false,"maxReplicas":5,"minReplicas":1,"targetCPUUtilizationPercentage":80},"envFromSecret":"","envVars":{},"image":{"pullPolicy":"IfNotPresent","repository":"docker.iterative.ai/studio-frontend"},"nodeSelector":{},"podAnnotations":{},"podSecurityContext":{},"replicaCount":1,"resources":{"limits":{"memory":"2Gi"},"requests":{"cpu":"500m","memory":"1Gi"}},"securityContext":{},"service":{"port":3000,"type":"ClusterIP"},"strategy":{"rollingUpdate":{"maxSurge":1,"maxUnavailable":0}},"tolerations":[]}` | Studio UI settings group |
| studioUi.envFromSecret | string | `""` | The name of an existing Secret that contains sensitive environment variables passed to UI pods. |
| studioUi.envVars | object | `{}` | Additional environment variables for ui pods |
| studioWorker | object | `{"affinity":{},"autoscaling":{"annotations":{},"behavior":{},"enabled":false,"maxReplicas":5,"minReplicas":1,"template":[]},"envFromSecret":"","envVars":{},"ephemeralStorage":{"persistentVolumeClaim":{"claimName":"worker","storageClass":""},"size":"1Gi","type":"ephemeral"},"image":{"pullPolicy":"IfNotPresent","repository":"docker.iterative.ai/studio-backend"},"logLevel":"info","nodeSelector":{},"podAnnotations":{},"podSecurityContext":{},"replicaCount":1,"resources":{"limits":{"memory":"1Gi"},"requests":{"cpu":"500m","memory":"512Mi"}},"securityContext":{},"serviceAccount":{"annotations":{},"create":false,"name":""},"strategy":{"rollingUpdate":{"maxSurge":1,"maxUnavailable":0}},"tolerations":[]}` | Studio worker settings group |
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
| studioWorker.tolerations | list | `[]` | Worker tolerations |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.13.1](https://github.com/norwoodj/helm-docs/releases/v1.13.1)
