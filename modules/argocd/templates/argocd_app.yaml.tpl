applications:
  ${name}-deployment:
    namespace: ${namespace}
    project: ${project}
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
  ${name}:
    namespace: ${namespace}
    clusterResourceWhitelist:
    - group: '*'
      kind: '*'
    sourceRepos:
    - '*'
    destinations:
    - server: '*'
      namespace: '*'

