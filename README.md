# Око Саурона

## Обзор

Сервис для получение актуальных геоданных

## Локальная разработка

1. Установить зависимости:

* [Docker](https://www.docker.com)
* [Minikube](https://kubernetes.io/ru/docs/tasks/tools/install-minikube/)
* [Helm](https://helm.sh)
* [Python 3.13](https://www.python.org)

MacOS:

```bash
brew install minikube kubectl helm
```

2. Запуск локальной среды minikube:

```bash
minikube start
```

3. Запуск используя Makefile

`make deploy` - Поднятие



### Гайд по production-окружению:

https://airflow.apache.org/docs/helm-chart/stable/production-guide.html#webserver-secret-key
