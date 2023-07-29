# studio

![Version: 0.2.18](https://img.shields.io/badge/Version-0.2.18-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v2.9.1](https://img.shields.io/badge/AppVersion-v2.9.1-informational?style=flat-square)

A Helm chart for Kubernetes

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| iterative | <support@iterative.ai> |  |

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | nginx | 13.2.30 |
| https://charts.bitnami.com/bitnami | postgresql | 11.9.13 |
| https://charts.bitnami.com/bitnami | redis | 17.14.3 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| global.basePath | string | `""` | Studio: Base path (prefix) |
| global.blobvault.accessKeyId | string | `""` | Blobvault S3 access key ID |
| global.blobvault.bucket | string | `""` | Blobvault S3 bucket name |
| global.blobvault.endpointUrl | string | `""` | Blobvault S3 endpoint URL |
| global.blobvault.persistentVolume | object | `{"accessModes":["ReadWriteOnce"],"size":"30Gi","storageClassName":""}` | Blobvault local backing store settings. |
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
| global.scmProviders.bitbucket | object | `{"apiUrl":"","clientId":"","enabled":false,"secretKey":"","url":"","webhookUrl":""}` | BitBucket App integration with Studio. |
| global.scmProviders.bitbucket.apiUrl | string | `""` | Bitbucket Server API URL Set this if you're using the selfhosted version |
| global.scmProviders.bitbucket.clientId | string | `""` | Bitbucket OAuth App Client ID |
| global.scmProviders.bitbucket.enabled | bool | `false` | Bitbucket enabled |
| global.scmProviders.bitbucket.secretKey | string | `""` | Bitbucket OAuth App Secret Key |
| global.scmProviders.bitbucket.url | string | `""` | Bitbucket Server URL Set this if you're using the selfhosted version |
| global.scmProviders.bitbucket.webhookUrl | DEPRECATED | `""` | BitBucket Webhook URL |
| global.scmProviders.github | object | `{"apiUrl":"","appId":"","appName":"","clientId":"","clientSecret":"","enabled":false,"privateKey":"","url":"","webhookUrl":""}` | GitHub App integration with Studio. |
| global.scmProviders.github.apiUrl | string | `""` | GitHub Enterprise API URL Set this if you're using the selfhosted version |
| global.scmProviders.github.appId | string | `""` | GitHub OAuth App ID |
| global.scmProviders.github.appName | string | `""` | GitHub OAuth App Name |
| global.scmProviders.github.clientId | string | `""` | GitHub OAuth App Client ID |
| global.scmProviders.github.clientSecret | string | `""` | GitHub OAuth App Secret |
| global.scmProviders.github.enabled | bool | `false` | GitHub enabled |
| global.scmProviders.github.privateKey | string | `""` | GitHub OAuth App Private Key |
| global.scmProviders.github.url | string | `""` | GitHub Enterprise URL Set this if you're using the selfhosted version |
| global.scmProviders.github.webhookUrl | DEPRECATED | `""` | GitHub Webhook URL |
| global.scmProviders.gitlab | object | `{"clientId":"","enabled":false,"secretKey":"","url":"","webhookSecret":"","webhookUrl":""}` | GitLab App integration with Studio. |
| global.scmProviders.gitlab.clientId | string | `""` | GitLab OAuth App Client ID |
| global.scmProviders.gitlab.enabled | bool | `false` | GitLab enabled |
| global.scmProviders.gitlab.secretKey | string | `""` | GitLab OAuth App Secret Key |
| global.scmProviders.gitlab.url | string | `""` | GitLab Enterprise Edition URL Set this if you're using the selfhosted version |
| global.scmProviders.gitlab.webhookSecret | string | `""` | GitLab Webhook Secret |
| global.scmProviders.gitlab.webhookUrl | DEPRECATED | `""` | GitLab Webhook URL |
| global.scmProviders.webhookHost | string | `$global.host` value. | Custom hostname for incoming webhook (if Studio runs on a private network and you use SaaS versions of GitHub, GitLab, or Bitbucket) |
| global.secretKey | string | `""` | Studio: Secret key for signing Webhook payloads We recommend you set this externally. If left empty, a random key will be generated. |
| imagePullSecrets | list | `[]` | Secret containing Docker registry credentials |
| nginx.extraVolumeMounts[0].mountPath | string | `"/blobvault"` |  |
| nginx.extraVolumeMounts[0].name | string | `"blobvault"` |  |
| nginx.extraVolumes[0].name | string | `"blobvault"` |  |
| nginx.extraVolumes[0].persistentVolumeClaim.claimName | string | `"blobvault"` |  |
| nginx.ingress.enabled | bool | `false` |  |
| nginx.serverBlock | string | `"server {\n    listen       8080;\n    server_name  _;\n\n    root /blobvault;\n\n    location ~ \\.gz$ {\n        if ($request_method = 'OPTIONS') {\n            add_header 'Access-Control-Allow-Origin' '*';\n            #\n            # Cookies\n            #\n            add_header 'Access-Control-Allow-Credentials' 'true';\n            add_header 'Access-Control-Allow-Methods' 'GET, POST, OPTIONS';\n            #\n            # Custom headers and headers various browsers *should* be OK with but aren't\n            #\n            add_header 'Access-Control-Allow-Headers' 'DNT,X-CustomHeader,Keep-Alive,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,X-Studio-Trace-Id';\n            #\n            # Tell client that this pre-flight info is valid for 20 days\n            #\n            add_header 'Access-Control-Max-Age' 1728000;\n            add_header 'Content-Type' 'text/plain charset=UTF-8';\n            add_header 'Content-Length' 0;\n            return 204;\n        }\n        if ($request_method = 'GET') {\n            add_header 'Access-Control-Allow-Origin' '*';\n            add_header 'Access-Control-Allow-Credentials' 'true';\n            add_header 'Access-Control-Allow-Methods' 'GET, POST, OPTIONS';\n            add_header 'Access-Control-Allow-Headers' 'DNT,X-CustomHeader,Keep-Alive,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,X-Studio-Trace-Id';\n            add_header Content-Encoding gzip;\n        }\n        gzip off;\n        types { } default_type \"application/json\";\n    }\n\n\n    location / {\n        if ($request_method = 'OPTIONS') {\n            add_header 'Access-Control-Allow-Origin' '*';\n            #\n            # Cookies\n            #\n            add_header 'Access-Control-Allow-Credentials' 'true';\n            add_header 'Access-Control-Allow-Methods' 'GET, POST, OPTIONS';\n            #\n            # Custom headers and headers various browsers *should* be OK with but aren't\n            #\n            add_header 'Access-Control-Allow-Headers' 'DNT,X-CustomHeader,Keep-Alive,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,X-Studio-Trace-Id';\n            #\n            # Tell client that this pre-flight info is valid for 20 days\n            #\n            add_header 'Access-Control-Max-Age' 1728000;\n            add_header 'Content-Type' 'text/plain charset=UTF-8';\n            add_header 'Content-Length' 0;\n            return 204;\n        }\n        if ($request_method = 'GET') {\n            add_header 'Access-Control-Allow-Origin' '*';\n            add_header 'Access-Control-Allow-Credentials' 'true';\n            add_header 'Access-Control-Allow-Methods' 'GET, POST, OPTIONS';\n            add_header 'Access-Control-Allow-Headers' 'DNT,X-CustomHeader,Keep-Alive,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,X-Studio-Trace-Id';\n        }\n\n        try_files $uri $uri/ =404;\n    }\n}"` |  |
| nginx.service.type | string | `"ClusterIP"` |  |
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
| studioBackend.affinity | object | `{}` |  |
| studioBackend.autoscaling.enabled | bool | `false` |  |
| studioBackend.autoscaling.maxReplicas | int | `5` |  |
| studioBackend.autoscaling.minReplicas | int | `1` |  |
| studioBackend.autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| studioBackend.envFromSecret | string | `""` | Studio: The name of an existing Secret that contains sensitive environment variables passed to backend pods. |
| studioBackend.envVars | object | `{}` | Studio: Additional environment variables for backend pods |
| studioBackend.fullnameOverride | string | `""` |  |
| studioBackend.image.pullPolicy | string | `"IfNotPresent"` |  |
| studioBackend.image.repository | string | `"docker.iterative.ai/studio-backend"` |  |
| studioBackend.nameOverride | string | `""` |  |
| studioBackend.nodeSelector | object | `{}` |  |
| studioBackend.podAnnotations | object | `{}` |  |
| studioBackend.podSecurityContext | object | `{}` |  |
| studioBackend.replicaCount | int | `1` |  |
| studioBackend.resources.limits.cpu | string | `"1000m"` |  |
| studioBackend.resources.limits.memory | string | `"2Gi"` |  |
| studioBackend.resources.requests.cpu | string | `"500m"` |  |
| studioBackend.resources.requests.memory | string | `"1Gi"` |  |
| studioBackend.securityContext | object | `{}` |  |
| studioBackend.service.port | int | `8000` |  |
| studioBackend.service.type | string | `"ClusterIP"` |  |
| studioBackend.tolerations | list | `[]` |  |
| studioBeat.affinity | object | `{}` |  |
| studioBeat.autoscaling.enabled | bool | `false` |  |
| studioBeat.autoscaling.maxReplicas | int | `5` |  |
| studioBeat.autoscaling.minReplicas | int | `1` |  |
| studioBeat.autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| studioBeat.envFromSecret | string | `""` | Studio: The name of an existing Secret that contains sensitive environment variables passed to beat pods. |
| studioBeat.envVars | object | `{}` | Studio: Additional environment variables for beat pods |
| studioBeat.fullnameOverride | string | `""` |  |
| studioBeat.nameOverride | string | `""` |  |
| studioBeat.nodeSelector | object | `{}` |  |
| studioBeat.podAnnotations | object | `{}` |  |
| studioBeat.podSecurityContext | object | `{}` |  |
| studioBeat.replicaCount | int | `1` |  |
| studioBeat.resources.limits.cpu | string | `"200m"` |  |
| studioBeat.resources.limits.memory | string | `"256Mi"` |  |
| studioBeat.resources.requests.cpu | string | `"100m"` |  |
| studioBeat.resources.requests.memory | string | `"128Mi"` |  |
| studioBeat.securityContext | object | `{}` |  |
| studioBeat.tolerations | list | `[]` |  |
| studioUi.affinity | object | `{}` |  |
| studioUi.autoscaling.enabled | bool | `false` |  |
| studioUi.autoscaling.maxReplicas | int | `5` |  |
| studioUi.autoscaling.minReplicas | int | `1` |  |
| studioUi.autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| studioUi.envFromSecret | string | `""` | Studio: The name of an existing Secret that contains sensitive environment variables passed to UI pods. |
| studioUi.envVars | object | `{}` | Studio: Additional environment variables for ui pods |
| studioUi.fullnameOverride | string | `""` |  |
| studioUi.image.pullPolicy | string | `"IfNotPresent"` |  |
| studioUi.image.repository | string | `"docker.iterative.ai/studio-frontend"` |  |
| studioUi.nameOverride | string | `""` |  |
| studioUi.nodeSelector | object | `{}` |  |
| studioUi.podAnnotations | object | `{}` |  |
| studioUi.podSecurityContext | object | `{}` |  |
| studioUi.replicaCount | int | `1` |  |
| studioUi.resources.limits.cpu | string | `"1000m"` |  |
| studioUi.resources.limits.memory | string | `"2Gi"` |  |
| studioUi.resources.requests.cpu | string | `"500m"` |  |
| studioUi.resources.requests.memory | string | `"1Gi"` |  |
| studioUi.securityContext | object | `{}` |  |
| studioUi.service.port | int | `3000` |  |
| studioUi.service.type | string | `"ClusterIP"` |  |
| studioUi.tolerations | list | `[]` |  |
| studioWorker.affinity | object | `{}` |  |
| studioWorker.autoscaling.enabled | bool | `false` |  |
| studioWorker.autoscaling.maxReplicas | int | `5` |  |
| studioWorker.autoscaling.minReplicas | int | `1` |  |
| studioWorker.autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| studioWorker.envFromSecret | string | `""` | Studio: The name of an existing Secret that contains sensitive environment variables passed to worker pods. |
| studioWorker.envVars | object | `{}` | Studio: Additional environment variables for worker pods |
| studioWorker.fullnameOverride | string | `""` |  |
| studioWorker.nameOverride | string | `""` |  |
| studioWorker.nodeSelector | object | `{}` |  |
| studioWorker.podAnnotations | object | `{}` |  |
| studioWorker.podSecurityContext | object | `{}` |  |
| studioWorker.replicaCount | int | `1` |  |
| studioWorker.resources.limits.cpu | string | `"1000m"` |  |
| studioWorker.resources.limits.memory | string | `"1Gi"` |  |
| studioWorker.resources.requests.cpu | string | `"500m"` |  |
| studioWorker.resources.requests.memory | string | `"512Mi"` |  |
| studioWorker.securityContext | object | `{}` |  |
| studioWorker.tolerations | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
