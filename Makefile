.PHONY: minikube airflow up stop delete

minikube/start:
	minikube start
	nohup minikube mount ./dags:/mnt/airflow/dags >/dev/null 2>&1 &

minikube/stop:
	minikube stop

airflow/up:
	helm repo add apache-airflow https://airflow.apache.org
	helm repo update
	helm upgrade \
		--install airflow apache-airflow/airflow \
    --set dags.gitSync.enabled=true \
    --set dags.gitSync.repo=https://github.com/miem-refugees/sauron-eye.git \
	  --debug \
		--create-namespace \
		--namespace airflow
	nohup kubectl port-forward svc/airflow-webserver 8080:8080 --namespace airflow >/dev/null 2>&1 &

airflow/down:
	helm delete airflow --namespace airflow

up: minikube/start airflow/up
	@echo "Deployment complete. Airflow UI should be available at http://localhost:8080"

down: minikube/stop
	@echo "Minikube stopped"

delete: airflow/down minikube/stop
	@echo "All resources deleted."
