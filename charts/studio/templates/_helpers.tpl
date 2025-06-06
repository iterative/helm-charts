{{/*
Expand the name of the chart.
*/}}
{{- define "studio.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "studio.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "studio.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}

{{- define "studio.labels" -}}
helm.sh/chart: {{ include "studio.chart" . }}
{{ include "studio.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "studio-beat.labels" -}}
helm.sh/chart: {{ include "studio.chart" . }}
{{ include "studio-beat.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "studio-datachain-worker.labels" -}}
helm.sh/chart: {{ include "studio.chart" . }}
{{ include "studio-datachain-worker.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "studio-worker.labels" -}}
helm.sh/chart: {{ include "studio.chart" . }}
{{ include "studio-worker.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "studio-backend.labels" -}}
helm.sh/chart: {{ include "studio.chart" . }}
{{ include "studio-backend.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "studio-datachain-api.labels" -}}
helm.sh/chart: {{ include "studio.chart" . }}
{{ include "studio-datachain-api.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "studio-ui.labels" -}}
helm.sh/chart: {{ include "studio.chart" . }}
{{ include "studio-ui.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "studio-blobvault.labels" -}}
helm.sh/chart: {{ include "studio.chart" . }}
{{ include "studio-blobvault.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "studio-pypi-cache.labels" -}}
helm.sh/chart: {{ include "studio.chart" . }}
{{ include "studio-pypi-cache.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "pgbouncer.labels" -}}
helm.sh/chart: {{ include "studio.chart" . }}
{{ include "pgbouncer.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}

{{- define "studio.selectorLabels" -}}
app.kubernetes.io/name: {{ include "studio.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "studio-blobvault.selectorLabels" -}}
app.kubernetes.io/name: studio-blobvault
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "studio-pypi-cache.selectorLabels" -}}
app.kubernetes.io/name: studio-pypi-cache
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "studio-backend.selectorLabels" -}}
app.kubernetes.io/name: studio-backend
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "studio-datachain-api.selectorLabels" -}}
app.kubernetes.io/name: studio-datachain-api
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "studio-beat.selectorLabels" -}}
app.kubernetes.io/name: studio-beat
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "studio-datachain-worker.selectorLabels" -}}
app.kubernetes.io/name: studio-datachain-worker
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "studio-ui.selectorLabels" -}}
app.kubernetes.io/name: studio-ui
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "studio-worker.selectorLabels" -}}
app.kubernetes.io/name: studio-worker
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "pgbouncer.selectorLabels" -}}
app.kubernetes.io/name: pgbouncer
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}


{{/*
Create the name of the service account to use
*/}}
{{- define "studio.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "studio.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "studio-backend.serviceAccountName" -}}
{{- if ((.Values.studioBackend).serviceAccount).create }}
{{- default (printf "%s%s" (include "studio.fullname" .) "-backend") .Values.studioWorker.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.studioWorker.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "studio-worker.serviceAccountName" -}}
{{- if ((.Values.studioWorker).serviceAccount).create }}
{{- default (printf "%s%s" (include "studio.fullname" .) "-worker") .Values.studioWorker.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.studioWorker.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "studio-datachain-worker.serviceAccountName" -}}
{{- if ((.Values.studioDatachainWorker).serviceAccount).create }}
{{- default (printf "%s%s" (include "studio.fullname" .) "-datachain-worker") .Values.studioDatachainWorker.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.studioDatachainWorker.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "studio.checksum" }}
checksum/configmap-studio: {{ include (print $.Template.BasePath "/configmap-studio.yaml") . | sha256sum }}
checksum/configmap-ca-cert: {{ include (print $.Template.BasePath "/configmap-ca-cert.yaml") . | sha256sum }}
checksum/secret-studio: {{ include (print $.Template.BasePath "/secret-studio.yaml") . | sha256sum }}
{{- end }}


{{- define "studio.basePath" -}}
{{- printf "%s" .Values.global.basePath | trimPrefix "/" | trimSuffix "/" }}
{{- end }}

{{- define "ciDockerConfig" -}}
{{- printf "{\"auths\": {\"%s\": {\"auth\": \"%s\"}}}" .Values.dockerServer (printf "%s:%s" .Values.dockerUsername .Values.dockerPassword | b64enc) }}
{{- end }}

{{- define "scheme" -}}
http{{- if $.Values.global.ingress.tlsEnabled }}s{{- end }}
{{- end }}

{{- define "webhookScheme" -}}
{{- if $.Values.global.scmProviders.webhookHost -}}
http{{- if $.Values.global.scmProviders.tlsEnabled }}s{{- end }}
{{- else -}}
http{{- if $.Values.global.ingress.tlsEnabled }}s{{- end }}
{{- end -}}
{{- end }}
