{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "nomidot.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "nomidot.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "nomidot.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "nomidot.labels" -}}
chart: {{ include "nomidot.chart" . }}
<<<<<<< HEAD
<<<<<<< HEAD
=======
{{ include "nomidot.selectorLabels" . }}
>>>>>>> 8ba937f... fv-wip-01
=======
>>>>>>> bd347eb... restructured object labels
{{- if .Chart.AppVersion }}
version: {{ .Chart.AppVersion | quote }}
{{- end }}
managed-by: {{ .Release.Service }}
<<<<<<< HEAD
<<<<<<< HEAD
part-of: {{ include "nomidot.name" . }}
=======
>>>>>>> 8ba937f... fv-wip-01
=======
part-of: {{ include "nomidot.name" . }}
>>>>>>> bd347eb... restructured object labels
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "nomidot.selectorLabels" -}}
app: {{ include "nomidot.name" . }}
{{- end -}}

{{/*
Create unified labels for nomidot components
*/}}

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
{{- define "nomidot.nodewatcher.labels" -}}
{{ include "nomidot.labels" . }}
{{ include "nomidot.nodewatcher.matchLabels" . }}
{{- end -}}

{{- define "nomidot.nodewatcher.matchLabels" -}}
app: {{ .Values.nodewatcher.name }}
{{- end -}}

{{- define "nomidot.frontend.labels" -}}
{{ include "nomidot.labels" . }}
{{ include "nomidot.frontend.matchLabels" . }}
{{- end -}}

{{- define "nomidot.frontend.matchLabels" -}}
app: {{ .Values.frontend.name }}
{{- end -}}

{{- define "nomidot.server.labels" -}}
{{ include "nomidot.labels" . }}
{{ include "nomidot.server.matchLabels" . }}
{{- end -}}

{{- define "nomidot.server.matchLabels" -}}
app: {{ .Values.server.name }}
<<<<<<< HEAD
=======
=======
{{- define "nomidot.nodewatcher.selectorLabels" -}}
chart: {{ include "nomidot.chart" . }}
{{- if .Chart.AppVersion }}
version: {{ .Chart.AppVersion | quote }}
{{- end }}
managed-by: {{ .Release.Service }}
app: {{ include "nomidot.nodewatcher.fullname" . }}
=======
{{- define "nomidot.nodewatcher.labels" -}}
{{ include "nomidot.labels" . }}
{{ include "nomidot.nodewatcher.matchLabels" . }}
>>>>>>> bd347eb... restructured object labels
{{- end -}}

{{- define "nomidot.nodewatcher.matchLabels" -}}
app: {{ .Values.nodewatcher.name }}
{{- end -}}

>>>>>>> 35317fc... added nodewatcher deployemten
{{- define "nomidot.frontend.labels" -}}
{{ include "nomidot.labels" . }}
{{ include "nomidot.frontend.matchLabels" . }}
{{- end -}}

{{- define "nomidot.frontend.matchLabels" -}}
<<<<<<< HEAD
component: {{ .Values.frontend.name | quote }}
{{ include "nomidot.selectorLabels" . }}
>>>>>>> 8ba937f... fv-wip-01
=======
app: {{ .Values.frontend.name }}
>>>>>>> bd347eb... restructured object labels
=======
>>>>>>> 6233916... added server deployemten
{{- end -}}

{{- define "nomidot.frontend.fullname" -}}
{{- if .Values.frontend.fullnameOverride -}}
{{- .Values.frontend.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.frontend.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.frontend.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}
<<<<<<< HEAD
<<<<<<< HEAD
  
{{- define "nomidot.nodewatcher.fullname" -}}
{{- if .Values.nodewatcher.fullnameOverride -}}
{{- .Values.nodewatcher.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.nodewatcher.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.nodewatcher.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{- define "nomidot.server.fullname" -}}
{{- if .Values.server.fullnameOverride -}}
{{- .Values.server.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.server.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.server.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

<<<<<<< HEAD
=======
  
<<<<<<< HEAD
>>>>>>> 238bd72... prismagraphql config added.
=======
{{- define "nomidot.nodewatcher.fullname" -}}
{{- if .Values.nodewatcher.fullnameOverride -}}
{{- .Values.nodewatcher.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.nodewatcher.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.nodewatcher.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

>>>>>>> 35317fc... added nodewatcher deployemten
=======
>>>>>>> 6233916... added server deployemten
{{/*  
Config for Prisma
*/}}
{{- define "nodewatcher.prisma-config" }}
port: 4466
databases:
<<<<<<< HEAD
<<<<<<< HEAD
  {{ .Values.nodewatcher.dbName }}:
=======
  default:
>>>>>>> 238bd72... prismagraphql config added.
=======
  {{ .Values.nodewatcher.dbName }}:
>>>>>>> 0437e02... nodeSelector and new values file for prod
    connector: postgres
    host: 127.0.0.1
    user: {{ .Values.nodewatcher.dbUser }}
    password: {{ .Values.nodewatcher.dbPassword }}
    rawAccess: true
    port: 5432
    migrations: true
    connectionLimit: 5
{{- end }}
<<<<<<< HEAD
=======

>>>>>>> 8ba937f... fv-wip-01
=======
>>>>>>> 238bd72... prismagraphql config added.