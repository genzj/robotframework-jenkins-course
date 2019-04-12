# 1. create jenkins service account

kubectl create serviceaccount jenkins


# 2. get its access token:

kubectl get serviceaccounts jenkins -o yaml

# change secret name according to output of last command
kubectl get secret jenkins-token-wnlqc -o yaml

# copy base64 encoded token then decode it
echo "xxxxxx" | base64 --decode


# you can also put all things in one line:

kubectl get secret "$(kubectl get serviceaccounts jenkins -o jsonpath="{.secrets[0].name}")" -o jsonpath='{.data.token}' | base64 --decode ; echo 
