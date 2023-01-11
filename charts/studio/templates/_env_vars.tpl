{{- define "studio.envvars" }}
- name: ALLOWED_HOSTS
  value: "*"

- name: API_URL
{{- if .Values.studioBackend.ingress.enabled }}
{{- range $host := .Values.studioBackend.ingress.hosts }}
  {{- range .paths }}
  value: "http{{ if $.Values.studioBackend.ingress.tls }}s{{ end }}://{{ $host.host }}{{ .path }}"
  {{- end }}
{{- end }}
{{- else }}
  value: "studio-backend.{{ .Release.Namespace }}.svc.cluster.local:{{ .Values.studioBackend.service.port }}"
{{- end }}

- name: UI_URL
{{- if .Values.studioUi.ingress.enabled }}
{{- range $host := .Values.studioUi.ingress.hosts }}
  {{- range .paths }}
  value: "http{{ if $.Values.studioUi.ingress.tls }}s{{ end }}://{{ $host.host }}{{ .path }}"
  {{- end }}
{{- end }}
{{- else }}
  value: "studio-ui.{{ .Release.Namespace }}.svc.cluster.local:{{ .Values.studioUi.service.port }}"
{{- end }}

- name: BITBUCKET_URL
{{- if .Values.global.scmProviders.bitbucket.url }}
  value: {{ .Values.global.scmProviders.bitbucket.url }}
{{- else }}
  value: ""
{{- end }}

- name: BITBUCKET_API_URL
{{- if .Values.global.scmProviders.bitbucket.apiUrl }}
  value: {{ .Values.global.scmProviders.bitbucket.apiUrl }}
{{- else }}
  value: ""
{{- end }}

- name: BITBUCKET_WEBHOOK_URL
{{- if .Values.global.scmProviders.bitbucket.webhookUrl }}
  value: {{ .Values.global.scmProviders.bitbucket.webhookUrl }}
{{- else }}
  value: ""
{{- end }}

- name: BITBUCKET_CLIENT_ID
{{- if .Values.global.scmProviders.bitbucket.clientId }}
  valueFrom:
    secretKeyRef:
      name: studio
      key: bitbucketClientId
{{- else }}
  value: ""
{{- end }}

- name: BITBUCKET_SECRET_KEY
{{- if .Values.global.scmProviders.bitbucket.secretKey }}
  valueFrom:
    secretKeyRef:
      name: studio
      key: bitbucketSecretKey
{{- else }}
  value: ""
{{- end }}

- name: ENABLE_BLOBVAULT
  value: "True"

- name: BLOBVAULT_AWS_ACCESS_KEY_ID
{{- if .Values.global.blobvault.accessKeyId }}
  valueFrom:
    secretKeyRef:
      name: studio
      key: blobvaultAccessKeyId
{{- else }}
  value: ""
{{- end }}

- name: BLOBVAULT_AWS_SECRET_ACCESS_ID
{{- if .Values.global.blobvault.secretAccessKeyId }}
  valueFrom:
    secretKeyRef:
      name: studio
      key: blobvaultSecretAccessKeyId
{{- else }}
  value: ""
{{- end }}

- name: BLOBVAULT_ENDPOINT_URL
{{- if .Values.global.blobvault.endpointUrl }}
  value: {{ .Values.global.blobvault.endpointUrl }}
{{- else }}
  value: "{{ .Values.minio.fullnameOverride }}.{{ .Release.Namespace }}.svc.cluster.local:9000"
{{- end }}

- name: BLOBVAULT_ENDPOINT_URL_FE
{{- if .Values.global.blobvault.endpointUrlFe }}
  value: {{ .Values.global.blobvault.endpointUrlFe }}
{{- else }}
  value: "{{ .Values.minio.fullnameOverride }}.{{ .Release.Namespace }}.svc.cluster.local:9000"
{{- end }}

- name: BLOBVAULT_BUCKET
{{- if .Values.global.blobvault.bucket }}
  value: {{ .Values.global.blobvault.bucket }}
{{- else }}
  value: ""
{{- end }}

- name: CELERY_BROKER_URL
{{- if .Values.global.celery.brokerUrl }}
  value: {{ .Values.global.celery.brokerUrl }}
{{- else }}
  value: "redis://{{ .Values.redis.fullnameOverride }}-master.{{ .Release.Namespace }}.svc.cluster.local:6379"
{{- end }}

- name: CELERY_RESULT_BACKEND
{{- if .Values.global.celery.resultBackend }}
  value: {{ .Values.global.celery.resultBackend }}
{{- else }}
  value: "redis://{{ .Values.redis.fullnameOverride }}-master.{{ .Release.Namespace }}.svc.cluster.local:6379"
{{- end }}

- name: REDIS_URL
{{- if .Values.global.celery.resultBackend }}
  value: {{ .Values.global.celery.resultBackend }}
{{- else }}
  value: "redis://{{ .Values.redis.fullnameOverride }}-master.{{ .Release.Namespace }}.svc.cluster.local:6379"
{{- end }}

- name: DATABASE_URL
  value: "psql://{{ .Values.global.postgres.databaseUser}}:{{ .Values.global.postgres.databasePassword }}@{{ .Values.global.postgres.databaseUrl }}"

- name: SECRET_KEY
  valueFrom:
    secretKeyRef:
      name: studio
      key: secretKey

- name: GITHUB_APP_ID
{{- if .Values.global.scmProviders.github.appId }}
  valueFrom:
    secretKeyRef:
      name: studio
      key: githubAppId
{{- else }}
  value: ""
{{- end }}

- name: GITHUB_APP_CLIENT_ID
{{- if .Values.global.scmProviders.github.clientId }}
  valueFrom:
    secretKeyRef:
      name: studio
      key: githubClientId
{{- else }}
  value: ""
{{- end }}

- name: GITHUB_APP_SECRET_KEY
{{- if .Values.global.scmProviders.github.appSecret }}
  valueFrom:
    secretKeyRef:
      name: studio
      key: githubAppSecret
{{- else }}
  value: ""
{{- end }}

- name: GITHUB_APP_PRIVATE_KEY_PEM
{{- if .Values.global.scmProviders.github.privateKey }}
  valueFrom:
    secretKeyRef:
      name: studio
      key: githubPrivateKey
{{- else }}
  value: ""
{{- end }}

- name: GITHUB_WEBHOOK_SECRET
{{- if .Values.global.scmProviders.github.webhookSecret }}
  valueFrom:
    secretKeyRef:
      name: studio
      key: githubWebhookSecret
{{- else }}
  value: ""
{{- end }}

- name: GITHUB_URL
{{- if .Values.global.scmProviders.github.url }}
  value: {{ .Values.global.scmProviders.github.url }}
{{- else }}
  value: ""
{{- end }}

- name: GITHUB_WEBHOOK_URL
{{- if .Values.global.scmProviders.github.webhookUrl }}
  value: {{ .Values.global.scmProviders.github.webhookUrl }}
{{- else }}
  value: ""
{{- end }}

- name: GITLAB_CLIENT_ID
{{- if .Values.global.scmProviders.gitlab.clientId }}
  valueFrom:
    secretKeyRef:
      name: studio
      key: gitlabClientId
{{- else }}
  value: ""
{{- end }}

- name: GITLAB_SECRET_KEY
{{- if .Values.global.scmProviders.gitlab.secretKey }}
  valueFrom:
    secretKeyRef:
      name: studio
      key: gitlabSecretKey
{{- else }}
  value: ""
{{- end }}

- name: GITLAB_WEBHOOK_SECRET
{{- if .Values.global.scmProviders.gitlab.webhookSecret }}
  valueFrom:
    secretKeyRef:
      name: studio
      key: gitlabWebhookSecret
{{- else }}
  value: ""
{{- end }}

- name: GITLAB_URL
{{- if .Values.global.scmProviders.gitlab.url }}
  value: {{ .Values.global.scmProviders.gitlab.url }}
{{- else }}
  value: ""
{{- end }}

- name: GITLAB_WEBHOOK_URL
{{- if .Values.global.scmProviders.gitlab.webhookUrl }}
  value: {{ .Values.global.scmProviders.gitlab.webhookUrl }}
{{- else }}
  value: ""
{{- end }}

- name: MAX_VIEWS
{{- if .Values.global.maxViews }}
  value: {{ .Values.global.maxViews | quote }}
{{- else }}
  value: ""
{{- end }}

- name: MAX_TEAMS
{{- if .Values.global.maxTeams }}
  value: {{ .Values.global.maxTeams | quote }}
{{- else }}
  value: ""
{{- end }}

- name: SOCIAL_AUTH_REDIRECT_IS_HTTPS
  value: "False"

- name: SOCIAL_AUTH_ALLOWED_REDIRECT_HOSTS
{{- if .Values.studioUi.ingress.enabled }}
{{- range $host := .Values.studioUi.ingress.hosts }}
  {{- range .paths }}
  value: "studio-ui.{{ .Release.Namespace }}.svc.cluster.local:{{ .Values.studioUi.service.port }},studio-backend.{{ .Release.Namespace }}.svc.cluster.local:{{ .Values.studioBackend.service.port }},http{{ if $.Values.studioUi.ingress.tls }}s{{ end }}://{{ $host.host }}{{ .path }}"
  {{- end }}
{{- end }}
{{- else }}
  value: "studio-ui.{{ .Release.Namespace }}.svc.cluster.local:{{ .Values.studioUi.service.port }},studio-backend.{{ .Release.Namespace }}.svc.cluster.local:{{ .Values.studioBackend.service.port }}"
{{- end }}

{{- end }}