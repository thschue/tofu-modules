applications:
  platform-deployment:
    namespace: ${namespace}
    project: platform
    source:
      repoURL: ${git_repo_url}
      targetRevision: ${git_repo_revision}
      path: ${git_repo_path}
    destination:
      server: "https://kubernetes.default.svc"
      namespace: ${namespace}
    syncPolicy:
      automated:
        prune: true
        selfHeal: true
      syncOptions:
      - CreateNamespace=true
projects:
  platform:
    namespace: ${namespace}
    description: Core Platform Components
    clusterResourceWhitelist:
    - group: '*'
      kind: '*'
    sourceRepos:
    - '*'
    destinations:
    - server: '*'
      namespace: '*'

