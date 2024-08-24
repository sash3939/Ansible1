#!/bin/bash

# Название Docker-образа
IMAGE_NAME="ansible-test-env"

# Список контейнеров
CONTAINERS=("fedora" "centos7" "ubuntu")

# Playbook для выполнения
PLAYBOOK="site.yml"

# Файл инвентаря
INVENTORY="prod.yml"

# Функция для поднятия контейнеров
start_containers() {
  echo "Запуск Docker-контейнеров..."
  
  for container in "${CONTAINERS[@]}"; do
    docker run -d --name "$container" "$IMAGE_NAME"
    if [ $? -ne 0 ]; then
      echo "Ошибка при запуске контейнера $container"
      exit 1
    fi
    echo "Контейнер $container запущен."
  done

  echo "Все контейнеры запущены."
}

# Функция для остановки и удаления контейнеров
stop_containers() {
  echo "Остановка и удаление Docker-контейнеров..."
  
  for container in "${CONTAINERS[@]}"; do
    docker stop "$container" && docker rm "$container"
    if [ $? -ne 0 ]; then
      echo "Ошибка при остановке или удалении контейнера $container"
      exit 1
    fi
    echo "Контейнер $container остановлен и удален."
  done

  echo "Все контейнеры остановлены и удалены."
}

# Функция для выполнения Ansible Playbook
run_ansible_playbook() {
  echo "Запуск Ansible playbook..."
  
  ansible-playbook -i "$INVENTORY" "$PLAYBOOK"
  if [ $? -ne 0 ]; then
    echo "Ошибка при выполнении Ansible playbook"
    stop_containers
    exit 1
  fi

  echo "Ansible playbook успешно выполнен."
}

# Основной скрипт
start_containers
run_ansible_playbook
stop_containers

echo "Скрипт завершен."
