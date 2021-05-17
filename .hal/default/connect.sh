#!/bin/bash
kubectl --context minikube --kubeconfig /home/spinnaker/.kube/config -n=spinnaker port-forward $(kubectl --context minikube --kubeconfig /home/spinnaker/.kube/config -n=spinnaker get po -l=cluster=spin-deck -o=jsonpath='{.items[0].metadata.name}') 9000 &
kubectl --context minikube --kubeconfig /home/spinnaker/.kube/config -n=spinnaker port-forward $(kubectl --context minikube --kubeconfig /home/spinnaker/.kube/config -n=spinnaker get po -l=cluster=spin-gate -o=jsonpath='{.items[0].metadata.name}') 8084