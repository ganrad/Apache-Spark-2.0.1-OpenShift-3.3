# Apache Spark on OpenShift v3.3
### Run Apache Spark master (2.0.1) within a Docker container on OpenShift Container Platform v3.3 (or above)

#### Instructions for deploying to OpenShift Container Platform 3.3 (or above)
1. Clone this git repository.  And copy the GIT URL to your GIT repo.  
2. Log into OpenShift via CLI (or Web UI)  
3. Create a new project.  
  **CLI command:** _oc new-project spark_
4. Next, create a new application.  
  **CLI command:** _oc new-app [Path to GIT URL .git] --name=spark-master_  
5. Get a list of all services.  
  **CLI command:** _oc get svc_. Note down the service name. (Note: The Apache Spark master service listens on port 7077 & Spark Web UI listens on port 8080.)    
6. Expose the service via a route.  
  **CLI command:** _oc expose svc [service name]_    
7. Log into the Web UI, go to the overview tab & click on the route name. This should open a new browser tab with the Apache Spark server Web UI.  


#### Optional Steps:
1. List all pods - oc get pods  
2. Tail/View the log for the build/deploy pods - oc logs -f [Name or ID of build or deploy pod]  

