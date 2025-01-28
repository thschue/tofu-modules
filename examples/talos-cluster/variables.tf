variable "wait_for_cluster_cmd" {
  description = "Custom local-exec command to execute for determining if the Talos cluster is healthy. Cluster endpoint will be available as an environment variable called ENDPOINT"
  type        = string
  default     = "for i in `seq 1 60`; do curl -k -o /dev/null -s -w '%%{http_code}' $ENDPOINT/healthz | grep -q '401' && exit 0 || true; sleep 5; done; echo TIMEOUT && exit 1"
}

variable "wait_for_cluster_interpreter" {
  description = "Custom local-exec command line interpreter for the command to determining if the eks cluster is healthy."
  type        = list(string)
  default     = ["/bin/sh", "-c"]
}