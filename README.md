Backend API - ingress

This  backend is powered by Kubernetes. Each micro services is a pod (scalable horizontally) and each has its own Bitbucket repo.

While this allows us to deploy each service as per changes made to it, it sounds preferable to manage the ingress centrally.

Whenever a new backend service is added, this main API will need to be updated to add the new routes.

This can maybe be automated late, but for now should be ok since adding micro-services is not a trivial event anyway.

To deploy changes, you can either:
1. Make changes to the yml file
2. run `kubectl apply --validate=true   -f kubernetes/`

Assumptions:
1. A cluster exists
2. you have user credntials on your machine, and can run CLI commands in an authenticated mode
3. the global static IP kubernetes.io/ingress.global-static-ip-name: betitlity-user-backend-ip exists
4. the micro-service you are adding is already deployed
