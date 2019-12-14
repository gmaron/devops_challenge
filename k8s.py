from kubernetes import client, config
import os

class Kubernetes:

    def __init__(self):
        config.load_kube_config()
        self.conf = client.Configuration()
        self.conf.host = "http://localhost:8080"
        self.api = client.CoreV1Api()

    def get_nodes(self) -> []:

        try:
            return [ns for ns in self.api.list_namespace().items]
        except Exception as e:
            print(e)
            return []


if __name__ == "__main__":
    kubernetes = Kubernetes()
    print(kubernetes.get_nodes())
