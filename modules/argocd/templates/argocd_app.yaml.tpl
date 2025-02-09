applications:
  %{~ for app in applications  ~}
  ${app.name}-deployment:
    namespace: ${namespace}
    project: ${app.project}
    source:
      repoURL: ${app.repo}
      targetRevision: ${app.revision}
      path: ${app.path}
    destination:
      server: "https://kubernetes.default.svc"
      namespace: ${namespace}
    syncPolicy:
      automated:
        prune: true
        selfHeal: true
      syncOptions:
      - CreateNamespace=true
  %{~ endfor ~}
projects:
  %{~ for project in projects  ~}
  ${project}:
    namespace: ${namespace}
    clusterResourceWhitelist:
    - group: '*'
      kind: '*'
    sourceRepos:
    - '*'
    destinations:
    - server: '*'
      namespace: '*'
    %{~ endfor ~}

