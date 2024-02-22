{{/* Define the secrets */}}
{{- define "sheetable.secrets" -}}
---

apiVersion: v1
kind: Secret
type: Opaque
metadata:
  name: sheetable-secrets
{{- $sheetableprevious := lookup "v1" "Secret" .Release.Namespace "sheetable-secrets" }}
{{- $api_secret := "" }}
data:
  {{- if $sheetableprevious}}
  API_SECRET: {{ index $sheetableprevious.data "API_SECRET" }}
  {{- else }}
  {{- $api_secret := randAlphaNum 32 }}
  API_SECRET: {{ $api_secret | b64enc }}
  {{- end }}

{{- end -}}
